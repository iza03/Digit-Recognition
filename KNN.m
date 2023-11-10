function prediction = KNN (labels, Y, test, k)
  % initializeaza prediction
  prediction = -1;
  
  % initializeaza distantele
  [m, n] = size (Y);
  distance = zeros (m, 1);
  
  % Calculate the Euclidean distance between each row in Y and the test vector
  for i = 1:m
      distances(i) = norm(Y(i, :) - test);
  endfor
  
  % Sort the distances in ascending order and keep track of the indices
  [~, sortedIndices] = sort(distances);
  
  % Take the first k labels corresponding to the closest images
  kLabels = labels(sortedIndices(1:k));
  
  % Calculate the prediction as the median of the kLabels
  prediction = median(kLabels);
endfunction
