%% compare_high_card:
function [winner] = compare_high_card(hand_player_1, hand_player_2)
    winner = -1;

    hand_player_1 = order_hand_by_value(hand_player_1);
    hand_player_2 = order_hand_by_value(hand_player_2);

    for h = 1:5
        if (hand_player_1(h) > hand_player_2(h))
            winner = 1;
            break;
        elseif (hand_player_1(h) < hand_player_2(h))
            winner = 2;
            break;
        end
    end
end