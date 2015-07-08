function x = backslash(A, b)
    if (issparse(A))
        [L, U, P, Q, R] = lu(A);
        x = Q * (U \ (L \ (P * (R \ b))));
    else
        [L, U] = lu(A);
        x = U \ (L \ b);
    end
end
