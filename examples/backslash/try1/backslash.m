function x = backslash(A, b)
    % test_errors_when_A_and_b_are_not_of_appropriate_size
    % n = size(b, 1);
    % assertEqual([n, n], size(A), 'Wrong matrix dimensions');

    Ainv = [A(2,2), -A(1,2); -A(2,1), A(1,1)];
    Ainv = 1 / (A(1, 1) * A(2, 2) - A(2, 1) * A(2, 1)) * Ainv;
    x = Ainv * b;
end
