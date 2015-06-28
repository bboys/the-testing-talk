% test importing games
function tests = test_compare_rank
    tests = functiontests(localfunctions);
end

%% test_a_pair_wins_from_a_high_card:
function [] = test_a_pair_wins_from_a_high_card(tc)
    hand_1 = '4D4S9H2H3C'; % pair of 4's
    hand_2 = '4D6S9H2H3C'; % high card, 9

    % A pair wins over a high card
    winner = compare_rank(hand_1, hand_2);
    assert(winner == 1);

    % A pair wins over a high card
    winner = compare_rank(hand_2, hand_1);
    assert(winner == 2);
end


%% test_a_higher_pair_wins_from_a_lower_pair:
function [] = test_a_higher_pair_wins_from_a_lower_pair(tc)
    hand_1 = '4D4S9H2H3C'; % pair of 4's
    hand_2 = '9D6S9H2H3C'; % pair of 9's

    % A pair wins over a high card
    winner = compare_rank(hand_1, hand_2);
    assert(winner == 2);

    % A pair wins over a high card
    winner = compare_rank(hand_2, hand_1);
    assert(winner == 1);
end



%% test_two_pair_wins_from_a_pair:
function [] = test_two_pair_wins_from_a_pair(tc)
    hand_1 = '4D4S9H9H3C'; % two pairs of 4 and 9
    hand_2 = '4D2S9H9H3C'; % pair of 9s

    % A pair wins over a high card
    winner = compare_rank(hand_1, hand_2);
    assert(winner == 1);

    % A pair wins over a high card
    winner = compare_rank(hand_2, hand_1);
    assert(winner == 2);

    % A pair wins over a high card
    winner = compare_rank(hand_1, hand_1);
    assert(winner == 0);
end

%% test_three_of_a_kind_wins_from_a_pair:
function [] = test_three_of_a_kind_wins_from_a_pair(tc)
    hand_1 = '4D4S4H9H3C'; % three of a kind of 4's
    hand_2 = '4D4S9H9H3C'; % high card, 9

    % A pair wins over a high card
    winner = compare_rank(hand_1, hand_2);
    assert(winner == 1);

        % A pair wins over a high card
    winner = compare_rank(hand_2, hand_1);
    assert(winner == 2);
end

%% test_straight_wins_from_three_of_a_kind:
function [] = test_straight_wins_from_three_of_a_kind(tc)
    hand_1 = '1D2S3H4H5C'; % straight from 1 to 5
    hand_2 = '4D4S4H9H3C'; % three of a kind of 4's

    % A pair wins over a high card
    winner = compare_rank(hand_1, hand_2);
    assert(winner == 1);

        % A pair wins over a high card
    winner = compare_rank(hand_2, hand_1);
    assert(winner == 2);
end

%% test_flush_wins_from_straigth:
function [] = test_flush_wins_from_straigth(tc)
    hand_1 = '2D2H3D3H3C'; % pair of 2s, three of a kind of 3s
    hand_2 = '1D8D3D4D5D'; % flush diamonds

    % A pair wins over a high card
    winner = compare_rank(hand_1, hand_2);
    assert(winner == 1);

        % A pair wins over a high card
    winner = compare_rank(hand_2, hand_1);
    assert(winner == 2);
end

%% test_four_of_a_kind_wins_from_full_house:
function [] = test_four_of_a_kind_wins_from_full_house(tc)
    hand_1 = '2D2H2C2S3C'; % four of a kind of 2s
    hand_2 = '2D2H3D3H3C'; % pair of 2s, three of a kind of 3s

    % A pair wins over a high card
    winner = compare_rank(hand_1, hand_2);
    assert(winner == 1);

        % A pair wins over a high card
    winner = compare_rank(hand_2, hand_1);
    assert(winner == 2);
end

%% test_straight_flush_wins_from_four_of_a_kind:
function [] = test_straight_flush_wins_from_four_of_a_kind(tc)
    hand_1 = '1D2D3D4D5D'; % straigth flush diamonds from 1 to 5
    hand_2 = '2D2H2C2S3C'; % four of a kind of 2s

    % A pair wins over a high card
    winner = compare_rank(hand_1, hand_2);
    assert(winner == 1);

        % A pair wins over a high card
    winner = compare_rank(hand_2, hand_1);
    assert(winner == 2);
end

%% test_royal_flush_wins:
function [] = test_royal_flush_wins(tc)
    hand_1 = 'ADKDQDJDTD'; % royal flush diamonds
    hand_2 = '1D2D3D4D5D'; % straigth flush diamonds from 1 to 5

    % A pair wins over a high card
    winner = compare_rank(hand_1, hand_2);
    assert(winner == 1);

    % A pair wins over a high card
    winner = compare_rank(hand_2, hand_1);
    assert(winner == 2);
end
