function encrypted_img = encrypt(image, key)
    encrypted_img = bitxor(uint8(image), uint8(key));
end