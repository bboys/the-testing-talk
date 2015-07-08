function tests = test_backslash
    tests = functiontests(localfunctions);
end

function test_small_matrix(t)
    t.assertEqual(backslash([1,1; 1,-1], [1;2]), [1.5; - 0.5]);
end

function test_random_small_matrix(t)
    rng('default');
    A = rand(2);
    x = rand(2, 1);
    b = A * x;

    tol = 1E-10;
    t.assertLessThan(norm(backslash(A, b) - x), tol);
end

function test_random_large_matrix(t)
    rng('default');
    n = 10;
    A = rand(n);
    x = rand(n, 1);
    b = A * x;

    tol = 1E-10;
    t.assertLessThan(norm(backslash(A, b) - x), tol);
end

function test_sparse_matrix(t)
    m = 200;
    G = numgrid('S', m);
    A = delsq(G);
    n = size(A,1);

    xex = rand(n, 1);
    b = A * xex;

    tic;
    x = backslash(A, b);
    tm = toc;

    tol = 1E-10;
    t.assertLessThan(norm(xex - x), tol);

    t.assertLessThan(tm, 1);
    
end