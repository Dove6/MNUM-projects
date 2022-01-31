function [] = validateinput(matrix, vector)
    [ mat_rowcount, mat_colcount ] = size(matrix);
    [ vec_rowcount, vec_colcount ] = size(vector);
    assert(mat_rowcount == mat_colcount, "A square matrix is required");
    assert(vec_rowcount == mat_rowcount, "Matrix and vector have uncompatible sizes");
    assert(vec_colcount == 1, "A column vector is required");
end
