using Plots, LaTeXStrings; pyplot();

include("load-antiferro.jl");

δrange = 0:0.01:1;
εrange = 0:0.01:1;

β      = 10.
ρ      = 0.5

plotHeatmapδε(δrange, εrange, β, ρ, x0 = [0.9, 0.1], plotfull = true)
savefig("phasediagram-full-beta10-rho05-initial0901.png")

plotFreeEnergy(β, 0.25, 0.6, ρ, scale = 0.1)
savefig("freeenergy-beta10-delta25-eps6-rho05.png")

plotFreeEnergy(β, 0.8, 0.2, ρ, scale = 0.1)
savefig("freeenergy-beta10-delta8-eps2-rho05.png")

plotFreeEnergy(β, 0.8, 0.8, ρ, scale = 0.1)
savefig("freeenergy-beta10-delta8-eps8-rho05.png")
