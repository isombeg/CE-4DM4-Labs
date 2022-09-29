function decrypted_img = decrypt(image, key)
    decrypted_img = bitxor(uint8(image), uint8(key));
end