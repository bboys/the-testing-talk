% test importing games
function tests = test_compare_high_card
    tests = functiontests(localfunctions);
end

%% test_the_hand_with_highest_card_wins:
function [] = test_the_hand_with_highest_card_wins(tc)
    hand_1 = '4D6S9H2H2C'; % high card, nine
    hand_2 = '3D6D7H2D2S'; % high card, seven


    % player 1 wins
    assert(compare_high_card(hand_1, hand_2) == 1);

    % (switch hands) player 2 wins
    assert(compare_high_card(hand_2, hand_1) == 2);
end

%% test_the_second_highest_card_wins: when the highest cards of the players
% are equal, then the second highest card wins
function [] = test_the_second_highest_card_wins(tc)
    hand_1 = '4D6S9HQHQC'; % high card queen, nine
    hand_2 = '3D6D7HQDQS'; % high card queen, seven

    % player 1 wins
    assert(compare_high_card(hand_1, hand_2) == 1);
end