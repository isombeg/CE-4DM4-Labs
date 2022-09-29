function runTable = make_run_table(bitStream, run_type, probs)
    runTable = zeros(4,24);

    % row 1
    runTable(1, :) = 1:24;

    % row 2
    for i = 1:24
        runTable(2, i) = find_k_run_count(bitStream, i, run_type);
    end

    % total runs
    sum_of_all_observed_runs = sum(runTable(2,:));

    % row 3
    for i = 1:24
        runTable(3, i) = runTable(2, i)/sum_of_all_observed_runs;
    end

    % Probability of a 1 or a 0 is 50% each (flipping a coin). So the 
    % probability of getting k number of 0s or 1s in a row is (0.5)^k 
    
    % row 4 
    for i = 1:24
        runTable(4, i) = 0.5^i;
    end
end

function kRunCount = find_k_run_count(bitStream, k, run_type)
    if run_type == 0
        run = zeros(1, k+2);
        run(1) = 1;
        run(end) = 1;
    else
        run = ones(1, k+2);
        run(1) = 0;
        run(end) = 0;
    end
    kRunCount = size(strfind(bitStream, run), 2);
end