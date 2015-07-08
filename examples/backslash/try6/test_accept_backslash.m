function tests = test_accept_backslash
    tests = functiontests(localfunctions);
end

function test_sparse_matrix(t)
    A = delsq(numgrid('S', 200));
    xex = rand(size(A,1), 1);
    b = A * xex;

    tic;
    x = backslash(A, b);
    tm = toc;

    t.assertLessThan(norm(xex - x), 1E-10);
    t.assertLessThan(tm, 1);
end