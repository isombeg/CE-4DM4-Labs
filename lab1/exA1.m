addpath('../utils')
clear

% For bitcap of 22 with feedback poly of x^22+x^21+1, the period is 4194303
bit_cap = 22
cycles = 5e6;

feedback_polynomial = [21];
init_state = zeros(1, bit_cap);
init_state(22) = 1;
lfsr = Galois_LFSR(feedback_polynomial, init_state);

DATA_OUT = lfsr.cycle_multiple(cycles);
DATA_OUT

occurences = strfind(DATA_OUT, DATA_OUT(1:bit_cap));

first_repetition = occurences(2);
period_len = occurences(3)-occurences(2);
DATA_OUT_BYTES = bit_array_to_bytes(DATA_OUT(first_repetition:first_repetition+period_len-1));

fid = fopen('my_random_numbers.m', 'w');
for i = 1:16:period_len
    fprintf(fid, '%3g, ', DATA_OUT_BYTES);
    fprintf(fid, '\n');
end
fclose(fid);