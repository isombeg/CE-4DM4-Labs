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