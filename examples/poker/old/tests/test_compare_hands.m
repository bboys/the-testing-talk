% test importing games
function tests = test_compare_ranks
    tests = functiontests(localfunctions);
end

%% test_if_no_combination_is_present_highest_card_wins:
function [] = test_if_no_combination_is_present_highest_card_wins(tc)
    hand_1 = '5D1S9H2H3C'; % high card 9, 5
    hand_2 = '4D1S9H2H3C'; % high card 9, 4

    % A pair wins over a high card
    player_1_wins = compare_hands(hand_1, hand_2);
    assert(player_1_wins == 1);

    % A pair wins over a high card
    player_1_wins = compare_hands(hand_2, hand_1);
    assert(player_1_wins == 0);
end

%% test_if_no_combination_is_present_highest_card_wins:
function [] = test_four_of_a_kind_with_high_card_wins(tc)
    hand_1 = '1D1S1C1H3C'; % four 1s one 3
    hand_2 = '1D1S1C1H2C'; % four 1s one 2

    % A pair wins over a high card
    player_1_wins = compare_hands(hand_1, hand_2);
    assert(player_1_wins == 1);

    % A pair wins over a high card
    player_1_wins = compare_hands(hand_2, hand_1);
    assert(player_1_wins == 0);
end


%% test_it_finds_the_correct_winners:
function [] = test_it_finds_the_correct_winners(tc)
    assert(compare_hands('5H5C6S7SKD', '2C3S8S8DTD') == 0);
    assert(compare_hands('5D8C9SJSAC', '2C5C7D8SQH') == 1);
    assert(compare_hands('2D9CASAHAC', '3D6D7DTDQD') == 0);
    assert(compare_hands('4D6S9HQHQC', '3D6D7HQDQS') == 1);
    assert(compare_hands('2H2D4C4D4S', '3C3D3S9S9D') == 1);
end
