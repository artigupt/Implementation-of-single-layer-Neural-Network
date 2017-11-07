function labels = loadMNISTLabels('train_labels_idx1_ubyte')
%loadMNISTLabels returns a [number of MNIST images]x1 matrix containing
%the labels for the MNIST images

fp = fopen('train_labels_idx1_ubyte', 'rb');
assert(fp ~= -1, ['Could not open ', 'train_labels_idx1_ubyte', '']);

magic = fread(fp, 1, 'int32', 0, 'ieee-be');
assert(magic == 2049, ['Bad magic number in ', 'train_labels_idx1_ubyte', '']);

numLabels = fread(fp, 1, 'int32', 0, 'ieee-be');

labels = fread(fp, inf, 'unsigned char');

assert(size(labels,1) == numLabels, 'Mismatch in label count');

fclose(fp);

end
