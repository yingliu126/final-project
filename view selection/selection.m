% Define the folder path containing the images
folderPath = 'D:/ly/stage3/gun4/output3 fps 3 png'; % Folder path
imageFiles = dir(fullfile(folderPath, '*.png')); % Read all image files with .png extension

% Initialize storage for scores and filenames
scores = zeros(1, length(imageFiles)); % Store scores for each image
fileNames = strings(1, length(imageFiles)); % Store filenames

for i = 1:length(imageFiles)
    % Read the current image
    imagePath = fullfile(folderPath, imageFiles(i).name);
    Im = imread(imagePath);
    
    % Convert the image to grayscale
    grayImage = rgb2gray(Im);
    
    % 1. Calculate the number of keypoints (feature richness)
    points = detectSURFFeatures(grayImage); % Detect keypoints using SURF algorithm
    numKeypoints = length(points); % Number of detected keypoints
    
    % 2. Compute foreground complexity (texture variation analysis)
    edges = edge(grayImage, 'Canny'); % Extract edges using Canny edge detection
    edgeDensity = sum(edges(:)) / numel(edges); % Ratio of edge pixels to total pixels
    
    % 3. Compute symmetry (measure front-view alignment)
    [rows, cols] = size(grayImage);
    halfCols = floor(cols / 2); % Divide the image into two vertical halves
    leftHalf = grayImage(:, 1:halfCols); % Left half of the image
    rightHalf = grayImage(:, (end-halfCols+1):end); % Right half of the image
    symmetryScore = corr2(leftHalf, fliplr(rightHalf)); % Calculate left-right symmetry using correlation
    
    % 4. Calculate a combined score (custom weighting)
    scores(i) = 0.5 * numKeypoints + 0.3 * edgeDensity + 0.2 * symmetryScore;
    
    % Store the filename for this image
    fileNames(i) = imageFiles(i).name;
end

% Sort images in descending order based on scores
[sortedScores, sortIdx] = sort(scores, 'descend'); % Sort scores
sortedFileNames = fileNames(sortIdx); % Sort filenames accordingly

% Select the top 30 images
numTopImages = min(30, length(sortedScores)); % Ensure not to exceed the total number of images
bestImages = sortedFileNames(1:numTopImages); % Get the filenames of the top images

% Output the best images and their scores
fprintf('Top %d images for reconstruction:\n', numTopImages);
for i = 1:numTopImages
    fprintf('%s (Score: %.2f)\n', bestImages(i), sortedScores(i));
end
