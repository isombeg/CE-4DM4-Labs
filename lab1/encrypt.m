function encrypted_img = encrypt(image, key)
    % Inputs:
    % image: 3D image matrix
    % key: the random number matrix

    % Output:
    % encrypted_img: The 3D matrix of the encrypted image

    % Encrypts the image by performing bitxor
    encrypted_img = bitxor(uint8(image), uint8(key));
end