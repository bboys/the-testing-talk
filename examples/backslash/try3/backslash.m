function x = backslash(A, b)
    Ainv = [A(2,2), -A(1,2); -A(2,1), A(1,1)];
    Ainv = (1 / (A(1, 1) * A(2, 2) - A(2, 1) * A(1, 2))) * Ainv;
    x = Ainv * b;
end
