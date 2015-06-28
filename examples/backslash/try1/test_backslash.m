function tests = test_backslash
    tests = functiontests(localfunctions);
end

function test_small_matrix
    assert(backslash([1,1; 1,-1], [1;2]) == [3, -1]);
end
