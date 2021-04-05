function calculate_transcriptional_control_variable(problem::Dict{String,Any})::Float64

    # initialize
    v_variable = 0.0
    v_num = 0.0
    Z = 0.0             # Partition function

    # retrieving values from problem dictionary
    Weight = 1.0  # estimated in part b

    # define states involved in activity
    all_states = [0,1,2]
    activity_states = [1,2]

    # v-variable function
    for (index, value) ∈ enumerate(all_states)
        println("$index  $value")
        Wf = Weight * (x/Ki)^ni / (1 + (x/Ki)^ni)  # most of this line is undefined!

        if value ∈ activity_states
            print("State $value exhibits activity")
            v_num += Wf
        end

        Z += Wf
    end

    v_variable = v_num / Z

    # return
    return v_variable
end