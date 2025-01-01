folderPath = 'D:/ly/stage3/gun4/blur correction face 2';

% Retrieve all PNG files in the specified folder
imageFiles = dir(fullfile(folderPath, '*.png'));

% Loop through each image in the folder
for i = 1:length(imageFiles)
    % Construct the full path of the image
    imagePath = fullfile(folderPath, imageFiles(i).name);

    % Read the image
    Im = imread(imagePath);
    
    % Apply reflection suppression function
    % You can adjust the parameters as needed!/default:0.033
    T = reflectSuppress(Im, 0.025, 1e-6);

    % Display the original and processed images
    figure;
    subplot(1, 2, 1); imshow(Im); title('Original Image');
    subplot(1, 2, 2); imshow(T); title('Processed Image');

    % Save the processed image
    outputPath = fullfile(folderPath, ['processed_' imageFiles(i).name]);
    imwrite(T, outputPath);
end
