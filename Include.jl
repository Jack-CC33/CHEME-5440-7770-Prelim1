# setup path
_PATH_TO_PROJECT = pwd()
_PATH_TO_SRC = joinpath(_PATH_TO_PROJECT, "src")
_PATH_TO_CONFIG = joinpath(_PATH_TO_PROJECT, "config")
_PATH_TO_OUTPUT = joinpath(_PATH_TO_PROJECT, "output")

# import PKG, activate the project and instaintiate -
import Pkg
Pkg.activate(_PATH_TO_PROJECT)
Pkg.instantiate()

# load packages -
using DifferentialEquations
using Plots
using LaTeXStrings
using TOML
using Logging
using DelimitedFiles

# my codes -

# Control.jl
path_to_control = joinpath(_PATH_TO_SRC,"Control.jl")
include("$(path_to_control)")

# Problem.jl
path_to_problem = joinpath(_PATH_TO_SRC,"Problem.jl")
include("$(path_to_problem)")

# Rate.jl
path_to_rate = joinpath(_PATH_TO_SRC,"Rate.jl")
include("$(path_to_rate)")



# my output

# Prelim1_Plot.png
path_to_plot = joinpath(_PATH_TO_OUTPUT,"Prelim1_Plot.png")