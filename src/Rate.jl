function calculate_reaction_rate(problem::Dict{String,Any}, Weights::Array{Float64,1}, k_activator::Float64, n_activator::Float64, x::Float64)::Float64

    # Incorporate problem dictionary data
    kcat = problem["Catalytic_rate"] * 3600
    conc_F6P = problem["Fructose_6_Phosphate_concentration"]
    k_F6P = problem["F6P_binding_constant"]
    conc_ATP = problem["Adenosine_Tri_Phosphate_concentration"]
    k_ATP = problem["ATP_binding_constant"]
    E1 = problem["Phosphofructokinase_concentration"]

    # Calculate maximum reaction rate
    r1 = kcat * E1 * (conc_F6P / (k_F6P + conc_F6P)) * (conc_ATP / (k_ATP + conc_ATP))

    # Calculate activation control variable, v
    v1 = calculate_transcriptional_control_variable(Weights, k_activator, n_activator, x)

    # Calculate regulated reaction rate
    r̂ = r1 * v1
    return r̂
end