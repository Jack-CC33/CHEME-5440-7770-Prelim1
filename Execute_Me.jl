# Prelim 1 CHEME 5440/7770 Cornell University
# Jack Crowley, April 2021


# load the include file -
#include("Include.jl")

# main method -
function main(parameters_file_path::String, inducer_array::Array{Float64,1})::Array{Float64,2}

    # initialize

    try 

        # load the parameter file, and create the problem dictionary -
        problem_dictionary = generate_problem_dictionary(parameters_file_path)

        # TODO:  Solve things

        # return 

    catch error

        # grab the error message, and post -
        @error "Oooops! Hmmmmm. Something happend" exception=(error, catch_backtrace())
    end
end

# setup the path to the parameters file -
path_to_parameters_file = joinpath(_PATH_TO_CONFIG, "Parameters.toml")

# execute
results_array = main(path_to_parameters_file, inducer_array)

# plot
plot(results_array[:,1],mRNA_steady_state_array[:,2], xscale=:log10, legend=false)
xlabel!("My X label (units)")
ylabel!("My Y label (units)")

path_to_plot = joinpath(_PATH_TO_OUTPUT,"Prelim1_Plot.png")
savefig(path_to_plot)