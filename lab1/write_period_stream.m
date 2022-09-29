function write_period_stream(filename, bitStream)
    bitStreamBytes = bit_array_to_bytes(bitStream);

    fid = fopen(filename, 'w');
    for i = 1:16:size(bitStreamBytes, 2)
        if size(bitStreamBytes, 2) - i < 16
            fprintf(fid, '%3g, ', bitStreamBytes(i:end));
        else
            fprintf(fid, '%3g, ', bitStreamBytes(i:i+15));
            fprintf(fid, '\n');
        end
    end
    fclose(fid);
end
