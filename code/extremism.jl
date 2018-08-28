using DataFrames, Plots, Distributions, LaTeXStrings, CSV; pyplot();

include("load-extremism.jl");

# filename = "rv"
filename = "lsimoes"

df = CSV.read("moralmatrix-$filename.csv", types = [Int, Float64, Float64, Float64, Float64, Float64]);

# we eliminate all non-trivial p.a. ("Libertarian":8, "Don't know/not political":0 and "Other":9)
# maybe that is not the right thing to do, because on other analyzis they seemed to be on the same political spectrum..
df = df[(df[:pa] .< 8) .& (df[:pa] .> 0), :]

zeitgeistc  = sum([convert(Array{Float64}, df[df[:pa] .== 6, 2:end]); convert(Array{Float64}, df[df[:pa] .== 7, 2:end])], 1)
zeitgeistc /= norm(zeitgeistc)

zeitgeistl  = sum([convert(Array{Float64}, df[df[:pa] .== 1, 2:end]); convert(Array{Float64}, df[df[:pa] .== 2, 2:end])], 1)
zeitgeistl /= norm(zeitgeistl)

zeitgeistm  = sum(convert(Array{Float64}, df[df[:pa] .== 4, 2:end]), 1)
zeitgeistm /= norm(zeitgeistm)

zeitgeistt  = mean(convert(Array{Float64}, df[:, 2:end]), 1)
zeitgeistt /= norm(zeitgeistt)

k0 = 5
θ0 = 10

hi = collect(-1:0.001:1)

kpost = k0
θpost = θ0

for i in 1:7
    # Total Population

    overlst = getOverlaps(convert(Array{Float64}, df[df[:pa] .== i, 2:end]), zeitgeistt)
    kpost, θpost = changeparams(k0, θ0, size(overlst, 1), sum(overlst))
    eval(parse("posterior$(i)t = Gamma(kpost, θpost)"))    
    histogram(overlst, label = "pa = $i", nbins=100, normalize=true, linealpha = 0.2)    
    plot!(hi, map(x -> distribMF(x, mode(eval(parse("posterior$(i)t")))), hi), label="fit", color="red")    
    eval(parse("p$(i)t = plot!(xlims = (0.5, 1.), legend=:topleft)"))

    # Conservatives 

    overlsc = getOverlaps(convert(Array{Float64}, df[df[:pa] .== i, 2:end]), zeitgeistc)
    kpost, θpost = changeparams(k0, θ0, size(overlsc, 1), sum(overlsc))
    eval(parse("posterior$(i)c = Gamma(kpost, θpost)"))    
    histogram(overlsc, label = "pa = $i", nbins=100, normalize=true, linealpha = 0.2)    
    plot!(hi, map(x -> distribMF(x, mode(eval(parse("posterior$(i)c")))), hi), label="fit", color="red")    
    eval(parse("p$(i)c = plot!(xlims = (0.5, 1.), legend=:topleft)"))

    # Liberals

    overlsl = getOverlaps(convert(Array{Float64}, df[df[:pa] .== i, 2:end]), zeitgeistl)
    kpost, θpost = changeparams(k0, θ0, size(overlsl, 1), sum(overlsl))
    eval(parse("posterior$(i)l = Gamma(kpost, θpost)"))
    histogram(overlsl, label = "pa = $(i)", nbins=100, normalize=true, linealpha = 0.2)
    plot!(hi, map(x -> distribMF(x, mode(eval(parse("posterior$(i)l")))), hi), label="fit", color="red")
    eval(parse("p$(i)l = plot!(xlims = (0.5, 1.), legend=:topleft)"))

    # Moderates

    overlsm = getOverlaps(convert(Array{Float64}, df[df[:pa] .== i, 2:end]), zeitgeistm)
    kpost, θpost = changeparams(k0, θ0, size(overlsm, 1), sum(overlsm))
    eval(parse("posterior$(i)m = Gamma(kpost, θpost)"))    
    histogram(overlsm, label = "pa = $i", nbins=100, normalize=true, linealpha = 0.2)    
    plot!(hi, map(x -> distribMF(x, mode(eval(parse("posterior$(i)m")))), hi), label="fit", color="red")    
    eval(parse("p$(i)m = plot!(xlims = (0.5, 1.), legend=:topleft)"))
end

