### A Pluto.jl notebook ###
# v0.19.11

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

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

# ╔═╡ 0722a8f7-c8f8-4fba-82fa-0c1fd87c5f3f
@bind w Slider(0.0:0.1:1.0)

# ╔═╡ 9b58ffbb-19ca-4735-a741-ee9027a22b9b
@bind b Slider(1:10)

# ╔═╡ 0d72d3a8-273d-430c-831b-c029676291c7
md"""$\hat{y} = mx + b$"""

# ╔═╡ 81b3dfe8-f29b-42b4-bb2b-4264172e0dfb
begin
	
	yhat = x -> (1/2)x + 5
	
	plot(yhat, label="yhat")
	plot!((x) -> w*x + b, label="pred")
end

# ╔═╡ Cell order:
# ╠═bf6e6148-21a9-11ed-02e4-a7807f94c555
# ╠═1595beea-a64f-4d1e-aab4-08461a654b25
# ╠═0722a8f7-c8f8-4fba-82fa-0c1fd87c5f3f
# ╠═9b58ffbb-19ca-4735-a741-ee9027a22b9b
# ╟─0d72d3a8-273d-430c-831b-c029676291c7
# ╠═81b3dfe8-f29b-42b4-bb2b-4264172e0dfb
