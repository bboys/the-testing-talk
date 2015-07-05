function tests = test_backslash
    tests = functiontests(localfunctions);
end

function test_small_matrix(t)
    t.assertEqual(backslash([1,1; 1,-1], [1;2]), [1.5; - 0.5]);
end

function test_random_small_matrix(t)
    A = rand(2);
    x = rand(2, 1);
    b = A * x;

    tol = 1E-10;
    t.assertLessThan(norm(backslash(A, b) - x), tol);
end
