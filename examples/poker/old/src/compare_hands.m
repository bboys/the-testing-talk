%% compare_hands:
function [player_1, player_2] = compare_hands(hand_player_1, hand_player_2)
    player_1 = 0;
    player_2 = 0;

    % First compare by rank, then if no winner was found
    % compare by high card
    winner = compare_rank(hand_player_1, hand_player_2);
    if (winner == 0)
        winner = compare_high_card(hand_player_1, hand_player_2);
    end

    if (winner == 1)
        player_1 = 1;
    elseif (winner == 2)
        player_2 = 1;
    else
end