classdef Galois_LFSR < handle

    properties %(Access = private)
        cap % bit capacity
        feedback_polymomial % array represented by row vector
        state % bit array represented by row vector
    end

    methods
        function obj = Galois_LFSR(feedback_polynomial, init_state)
            obj.feedback_polymomial = feedback_polynomial
            obj.state = init_state
            obj.cap = size(init_state,2)
        end

        function curr_state = cycle(obj)
            lsb = obj.state(obj.cap)
            for i = obj.cap:-1:1
                disp(["i: ", i])
                if obj.lfsr_index(i) == obj.cap
                    obj.state(i) = lsb
                elseif ismember(obj.lfsr_index(i), obj.feedback_polymomial)
                    obj.state(i) = bitxor(obj.state(i - 1), lsb)
                else
                    obj.state(i) =  obj.state(i - 1)
                end
            end
            % obj.state = state_copy
            curr_state = obj.state
        end

        function state = cycle_multiple(obj, n)
            for i = 1:n
                obj.cycle()
            end
            state = obj.state
        end

        function curr_state = getState(obj)
            curr_state = obj.state
        end
    end

    methods (Access = private)
        function index = lfsr_index(obj, in)
            index = obj.cap + 1 - in
        end
    end

end