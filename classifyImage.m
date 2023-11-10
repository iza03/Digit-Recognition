function prediction = classifyImage (im, train_mat, train_val, pcs)
  % initializare predictie.
  prediction = -1;

  % Cast im to double
  im = double(im);
  
  % Apply magic_with_pca to the training dataset
  [train, miu, Y, Vk] = magic_with_pca(train_mat, pcs);
  
  % Subtract the mean of each column from the image vector
  im = im - miu;
  
  % Change the basis by multiplying with the Vk matrix
  im = im * Vk;
  
  % Calculate the prediction using k-nearest neighbors with k = 5
  prediction = KNN(train_val, Y, im, 5);
  
endfunction
