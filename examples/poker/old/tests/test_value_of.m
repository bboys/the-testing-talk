% test rank of
function [tests] = test_rank_of
    tests = functiontests(localfunctions);
end

%% test_numbered_values_are_kept:
function [] = test_numbered_values_are_kept(tc)
    for i = 1:9
        assert(i == value_of(sprintf('%d', i)));
    end
end

%% test_a_pair_wins_from_a_high_card:
function [] = test_faces_are_mapped_to_values(tc)
    assert(10 == value_of('T'));
    assert(11 == value_of('J'));
    assert(12 == value_of('Q'));
    assert(13 == value_of('K'));
    assert(14 == value_of('A'));
end
