### A Pluto.jl notebook ###
# v0.19.11

using Markdown
using InteractiveUtils

# ╔═╡ bf6e6148-21a9-11ed-02e4-a7807f94c555
begin
    import Pkg
    # activate the shared project environment
    Pkg.activate(Base.current_project())
    # instantiate, i.e. make sure that all packages are downloaded
    Pkg.instantiate()

    using Plots, PlutoUI, ImplicitPlots, DynamicPolynomials
end

# ╔═╡ 1595beea-a64f-4d1e-aab4-08461a654b25
begin
	@polyvar x y
	f = y^2 - x^3 - x * 0 - 7
	implicit_plot(f; 
		title="secp256k1", 
		background_color="black",
		legend=false, 
		xticks=0, 
		yticks=0)
end

# ╔═╡ Cell order:
# ╠═bf6e6148-21a9-11ed-02e4-a7807f94c555
# ╠═1595beea-a64f-4d1e-aab4-08461a654b25
