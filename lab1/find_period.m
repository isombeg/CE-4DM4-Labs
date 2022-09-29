function [period, len] = find_period(bitStream, bitCap)
    occurences = strfind(bitStream, bitStream(1:bitCap));
    period_len = occurences(2)-occurences(1);
    period = bitStream(occurences(1):occurences(2));
end