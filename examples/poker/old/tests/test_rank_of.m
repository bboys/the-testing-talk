% test rank of
function [tests] = test_rank_of
    tests = functiontests(localfunctions);
end

%% test_a_pair_wins_from_a_high_card:
function [] = test_has_pair(tc)
    hand_1 = '4D4S9H2H3C'; % pair of 4's
    [rank, value] = rank_of(hand_1);
    assert(rank == 1);
    assert(value == 4);
end

%% test_two_pair_wins_from_a_pair:
function [] = test_has_two_pair(tc)
    hand_1 = '4D4S9H9H3C'; % two pairs of 4 and 9
    [rank, value] = rank_of(hand_1);
    assert(rank == 2);
    assert(value == 9);
end

%% test_three_of_a_kind_wins_from_a_pair:
function [] = test_has_three_of_a_kind(tc)
    hand_1 = '4D4S4H9H3C'; % three of a kind of 4's
    [rank, value] = rank_of(hand_1);
    assert(rank == 3);
    assert(value == 4);
end

%% test_straight_wins_from_three_of_a_kind:
function [] = test_has_straight(tc)
    hand_1 = '1D2S3H4H5C'; % straight from 1 to 5
    [rank, value] = rank_of(hand_1);
    assert(rank == 4);
    assert(value == 5);
end

%% test_four_consecutive_is_not_a_straight:
function [] = test_four_consecutive_values_is_not_a_straight(tc)
    hand_1 = '1D2S3H4H6C'; % 1 - 4, 6
    [rank, value] = rank_of(hand_1);
    assert(rank ~= 4);
end


function [] = test_has_flush(tc)
    hand_1 = '1D9DTD4D5D';
    [rank, value] = rank_of(hand_1);
    assert(rank == 5);
    assert(value == 10);
end

%% test_flush_wins_from_straigth:
function [] = test_has_full_house(tc)
    hand_1 = '2D2H3D3H3C'; % pair of 2s, three of a kind of 3s
    [rank, value] = rank_of(hand_1);
    assert(rank == 6);
    assert(value == 302);
end

%% test_four_of_a_kind_wins_from_full_house:
function [] = test_has_four_of_a_kind(tc)
    hand_1 = '2D2H2C2S3C'; % four of a kind of 2s
    [rank, value] = rank_of(hand_1);
    assert(rank == 7);
    assert(value == 2);
end

%% test_straight_flush_wins_from_four_of_a_kind:
function [] = test_has_straight_flush(tc)
    hand_1 = '1D2D3D4D5D'; % straigth flush diamonds from 1 to 5
    [rank, value] = rank_of(hand_1);
    assert(rank == 8);
    assert(value == 5);
end

%% test_royal_flush_wins:
function [] = test_has_royal_flush(tc)
    hand_1 = 'ADKDQDJDTD'; % royal flush diamonds
    [rank, value] = rank_of(hand_1);
    assert(rank == 9);
end
