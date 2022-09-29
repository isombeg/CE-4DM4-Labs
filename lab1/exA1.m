addpath('../utils')
clear

% For bitcap of 22 with feedback poly of x^22+x^21+1, the period is 4194303
bit_cap = 18; %22
cycles = 400e3; %5e6;

feedback_polynomial = [11];
init_state = zeros(1, bit_cap);
init_state(bit_cap) = 1;
lfsr = Galois_LFSR(feedback_polynomial, init_state);

DATA_OUT = lfsr.cycle_multiple(cycles);
DATA_OUT

occurences = strfind(DATA_OUT, DATA_OUT(1:bit_cap));

period_len = occurences(2)-occurences(1);
DATA_OUT_BYTES = bit_array_to_bytes(DATA_OUT(occurences(1):occurences(1)+period_len-1));

fid = fopen('my_random_numbers.m', 'w');
for i = 1:16:size(DATA_OUT_BYTES, 2)
    disp(["i: ", i]);
    if size(DATA_OUT_BYTES, 2) - i < 16
        fprintf(fid, '%3g, ', DATA_OUT_BYTES(i:end));
    else
        fprintf(fid, '%3g, ', DATA_OUT_BYTES(i:i+15));
        fprintf(fid, '\n');
    end
end
fclose(fid);