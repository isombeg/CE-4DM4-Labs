classdef Galois_LFSR < handle

    properties %(Access = private)
        cap % bit capacity
        feedback_polymomial % array represented by row vector
        state % bit array represented by row vector
    end

    methods
        % Galois_LFSR: LFSR constructor
        % Inputs
        % feedback_polynomial: row vector who's values correspond to the LFSR's feedback polynomial exponents
        % init_state: row vector who's values correspond to the LFSR's seed
        function obj = Galois_LFSR(feedback_polynomial, init_state)
            obj.feedback_polymomial = feedback_polynomial;
            obj.state = init_state;
            obj.cap = size(init_state,2);
        end

        % cycle: Simulates one cycle of the LFSR
        % Outputs the LSB as well as the LFSR's current state
        function [out, curr_state] = cycle(obj)
            
            % record LSB being output
            out = obj.state(obj.cap);
            % For loop to determine the next state of every bit within the LFSR 
            for i = obj.cap:-1:1
                % if processing the MSB, set it to LSB
                if obj.lfsr_index(i) == obj.cap
                    obj.state(i) = out;

                % if current index is found in feedback polynomial, perform XOR with LSB
                elseif ismember(obj.lfsr_index(i), obj.feedback_polymomial)
                    obj.state(i) = bitxor(obj.state(i - 1), out);

                % else set current bit equal to the bit in next LFSR index
                else
                    obj.state(i) =  obj.state(i - 1);
                end
            end

            % output current LFSR state
            curr_state = obj.state;
        end

        % cycle_multiple: runs cycle() a specified amount of times n
        % Outputs the LFSR's output stream as well as the state after n cycles
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

    % lfsr_index: Translates Matlab index into the conventional academic LFSR index
    methods (Access = private)
        function index = lfsr_index(obj, in)
            index = obj.cap + 1 - in;
        end
    end

end