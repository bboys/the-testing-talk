%% order_hand_by_value:
function [ordered_hand] = order_hand_by_value(hand)
    % We only care about the value numbers
    hand = hand(1:2:10);
    ordered_hand = zeros(5, 1);
    for h = 1:5
        ordered_hand(h) = value_of(hand(h));
    end
    ordered_hand = sort(ordered_hand, 'descend');
end