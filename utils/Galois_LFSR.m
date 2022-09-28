classdef Galois_LFSR < handle

    properties %(Access = private)
        cap % bit capacity
        feedback_polymomial % array represented by row vector
        state % bit array represented by row vector
    end

    methods
        function obj = Galois_LFSR(feedback_polynomial, init_state)
            obj.feedback_polymomial = feedback_polynomial;
            obj.state = init_state;
            obj.cap = size(init_state,2);
        end

        function [out, curr_state] = cycle(obj)
            out = obj.state(obj.cap); % record lsb being output
            for i = obj.cap:-1:1
                if obj.lfsr_index(i) == obj.cap
                    obj.state(i) = out;
                elseif ismember(obj.lfsr_index(i), obj.feedback_polymomial)
                    obj.state(i) = bitxor(obj.state(i - 1), out);
                else
                    obj.state(i) =  obj.state(i - 1);
                end
            end
            curr_state = obj.state;
        end

        function [out_stream, state] = cycle_multiple(obj, n)
            out_stream = zeros(1,n);
            for i = 1:n
                [out_stream(i)] = obj.cycle();
            end
            state = obj.state;
        end

        function curr_state = getState(obj)
            curr_state = obj.state;
        end
    end

    methods (Access = private)
        function index = lfsr_index(obj, in)
            index = obj.cap + 1 - in;
        end
    end

end