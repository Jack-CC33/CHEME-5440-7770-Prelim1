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
    
    N = length(Concentration_35AMP_data)
    Sim = zeros(N)
    Data = zeros(N)

    # Part B:  Estimate fitting constants from experimental dataset
    # Choice of state weights, effector binding constant, and order parameter
    Weights = [1.0, 1.0, 1.0]
    K_35AMP = 0.6
    n_35AMP = 1.0

    try 

        # load the parameter file, and create the problem dictionary -
        problem_dictionary = generate_problem_dictionary(parameters_file_path)
        print("F6P Concentration = $(problem_dictionary["Fructose_6_Phosphate_concentration"]) uM\n")

        # TODO:  Solve things
        for (index, x) ∈ enumerate(Concentration_35AMP_data)
            Returned_rate = calculate_reaction_rate(problem_dictionary, Weights, K_35AMP, n_35AMP, x)
            Sim[index] = Returned_rate
            print("\n\nReturned_rate = $(Returned_rate)")
            Data[index] = V_data[index]
            print("\nExperimental rate = $(V_data[index])")
        end

        # Part C:  Plot data and mathematical model
        p1 = plot(Concentration_35AMP_data, Data, st = :line)
        p2 = plot(Concentration_35AMP_data, Sim, st = :line)
        plot(p1, p2)
        xlabel!("My X label (units)")
        ylabel!("My Y label (units)")
        savefig(path_to_plot)

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