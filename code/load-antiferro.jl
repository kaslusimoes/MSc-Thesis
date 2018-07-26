function xyaprox(x::Array{Float64}, β, δ, ε, ρA)
    ρB     = 1 - ρA
    xA, xB = x[:]

    βδ    = β * δ
    β1m2ε = β * (1 - 2ε)

    zA = βδ*xA + β1m2ε*xB
    zB = βδ*xB + β1m2ε*xA

    mA = coth(zA) - 1/zA
    mB = coth(zB) - 1/zB

    return [ρA*mA, ρB*mB]
end

function freeenergy(x::Array{Float64, 1}, β::Float64, δ::Float64, ε::Float64, ρA::Float64)
    ρB     = 1 - ρA
    xA, xB = x[:]

    βδ    = β * δ
    β1m2ε = β * (1 - 2ε)

    zA = βδ*xA + β1m2ε*xB
    zB = βδ*xB + β1m2ε*xA

    return βδ*(xA^2 + xB^2)/2 + β1m2ε*xA*xB - ρA*log(sinh(zA)/zA) - ρB*log(sinh(zB)/zB)
end

function logistic(x::Array{Float64,1}, β::Float64, δ::Float64, ε::Float64, ρA::Float64;
                  err::Float64 = 1e-6, niter::Int = 2000, α::Float64 = 0.05)
    t = 1.
    n = 0.

    if length(x) != 2 error("Fix length of x") end

    xnew = zeros(2.)
    @inbounds while t > err && n < niter

        # xnew[1] = (1-α)*x[1] + α*xaprox(x[1], x[2], βδA, βδB, βδAB, ρA)
        # xnew[2] = (1-α)*x[2] + α*yaprox(xnew[1], x[2], βδA, βδB, βδAB, ρA)
        xnew = (1-α)*x + α*xyaprox(x, β, δ, ε, ρA)

        t = norm(xnew - x)
        n += 1.

        x = xnew[:]
    end

    return [x; n]
end

function plotFreeEnergy(β::Float64, δ::Float64, ε::Float64, ρ::Float64; xrange::Range = -1:0.01:1, scale::Float64 = 1., plotnan::Bool = false, title::Bool = false)

    fxy  = [freeenergy([x, y], β, δ, ε, ρ) for x in xrange, y in xrange]
    if plotnan fnan = isnan.(fxy) end

    minf = NaNMath.minimum(fxy)
    maxf = NaNMath.maximum(fxy)
    println("min: ", minf, "\t max: ", maxf)

    lims = (minf, minf+scale*abs(minf-maxf))

    p = heatmap(xrange, xrange, fxy', xlabel = L"$m_A$", ylabel = L"$m_B$", clims = lims, c = :curl)
    if plotnan heatmap!(xrange, xrange, fnan, c = :green) end
    if title plot!( title = "β = $β, δ = $δ, ε = $ε, ρ = $ρ") end

    return p
end

function plotHeatmapδε(δrng::Range, εrng::Range, β::Float64, ρ::Float64; plotalt::Bool = false, plotfull::Bool = false, plotnans::Bool = false, c1::Symbol = :pu_or, c2::Symbol = :tempo, x0::Array{Float64, 1} = [0.05, 0.15], title::Bool = false)

    if length(x0) != 2 error("Fix length of x0") end

    mat = Array{Float64}(3, length(δrng), length(εrng))
    for (j, ε) in enumerate(εrng)
        for (i, δ) in enumerate(δrng)
            mat[:, i, j] = logistic(x0, β, δ, ε, ρ)
        end
    end

    if plotnans
        foonan = find(isnan, mat);
        inan   = Array{Int}(length(foonan), 3);

        for i in eachindex(foonan)
            inan[i, :] = [ind2sub(mat, foonan[i])...]
        end
        foonan = 0.

        nanlocs = [εrng[inan[1:2:end, 3]] δrng[inan[1:2:end, 2]]]
        inan = 0.
    end

    pann = plot(annotation = (0.5, 0.5, "β = $β, ρ = $ρ, initial = $x0"), framestyle = :none);
    p1   = heatmap(εrng, δrng, mat[1, :, :], xlabel = L"$\varepsilon$", ylabel = L"$\delta$", title = L"$m_A$", clims = (-ρ, ρ), color = c1);
    if plotnans
        scatter!(nanlocs[:, 1], nanlocs[:, 2], marker = :x, label = "NaNs", c = :green)
    end

    p2   = heatmap(εrng, δrng, mat[2, :, :], xlabel = L"$\varepsilon$", title = L"$m_B$", clims = (ρ-1, 1-ρ), color = c1);
    if plotnans
        scatter!(nanlocs[:, 1], nanlocs[:, 2], marker = :x, label = "NaNs", c = :green)
    end

    p3   = heatmap(εrng, δrng, mat[3, :, :], xlabel = L"$\varepsilon$", title = "iterations", color = c2);
    if plotnans
        scatter!(nanlocs[:, 1], nanlocs[:, 2], marker = :x, label = "NaNs", c = :green)
    end

    p1x2 = heatmap(εrng, δrng, mat[1, :, :] .* mat[2, :, :],
            xlabel = L"$\varepsilon$", ylabel = L"$\delta$", title = L"$m_A \times m_B$", clims = (-0.25, 0.25), color = c1);
    if plotnans
        scatter!(nanlocs[:, 1], nanlocs[:, 2], marker = :x, label = "NaNs", c = :green)
    end

    if plotalt && title
        l = @layout [a{.05h};grid(1,2)]
        p = plot(pann, p1x2, p3, layout = l)

        return p
    end

    if plotalt && !title
        p = plot(p1x2, p3, layout = (1, 2))

        return p
    end

    if plotfull && title
        l = @layout [a{.05h};grid(2,2)]
        p = plot(pann, p1, p2, p1x2, p3, layout = l)

        return p
    end

    if plotfull && !title
        p = plot(p1, p2, p1x2, p3, layout = (2, 2))

        return p
    end

    if title
        l = @layout [a{.05h};grid(1,2)]
        p = plot(pann, p1, p2, layout = l)

        return p
    end

    p = plot(p1, p2, layout = (1, 2))

    return p
end
