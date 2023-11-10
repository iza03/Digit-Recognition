function [train, miu, Y, Vk] = magic_with_pca (train_mat, pcs)
  [m, n] = size (train_mat);
  
  % initializare train
  train = zeros (m, n);
  
  % initializare miu
  miu = zeros (1, n);
  
  % initializare Y
  Y = zeros (m, pcs);
  
  % initializare Vk
  Vk = zeros (n, pcs);
  
  % Cast train_mat to double
  train_mat = double(train_mat);
   % Calculate the mean of each column of the matrix
  miu = mean(train_mat);
  
  % Subtract the mean from the original matrix
  train = train_mat - miu;
  
  % Calculate the covariance matrix
  cov_matrix = train' * train / (m - 1);
  
  % Calculate the eigenvectors and eigenvalues of the covariance matrix
  [V, D] = eig(cov_matrix);
  
  % Sort eigenvalues in descending order and create matrix Vk
  [~, idx] = sort(diag(D), 'descend');
  Vk = V(:, idx);
  
  % Keep only the first pcs columns of Vk
  Vk = Vk(:, 1:pcs);
  
  % Create matrix Y by changing the basis of the original matrix
  Y = train * Vk;
  
  % Calculate the approximation of the original matrix using Vk
  train = Y * Vk';
  
endfunction
