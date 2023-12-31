function sir = prepare_photo(im)
  % Initialize the final array.
  sir = zeros(1, 784);

  % Invert the pixels of the image
  im = 255 - im;
  
  % Transpose the image and then reshape it into a row vector.
  sir = reshape(im', 1, []);
  
endfunction