%% compare_ranks:
function [winner] = compare_rank(hand_player_1, hand_player_2)
    winner = 0;

    [rank_1, value_1] = rank_of(hand_player_1);
    [rank_2, value_2] = rank_of(hand_player_2);

    if (rank_1 > rank_2)
        winner = 1;
    elseif (rank_2 > rank_1)
        winner = 2;
    else
        if (value_1 > value_2)
            winner = 1;
        elseif (value_2 > value_1)
            winner = 2;
        end
    end
end