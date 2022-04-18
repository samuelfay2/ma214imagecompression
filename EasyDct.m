

function compressed = EasyDct(inputImage)
    T = dctmtx(8);
    dct = @(block_struct) T * block_struct.data * T';
    B = blockproc(inputImage,[8 8],dct);
    mask = [1   1   1   1   0   0   0   0
        1   1   1   0   0   0   0   0
        1   1   0   0   0   0   0   0
        1   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0];
    B2 = blockproc(B,[8 8],@(block_struct) mask .* block_struct.data);
    invdct = @(block_struct) T' * block_struct.data * T;
    compressed = blockproc(B2,[8 8],invdct);