using Plots, LaTeXStrings, Distributions;
pyplot();

#####################################################
# useful definitions
invsq2pi = 1/sqrt(2*π)

# useful functions
G(x)     = pdf(Normal(), x)
Φ(x)     = cdf(Normal(), x)
#####################################################

function fh(σh,γ,ε)
    x = σh/γ
    Z = ε + (1 - 2ε)*Φ(x)
    return (1 - 2ε)*G(x) / Z
end

# # w ⋅ Δw, must always be positve, obviously
# function gh(σh,γ,ε)
#     x = σh/γ
#     Z = ε + (1 - 2ε)*Φ(x)
#     return γ^2 * (1 - 2ε)*G(x) * x / Z
# end

plot()

ε  = 0.2
xi  = linspace(-10,10,10000)
for γ in [100., 10., 5., 2., 0.5] # ρ ≈ [0.1, 0.3, 0.6, 0.9]
    fi = [fh(x, γ, ε) for x in xi]
    plot!(xi, fi, label=L"$\gamma = $" * "$(γ)")
end

annotate!([(-8, 0.35, text("discordance", 10,:black, :center)),
           (+8, 0.35, text("concordance", 10,:black, :center)),
           (0., 0.08, text("region of doubt", 10,:black, :center))])
# scatter!([-8, 0., 8], [0.34, 0.065, 0.34], marker = (:hline, 60, 0.8, :blue), label="")
# scatter!([-8, 0., 8], [0.35, 0.08, 0.35], marker = (:hline, :50, 0.2, :blue), series_annotations=["discordance", "region of doubt", "concordance"])


plot!(legend= :topright) # title = "Modulation Function, " * L"$\varepsilon = $" * "$ε", 
plot!(xaxis = (L"$\frac{h \sigma}{\gamma}$", (-10., 10.), -10:2.:10.))
plot!(yaxis = (L"$F_{mod}$", (0., 0.6), 0:0.1:0.6) )

savefig("../images/modfunc.png")
