function generate_problem_dictionary(path_to_parameters_file::String)::Dict{String,Any}

    # initialize -
    problem_dictionary = Dict{String,Any}()

    try

        # load the TOML parameters file -
        toml_dictionary = TOML.parsefile(path_to_parameters_file)

        # --- PUT STUFF INTO problem_dictionary ---- 
        problem_dictionary["Fructose_6_Phosphate_concentration"] = toml_dictionary["biophysical_constants"]["Fructose_6_Phosphate_concentration"]

        
        # return -
        return problem_dictionary
    catch error
        throw(error)
    end
end