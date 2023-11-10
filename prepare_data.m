function [train_mat, train_val] = prepare_data(name, no_train_images)
  n = 784;
  
  % Initialize train_mat.
  train_mat = zeros(no_train_images, n);
  
  % Initialize train_val.
  train_val = zeros(1, no_train_images);
  
  % Load the data from the provided table.
  d = load(name);
  X = d.trainX;
  y = d.trainY;
  
  % Save the first no_train_images rows of the training image table
  % in the train_mat matrix.
  train_mat = X(1:no_train_images, :);
  
  % Save the first no_train_images values of the label vector in
  % the train_val vector.
  train_val = y(1:no_train_images);
endfunction