using DataFrames

essential  = ["politics_new"; "country_current"; "x5f_new2_ipaddress"; "x5f_part1_1";"x5f_part1_2";"x5f_part1_3";"x5f_part1_4";"x5f_part1_5";"x5f_part1_6";"x5f_part1_7";"x5f_part1_8";"x5f_part1_9";"x5f_part1_10";"x5f_part1_11";"x5f_part1_12";"x5f_part1_13";"x5f_part1_14";"x5f_part1_15";"x5f_part1_16";"x5f_part2_1";"x5f_part2_2";"x5f_part2_3";"x5f_part2_4";"x5f_part2_5";"x5f_part2_6";"x5f_part2_7";"x5f_part2_8";"x5f_part2_9";"x5f_part2_10";"x5f_part2_11";"x5f_part2_12";"x5f_part2_13";"x5f_part2_14";"x5f_part2_15";"x5f_part2_16"];
relevant   = [essential; "userid"; "byear"; "x5f_new2_completedtime";"religion_raised";"religion_current";"race_black";"race_eastasian";"race_latino";"race_middleeast";"race_nativeamerican";"race_southasian";"race_white";"race_other";"race_decline";"sex";"political_attention";"country_current";"country_diff";"religion_attend";"childhood_social_class";"education"];
questions  = ["x5f_part1_1";"x5f_part1_2";"x5f_part1_3";"x5f_part1_4";"x5f_part1_5";"x5f_part1_6";"x5f_part1_7";"x5f_part1_8";"x5f_part1_9";"x5f_part1_10";"x5f_part1_11";"x5f_part1_12";"x5f_part1_13";"x5f_part1_14";"x5f_part1_15";"x5f_part1_16";"x5f_part2_1";"x5f_part2_2";"x5f_part2_3";"x5f_part2_4";"x5f_part2_5";"x5f_part2_6";"x5f_part2_7";"x5f_part2_8";"x5f_part2_9";"x5f_part2_10";"x5f_part2_11";"x5f_part2_12";"x5f_part2_13";"x5f_part2_14";"x5f_part2_15";"x5f_part2_16"];

padict        = Dict("Very Liberal" => 1, "Liberal" => 2, "Slightly Liberal" => 3, "Moderate/middle-of-the-road" => 4, "Slightly Conservative" => 5, "Conservative" => 6, "Very Conservative" => 7, "Libertarian" => 8, "Other" => 9, "Don't know/not political" => 0)
padictreverse = Dict(value => key for (key, value) in padict)
paValues      = ["Very Liberal", "Liberal", "Slightly Liberal", "Moderate/middle-of-the-road", "Slightly Conservative", "Conservative", "Very Conservative"]

mfdict        = Dict("Harm" => 1, "Care" => 2, "Ingroup" => 3, "Authority" => 4, "Purity" => 5)
mfdictreverse = Dict(value => key for (key, value) in mfdict)

