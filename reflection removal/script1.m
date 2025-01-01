Im = imread('D:/ly/stage3/gun4/blur correction face 1/output_0025.png');
Im = imsharpen(Im);
T = reflectSuppress(Im, 0.025, 1e-6);

% Display the original and processed images
figure;
subplot(1, 2, 1); imshow(Im); title('Original Image');
subplot(1, 2, 2); imshow(T); title('Processed Image');