xs = [string("pa ",i) for i = 1:7]

yc = [eval(parse("mean(posterior$(i)c)")) for i in 1:7]
yl = [eval(parse("mean(posterior$(i)l)")) for i in 1:7]
ym = [eval(parse("mean(posterior$(i)m)")) for i in 1:7]
yt = [eval(parse("mean(posterior$(i)t)")) for i in 1:7]

ec = [eval(parse("mean(posterior$(i)c) - quantile(posterior$(i)c, 0.01)")) for i in 1:7]
el = [eval(parse("mean(posterior$(i)l) - quantile(posterior$(i)l, 0.01)")) for i in 1:7]
em = [eval(parse("mean(posterior$(i)m) - quantile(posterior$(i)m, 0.01)")) for i in 1:7]
et = [eval(parse("mean(posterior$(i)t) - quantile(posterior$(i)t, 0.01)")) for i in 1:7]

psc = scatter(xs, yc, yerror = ec, marker = :hline, c = :red, label = L"$\mathcal{Z}$: " * "Conservatives", legend = :topleft, xticks = nothing);
psl = scatter(xs, yl, yerror = el, marker = :hline, c = :blue, label = L"$\mathcal{Z}$: " * "Liberals", legend = :topright, xticks = nothing);
psm = scatter(xs, ym, yerror = em, marker = :hline, c = :grey, label = L"$\mathcal{Z}$: " * "Moderates", legend = :topleft, xticks = nothing);
pst = scatter(xs, yt, yerror = et, marker = :hline, c = :darkorange, label = L"$\mathcal{Z}$: " * "Total Population");

pscm = scatter(xs, yc, marker = :o, markerstrokewidth = 0.8, c = :red, label = L"$\mathcal{Z}$: " * "Conservatives", legend = :topleft, xticks = nothing);
pslm = scatter(xs, yl, marker = :o, markerstrokewidth = 0.8, c = :blue, label = L"$\mathcal{Z}$: " * "Liberals", legend = :topright, xticks = nothing);
psmm = scatter(xs, ym, marker = :o, markerstrokewidth = 0.8, c = :grey, label = L"$\mathcal{Z}$: " * "Moderates", legend = :topleft, xticks = nothing);
pstm = scatter(xs, yt, marker = :o, markerstrokewidth = 0.8, c = :darkorange, label = L"$\mathcal{Z}$: " * "Total Population");



plot(psc, psl, psm, pst, layout = (4, 1), grid = false, ylims = (10, 100), ylabel = L"$\tilde{\beta}$", 
    yguidefontrotation = 20, yticks = 20:20:100, legendfont = 9)
savefig("../images/posteriorgamma4zeitgeists-line.png")

plot(pscm, pslm, psmm, pstm, layout = (4, 1), grid = false, ylims = (10, 100), ylabel = L"$\tilde{\beta}$",
    yguidefontrotation = 20, yticks = 20:20:100, legendfont = 9)
savefig("../images/posteriorgamma4zeitgeists.png")



pannc = plot(annotation = (0.5, 0.5, "Zeitgeist of Conservatives"), framestyle = :none)
pannl = plot(annotation = (0.5, 0.5, "Zeitgeist of Liberals"), framestyle = :none)
pannm = plot(annotation = (0.5, 0.5, "Zeitgeist of Moderates"), framestyle = :none)
pannt = plot(annotation = (0.5, 0.5, "Zeitgeist of Total Population"), framestyle = :none)

l = @layout [a{.05h};grid(2,3)]
phc = plot(pannc, p1c, p2c, p3c, p4c, p5c, p6c, layout = l, legend = :topleft)
savefig("../images/ph-conservatives.png")

l = @layout [a{.05h};grid(2,3)]
phl = plot(pannl, p1l, p2l, p3l, p4l, p5l, p6l, layout = l, legend = :topleft)
savefig("../images/ph-liberals.png")

l = @layout [a{.05h};grid(2,3)]
phm = plot(pannm, p1m, p2m, p3m, p4m, p5m, p6m, layout = l, legend = :topleft)
savefig("../images/ph-moderates.png")

l = @layout [a{.05h};grid(2,3)]
pht = plot(pannt, p1t, p2t, p3t, p4t, p5t, p6t, layout = l, legend = :topleft)
savefig("../images/ph-totalpop.png")