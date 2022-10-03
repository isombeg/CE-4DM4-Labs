clear;
% Our input image filename in the same directory
image_name = "MicrosoftTeams-image.png";

% Read the image and convert it to a 3D matrix
img = imread(image_name);
R_matrix = img(:,:,1);
G_matrix = img(:,:,2);
B_matrix = img(:,:,3);

% Import the random numbers generated from exA and shape them to be the
% same dimensions as the image
rand_num = importdata('my_random_numbers.m');
rand_num = reshape(rand_num, 1, []);
rand_num = rand_num(1: numel(img));
rand_num = reshape(rand_num, size(img,1), size(img,2), size(img,3));

% Encrypt the image and output the result
encrypted_img = encrypt(img, rand_num);
figure(1);
image(uint8(encrypted_img))

% Decrypt the image and output the result
decrypted_img = decrypt(encrypted_img, rand_num);
figure(2);
image(uint8(decrypted_img))
