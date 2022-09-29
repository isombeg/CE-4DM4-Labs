function byteArray = bit_array_to_bytes(bitArray)
    byteArray = zeros(1,floor(size(bitArray,2)/8));
    for i = 1:size(byteArray, 2)
        str_bitArr = num2str(bitArray((i-1)*8+1:(i-1)*8+8)); % convert to string array
        str_bitArr(isspace(str_bitArr)) = ''; % strip spaces
        byteArray(i) = bin2dec(str_bitArr);
    end
end