# Prelim 1 CHEME 5440/7770 Cornell University
# Jack Crowley, April 2021


# load the include file -
include("Include.jl")

# main method -
function main(parameters_file_path::String, data_file_path::String)

    # initialize
    Dataset = readdlm(data_file_path, ',', Float64)
    Concentration_35AMP_data = Dataset[:,1]             # units: mM
    V_data = Dataset[:,2]                               # units: uM/hr
    Confidence_Int_data = Dataset[:,3]                  # units: uM/hr
    print(Concentration_35AMP_data)
    print("\n\n")
    print(V_data)
    print("\n\n")
    print(Confidence_Int_data)
    print("\n\n")

    try 

        # load the parameter file, and create the problem dictionary -
        problem_dictionary = generate_problem_dictionary(parameters_file_path)
        print("F6P Concentration = $(problem_dictionary["Fructose_6_Phosphate_concentration"]) uM\n")

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
#plot(results_array[:,1],mRNA_steady_state_array[:,2], xscale=:log10, legend=false)
#xlabel!("My X label (units)")
#ylabel!("My Y label (units)")

#path_to_plot = joinpath(_PATH_TO_OUTPUT,"Prelim1_Plot.png")
#savefig(path_to_plot)