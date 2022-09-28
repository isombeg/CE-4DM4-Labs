addpath('../utils')
clear

bit_cap = 22
cycles = 600;

feedback_polynomial = [21];
init_state = zeros(1, bit_cap);
init_state(22) = 1;
lfsr = Galois_LFSR(feedback_polynomial, init_state);

DATA_OUT = lfsr.cycle_multiple(cycles);
DATA_OUT

% fid = fopen("DA")