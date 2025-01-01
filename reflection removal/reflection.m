
input_i = im2double(imread('/MATLAB Drive/20370.png'));

I_max = max(input_i, [], 3); 
I_min = min(input_i, [], 3); 
cbcr_i = rgb2ycbcr(input_i); 
res = I_max - I_min; 
res3 = cat(3,res,res,res);
spec_free = cat(3, res, cbcr_i(:,:,2), cbcr_i(:,:,3)); 
imshow(ycbcr2rgb(spec_free)); 
imshow([input_i  res3  ycbcr2rgb(spec_free)]); 
combined_image = [input_i, res3, ycbcr2rgb(spec_free)];

imwrite(combined_image, '/MATLAB Drive/combined_output.png');

