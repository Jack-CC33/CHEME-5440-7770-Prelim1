# Prelim 1 CHEME 5440/7770 Cornell University
# Jack Crowley, April 2021


# load the include file -
include("Include.jl")

# main method -
function main(parameters_file_path::String, data_file_path::String)

    # initialize
    Placeholder_mat = readdlm(data_file_path, ',', Float64)
    print(Placeholder_mat)
    print("\n\n")
    print(Placeholder_mat[2,2])
    print("\n\n")

    try 

        # load the parameter file, and create the problem dictionary -
        problem_dictionary = generate_problem_dictionary(parameters_file_path)

        # TODO:  Solve things

        # return 

    catch error

        # grab the error message, and post -
        @error "Oooops! Hmmmmm. Something happend" exception=(error, catch_backtrace())
    end

    return nothing
end

# setup the path to the parameters file -
path_to_parameters_file = joinpath(_PATH_TO_CONFIG, "Parameters.toml")

# setup the path to the experimental data file
path_to_data_file = joinpath(_PATH_TO_CONFIG, "Data-3-5-AMP.csv")

# execute
results_array = main(path_to_parameters_file, path_to_data_file)

# plot
plot(results_array[:,1],mRNA_steady_state_array[:,2], xscale=:log10, legend=false)
xlabel!("My X label (units)")
ylabel!("My Y label (units)")

path_to_plot = joinpath(_PATH_TO_OUTPUT,"Prelim1_Plot.png")
savefig(path_to_plot)