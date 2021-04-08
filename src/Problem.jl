function generate_problem_dictionary(path_to_parameters_file::String)::Dict{String,Any}

    # initialize -
    problem_dictionary = Dict{String,Any}()

    try

        # load the TOML parameters file -
        toml_dictionary = TOML.parsefile(path_to_parameters_file)

        # --- PUT STUFF INTO problem_dictionary ---- 
        problem_dictionary["Fructose_6_Phosphate_concentration"] = toml_dictionary["biophysical_constants"]["Fructose_6_Phosphate_concentration"]
        problem_dictionary["Adenosine_Tri_Phosphate_concentration"] = toml_dictionary["biophysical_constants"]["Adenosine_Tri_Phosphate_concentration"]
        problem_dictionary["Phosphofructokinase_concentration"] = toml_dictionary["biophysical_constants"]["Phosphofructokinase_concentration"]
        problem_dictionary["F6P_binding_constant"] = toml_dictionary["biophysical_constants"]["F6P_binding_constant"] * 1000   # convert to uM
        problem_dictionary["ATP_binding_constant"] = toml_dictionary["biophysical_constants"]["ATP_binding_constant"] * 1000   # convert to uM
        problem_dictionary["Catalytic_rate"] = toml_dictionary["biophysical_constants"]["Catalytic_rate"]
        
        # return -
        return problem_dictionary
    catch error
        throw(error)
    end
end