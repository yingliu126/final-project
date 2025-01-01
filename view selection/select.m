% Define the folder path containing the images
folderPath = 'D:/ly/stage3/gun4/view selection'; % Folder path
imageFiles = dir(fullfile(folderPath, '*.png')); % Get all image files with .png extension

% Initialize storage for results
foregroundAreas = zeros(1, length(imageFiles)); % Foreground area for each image
aspectRatios = zeros(1, length(imageFiles)); % Aspect ratio for each image
fileNames = strings(1, length(imageFiles)); % Store filenames

for i = 1:length(imageFiles)
    % Read the current image
    imagePath = fullfile(folderPath, imageFiles(i).name);
    Im = imread(imagePath);

    % Convert to grayscale
    grayImage = rgb2gray(Im);

    % 1. Image preprocessing: enhance contrast and filter the background
    enhancedImage = imadjust(grayImage); % Enhance image contrast
    edges = edge(enhancedImage, 'Canny'); % Detect edges using the Canny method

    % 2. Segment the foreground using connected component analysis
    binaryMask = imfill(edges, 'holes'); % Fill closed edge regions
    binaryMask = bwareaopen(binaryMask, 500); % Remove noise regions smaller than 500 pixels

    % Perform connected component analysis
    connectedComponents = bwconncomp(binaryMask); % Identify connected components
    stats = regionprops(connectedComponents, 'Area', 'BoundingBox', 'Centroid', 'Extent'); % Extract properties: area, bounding box, etc.

    % 3. Extract connected components matching gun features
    if ~isempty(stats)
        % Filter out background regions based on area size
        validAreas = [stats.Area];
        validIdx = validAreas > 1000; % Keep regions with an area greater than 1000 pixels
        stats = stats(validIdx);

        if ~isempty(stats)
            % Select the largest connected component (assume the gun is the largest object)
            [maxArea, maxIdx] = max([stats.Area]);
            boundingBox = stats(maxIdx).BoundingBox;
            aspectRatio = boundingBox(3) / boundingBox(4); % Calculate aspect ratio (Width/Height)
        else
            maxArea = 0; % No valid regions found
            aspectRatio = 0;
        end
    else
        maxArea = 0; % No connected components found
        aspectRatio = 0;
    end

    % Store results
    foregroundAreas(i) = maxArea; % Store the largest area
    aspectRatios(i) = aspectRatio; % Store the corresponding aspect ratio
    fileNames(i) = imageFiles(i).name; % Store the file name
end

% Combine area and aspect ratio for ranking: prioritize larger areas and square-like shapes
score = foregroundAreas ./ (1 + abs(aspectRatios - 1)); % Score: large area and aspect ratio close to 1 (square-like)
[sortedScores, sortIdx] = sort(score, 'descend'); % Sort scores in descending order
sortedFileNames = fileNames(sortIdx); % Sort filenames accordingly

% Select the top 30 images
numTopImages = min(30, length(sortedScores)); % Ensure the number does not exceed total images
bestImages = sortedFileNames(1:numTopImages);

% Display the results
fprintf('Top %d images for reconstruction:\n', numTopImages);
for i = 1:numTopImages
    fprintf('%s (Score: %.2f, Foreground Area: %.2f, Aspect Ratio: %.2f)\n', ...
        bestImages(i), sortedScores(i), foregroundAreas(sortIdx(i)), aspectRatios(sortIdx(i)));
end
