function x = backslash(A, b)
    [L,U] = lu(A);
    x = U \ (L \ b);
end
