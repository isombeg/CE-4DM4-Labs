function decrypted_img = decrypt(image, key)
    % Inputs:
    % image: 3D image matrix
    % key: the random number matrix

    % Output:
    % decrypted_img: The 3D matrix of the decrypted image

    % Decrypts the image by performing bitxor
    decrypted_img = bitxor(uint8(image), uint8(key));
end