addpath('../utils')
clear;

% For bitcap of 22 with feedback poly of x^22+x^21+1, the period is 4194303
bit_cap = 22; %22
cycles = 5e6; %5e6;

feedback_polynomial = [21];
init_state = zeros(1, bit_cap);
init_state(bit_cap) = 1;
lfsr = Galois_LFSR(feedback_polynomial, init_state);

% A1)
DATA_OUT = lfsr.cycle_multiple(cycles);

% A2)
[DATA_OUT_PERIOD] = find_period(DATA_OUT, bit_cap);

% A3)
write_period_stream("my_random_numbers.m", DATA_OUT_PERIOD);

% A5)
runTable0 = make_run_table(DATA_OUT_PERIOD, 0);
% A6)
runTable1 = make_run_table(DATA_OUT_PERIOD, 1);