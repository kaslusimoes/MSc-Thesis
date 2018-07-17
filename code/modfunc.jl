using Plots, LaTeXStrings, SpecialFunctions;
pyplot();

#####################################################
# useful definitions
isq2pi   = 1/sqrt(2*π)
sqrt2    = sqrt(2)

#####################################################
# useful functions
gsq(ρ) = sqrt(1 - ρ^2)/ρ
H(x)    = 0.5*erfc(x/sqrt2)

# #####################################################
# # modulation function (divided by gamma)
#
# function fmod(h,ρ)
#     gm = gsq(ρ)
#     return isq2pi * exp(-0.5*(h/gm)^2) / H(-h/gm)
# end

# plot()

# xi = linspace(-10,10,10000)
# for ρi in [0, 0.3, 0.6, 0.9]
#     fi = [fmod(x, ρi) for x in xi]
#     plot!(xi, fi, label=L"$\rho = $" * "$(ρi)")
# end

# plot!(title = "Modulation Function", legend= :topright)
# plot!(xaxis = (L"$\frac{h \sigma}{\gamma}$", (-10., 10.), -10:2.:10.),
#       yaxis = (L"$\frac{F_{mod}}{\gamma}$", 0.:5:20) )
# savefig("../Data/figures/modfunc.png")

#####################################################
# modulation function with noise ϵ (divided by gamma)
#
function fmodeps(h,ρ,ϵ)
    gm      = gsq(ρ)
    om2eps  = 1 - 2ϵ
    return isq2pi * om2eps * exp(-0.5*(h/gm)^2) / ( ϵ + om2eps*H(-h/gm) )
end

plot()

εi  = 0.2
xi  = linspace(-10,10,10000)
for ρi in [0.1, 0.3, 0.6, 0.9]
    fi = [fmodeps(x, ρi, εi) for x in xi]
    plot!(xi, fi, label=L"$\rho = $" * "$(ρi)")
end

annotate!([(-8, 0.35, text("discordance", 10,:black, :center)),
           (+8, 0.35, text("concordance", 10,:black, :center)),
           (0., 0.08, text("region of doubt", 10,:black, :center))])
# scatter!([-8, 0., 8], [0.34, 0.065, 0.34], marker = (:hline, 60, 0.8, :blue), label="")
#scatter!([-8, 0., 8], [0.35, 0.08, 0.35], marker = (:hline, :50, 0.2, :blue), series_annotations=["discordance", "region of doubt", "concordance"])


plot!(title = "Modulation Function", legend= :topright)
plot!(xaxis = (L"$\frac{h \sigma}{\gamma}$", (-10., 10.), -10:2.:10.),
      yaxis = (L"$\frac{F_{mod}}{\gamma}$", (0., 0.6), 0:0.1:0.6) )

savefig("../images/modfunc.png")#, dpi = 300)
