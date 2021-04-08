function calculate_transcriptional_control_variable(W::Array{Float64,1}, binding_rate::Float64, order_param::Float64, frac_bound::Float64)::Float64

    # initialize
    v_variable = 0.0
    v_num = 0.0
    Z = 0.0

    # define states involved in activity
    all_states = [0,1,2]
    activity_states = [1,2]
    f_dependent_states = [2]

    # rename parameters
    ni = order_param
    Ki = binding_rate
    x = frac_bound

    # v-variable function
    for (index, value) ∈ enumerate(all_states)
        Wf = W[index]

        if value ∈ f_dependent_states
            Wf *= (x/Ki)^ni / (1 + (x/Ki)^ni)
        end

        if value ∈ activity_states
            v_num += Wf
        end

        Z += Wf
    end

    v_variable = v_num / Z

    # return
    return v_variable
end