"Simplify a string name to use it as a filename"
simplifyname(s::String) = 
    lowercase(join(map(x -> s[x] ∈  [' ', '-', ''', '/'] ? "" : s[x], 1:length(s))))

"Just a simple function to define 2-char codes for strings of countries' names"
function loccode(str::String)
    code = str[(1:length(str))[25 .>= ['Z' - i for i in str] .>= 0]]
    if length(code) < 2
        code *= uppercase(str[2])
    end
    
    return code[1:2]
end

"Group the question answers by their respective moral dimension following questionnaire-keys.md"
function groupMoralDims(df::DataFrame)
    pos    = findin(names(df), [:x5f_part1_1, :x5f_part2_16])
    scores = convert(Array{Float64}, df[pos[1]:pos[2]])

    # [mean(scores[:, [(3i-1):(3i+1); (3i+15):(3i+17)]], 2) for i in 1:5]
    return [mean(scores[:, [2:4  ; 18:20]], 2) mean(scores[:, [5:7  ; 21:23]], 2) mean(scores[:, [8:10 ; 24:26]], 2) mean(scores[:, [11:13; 27:29]], 2) mean(scores[:, [14:16; 30:32]], 2)]
end

"Parse a enourmous DataFrame eliminating 'mustBeComplete' fields that have NA values and selecting only the 'doNotErase' fields"
function getParsedDF(df::DataFrame; mustBeComplete::Array{String}=relevant, doNotErase::Array{String}=essential)

    parsed = df[:, parse.(mustBeComplete)];

    for i in doNotErase
        deleterows!(parsed, find(isna.(parsed[:, parse(i)])))
    end

    return parsed[:, parse.(mustBeComplete)]
end

function normalizeScores!(scores::Matrix{Float64})
    for i in 1:size(scores, 1)
        @inbounds scores[i, :] /= norm(scores[i, :])
    end
end

function normalizeScores!(scores::Array{Float64, 3})
    for i in 1:size(scores, 1) for j in 1:size(scores, 3)
        @inbounds scores[i, :, j] /= norm(scores[i, :, j])
    end end
end

function normalizeScores(scores::Matrix{Float64})
    normscores = copy(scores)

    for i in 1:size(normscores, 1)
        @inbounds normscores[i, :] /= norm(normscores[i, :])
    end

    return normscores
end


"Get overlaps defined over positive range between two score matrices"
function getOverlaps(g1Score::Matrix{Float64}, g2Score::Matrix{Float64}; normalize::Bool = true)
    if normalize 
        return getOverlapsPositiveNormalized(g1Score, g2Score)
    else
        return getOverlapsPositiveNotNormalized(g1Score, g2Score)
    end
end

"Get normalized overlaps defined over positive range between two score matrices"
function getOverlapsPositiveNormalized(g1Score::Matrix{Float64}, g2Score::Matrix{Float64})
    lGroup1 = size(g1Score, 1)
    lGroup2 = size(g2Score, 1)
    lQuestions = size(g1Score, 2)

    # initialize empty Float64 vector
    gOverlaps = Array{Float64}(0)

    # run only over upper triangle 
    for i in 1:lGroup1
        for j in 1:lGroup2
            
            # normalization factor
            n = norm(g1Score[i, :]) * norm(g2Score[j, :])

            # take inner product of normalized answers and save
            foo = 0.
            for k in 1:lQuestions
                foo += g1Score[i, k] * g2Score[j, k]
            end

            # lQuestions questions, the range of gOverlaps would be [-lQuestions, lQuestions]
            append!(gOverlaps, foo / n)
        end
    end   

    return gOverlaps
end

"Get normalized overlaps defined over positive range between two score matrices"
function getOverlapsPositiveNotNormalized(g1Score::Matrix{Float64}, g2Score::Matrix{Float64})
    lGroup1 = size(g1Score, 1)
    lGroup2 = size(g2Score, 1)
    lQuestions = size(g1Score, 2)

    # initialize empty Float64 vector
    gOverlaps = Array{Float64}(0)

    # run only over upper triangle 
    for i in 1:lGroup1
        for j in 1:lGroup2
            
            # normalization factor
            n = norm(g1Score[i, :]) * norm(g2Score[j, :])

            # take inner product of normalized answers and save
            foo = 0.
            for k in 1:lQuestions
                foo += g1Score[i, k] * g2Score[j, k]
            end

            # lQuestions questions, the range of gOverlaps would be [-lQuestions, lQuestions]
            append!(gOverlaps, foo)
        end
    end   

    return gOverlaps
end

"Get overlaps defined over range [-1, 1] between two score matrices"
function getOverlapsSymmetric(g1Score::Matrix{Float64}, g2Score::Matrix{Float64})
    lGroup1 = size(g1Score, 1)
    lGroup2 = size(g2Score, 1)
    lQuestions = size(gScore, 2)

    # initialize empty Float64 vector
    gOverlaps = Array{Float64}(0)

    # run only over upper triangle 
    for i in 1:lGroup1
        for j in 1:lGroup2
            
            # take inner product of normalized answers and save
            foo = 0.
            for k in 1:lQuestions
                foo += g1Score[i, k] * g2Score[j, k]
            end

            # lQuestions questions, the range of gOverlaps would be [-lQuestions, lQuestions]
            append!(gOverlaps, foo / lQuestions)
        end
    end   

    return gOverlaps
end

"Get overlaps defined over range [-1, 1] of a given group inside a DataFrame with itself"
function getOverlapsSymmetric(qdf::DataFrame, group; field::Symbol = :politics_new)
   
    gScore = convert(Array{Float64}, qdf[qdf[field] .== group, 2:end]) * 2 / 5 - 1
    
    lGroup     = size(gScore, 1)
    lQuestions = size(gScore, 2)

    # initialize empty Float64 vector
    gOverlaps = Array{Float64}(0)

    # run only over upper triangle 
    for i in 1:lGroup
        for j in i+1:lGroup

            # take inner product of normalized answers and save
            foo = 0.
            for k in 1:lQuestions
                foo += gScore[i, k] * gScore[j, k]
            end

            # lQuestions questions, the range of gOverlaps would be [-lQuestions, lQuestions]
            append!(gOverlaps, foo / lQuestions)
        end
    end   

    return gOverlaps
end

"Get overlaps defined over range [-1, 1] of a score matrix with itself"
function getOverlapsSymmetric(gScore::Matrix{Float64})
    lGroup = size(gScore, 1)
    lQuestions = size(gScore, 2)

    # initialize empty Float64 vector
    gOverlaps = Array{Float64}(0)

    # run only over upper triangle 
    for i in 1:lGroup
        for j in i+1:lGroup
            
            # take inner product of normalized answers and save
            foo = 0.
            for k in 1:lQuestions
                foo += gScore[i, k] * gScore[j, k]
            end

            # lQuestions questions, the range of gOverlaps would be [-lQuestions, lQuestions]
            append!(gOverlaps, foo / lQuestions)
        end
    end   

    return gOverlaps
end

"Get overlaps defined over positive range between two score matrices and output a histogram"
function getOverlapsHistogram(g1Score::Matrix{Float64}, g2Score::Matrix{Float64}; normalized::Bool = true, edges::Range{Float64} = 0.:0.01:1.0)
    if normalized
        return getOverlapsHistogramNormalized(g1Score, g2Score, edges)    
    else
        return getOverlapsHistogramNotNormalized(g1Score, g2Score, edges)
    end
end

"Get overlaps (normalized) defined over positive range between two score matrices and output a histogram"
function getOverlapsHistogramNormalized(g1Score::Matrix{Float64}, g2Score::Matrix{Float64}, edges::Range{Float64})
    lGroup1 = size(g1Score, 1)
    lGroup2 = size(g2Score, 1)
    
    histweights = zeros(length(edges))  # weights of the histogram
    preciRange  = length(edges) - 1     # precision range

    for i in 1:lGroup1
        for j in 1:lGroup2

            # calculate normalized histogram (range [0,1])
            n = norm(g1Score[i, :]) * norm(g2Score[j, :])
            
            if !iszero(n)
                overlap = g1Score[i, :] ⋅ g2Score[j, :] / n
            
                # find position in histogram 
                pos = floor(Int, preciRange*overlap + 1)

                # store in the relevant weight position
                histweights[pos] += 1.
            end
        end
    end
        
    return histweights
end

"Get overlaps (not normalized) defined over positive range between two score matrices and output a histogram"
function getOverlapsHistogramNotNormalized(g1Score::Matrix{Float64}, g2Score::Matrix{Float64}, edges::Range{Float64})
    lGroup1 = size(g1Score, 1)
    lGroup2 = size(g2Score, 1)
    
    histweights = zeros(length(edges))  # weights of the histogram
    preciRange  = length(edges) - 1     # precision range

    for i in 1:lGroup1
        for j in 1:lGroup2

            n = norm(g1Score[i, :]) * norm(g2Score[j, :])
            
            if !iszero(n)
                overlap = g1Score[i, :] ⋅ g2Score[j, :]
            
                # find position in histogram 
                pos = floor(Int, preciRange*overlap + 1)

                # store in the relevant weight position
                histweights[pos] += 1.
            end
        end
    end
        
    return histweights
end

"No idea. Just trying to analyse some dates, months, years etc"
function analyseDates(mfdf::DataFrame)
    describe(mfqdf[:byear])
    ages = 2017 .- dropna(mfqdf[:byear])
    
    mean(ages), mode(ages), median(ages)
    
    dates = mfqdf[:x5f_new2_completedtime]
    dates = dropna(sort(dates))
    
    daymonthyear = [split(s, " ")[1] for s in dropna(dates)]
    year = [split(s, "/")[3] for s in dropna(daymonthyear)]
    
    dmy = sort([convert(String, i) for i in daymonthyear])
    
    countyear = countmap(year)
    countdmy = countmap(daymonthyear)
end

"Approximate Mean-Field distribution derived by RV, AS, JPJ, NC an used by JC"
distribMF(h, g) = 0.5g^2 * (1 - h^2) * exp(-g*(1 - h))

"Get analytical expected value ``⟨h⟩`` of ``P(h|γ)`` (mean-field)"
meanh(g::Float64)  = 2exp(-g) * (sinh(g) - 3cosh(g)/g + 3sinh(g)/g^2)

"Get analytical expected value ``⟨h^2⟩`` of ``P(h|γ)`` (mean-field)"
meanh2(g::Float64) = 2exp(-g) * (cosh(g) - 5sinh(g)/g + 12cosh(g)/g^2 - 12sinh(g)/g^3)

# "Exact (without normalization) Mean-Field distribution derived by RV, AS, JPJ, NC an used by JC"
# exactMFdist(h, kα, δ, m, r) = (1 - h^2) * exp(kα * ( (1+δ)*m*h/2 - (1-δ)*r*abs(h)/2) )

# exactCgamma(g::Float64) = 4 * (g * cosh(g) - sinh(g)) * g^(-3)

"Change the parameters for a Gamma(k, θ) distribution with the arrival of new data (n, m)"
changeparams(k::Real, θ::Real, n::Real, m::Real) = (k+2n, θ/(1 + θ*(n-m)))

"Fit the MF distribution using Bayes' theorem with a conjugate Gamma prior with parameters ``(k, θ)``"
fitMF(overlaps::Array{Float64, 1}; k=5., θ=10.) = Gamma(changeparams(k, θ, size(overls, 1), sum(overls))...)

"Calculate fraction ``γ / m`` of optimal fit for the MF distribution"
function gsubm(overlaps::Array{Float64, 1})
    g = mode(fitMF(overlaps))

    return g / meanh(g)
end

# for i in 1:5 
#     for j in (i+1):5 
#         for k in (j+1):5
#             plot(title = "$i$j$k")

#             for pa in 1:7
#                 scatter!([masspoints[pa, i]], [masspoints[pa, j]], [masspoints[pa, k]], label = "$pa", m = 6, markerstrokealpha = 0.2)
#             end

#             eval(parse("p$i$j$k = plot!();"))
#         end
#     end
# end

"Estimate the integral of 'samples' from continuous probabilities by summing the trapezoids ``(xj, P(xj))``"
function trapSum(xj, yj; x0 = 0., xend = 1.)
    summ = 0
    l    = length(xj)

    for i in 1:(l-1)
       summ += (xj[i+1] - xj[i])*(yj[i] + yj[i+1])/2
    end

    y0 = (yj[2] - yj[1])/(xj[2] - xj[1]) * (x0 - xj[1]) + yj[1]
    summ += (xj[1] - x0)*(y0 + yj[1])/2

    yend = (yj[end] - yj[end-1])/(xj[end] - xj[end-1]) * (xj[end] - xend) - yj[end]
    summ += (xend - xj[end])*(yend + yj[end])/2

    return summ
end


# "Estimate the integral of 'samples' from continuous probabilities by summing the trapezoids ``(xj, P(xj))``"
# function trapSumEqualSpaced(x1, xstep, yj; x0 = 0., xend = 1.)
#     summ = 0
#     l    = length(yj)

#     summ = xstep*sum(y for y in yj)/2

#     y0 = (yj[2] - yj[1])/xstep * (x0 - x1) + yj[1]
#     summ += (x1 - x0)*(y0 + yj[1])/2

#     xbfend = x1 + (l-1)*xstep

#     yend = (yj[end] - yj[end-1])/xstep * (xbfend - xend) - yj[end]
#     summ += (xend - xbfend)*(yend + yj[end])/2

#     return summ
# end