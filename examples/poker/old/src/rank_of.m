%% rank_of: determines the rank of a hand and its value
function [rank, value] = rank_of(hand)
    rank = 0;
    value = 0;

    % All possible hand combinations
    combinations = {
        'has_pair',
        'has_two_pair',
        'has_three_of_a_kind',
        'has_straight',
        'has_flush',
        'has_full_house',
        'has_four_of_a_kind',
        'has_straight_flush',
        'has_royal_flush',
    };

    % Starting with the highest valued combination,
    % check if the hand contains any combination
    for combination_rank = length(combinations):-1:1
        combination = combinations{combination_rank};
        [result, v] = feval(combination, hand);
        if (result == true)
            rank  = combination_rank;
            value = v;
            break;
        end
    end
end

%% has_pair:
function [result, value] = has_pair(hand)
    [result, value] = has_n_tims_m_of_a_kind(hand, 1, 2);
end

%% has_two_pair:
function [result, value] = has_two_pair(hand)
    [result, value] = has_n_tims_m_of_a_kind(hand, 2, 2);
end

%% has_three_of_a_kind:
function [result, value] = has_three_of_a_kind(hand)
    [result, value] = has_n_tims_m_of_a_kind(hand, 1, 3);
end

%% has_straight:
function [result, value] = has_straight(hand)
    result = true;
    values = order_hand_by_value(hand);
    % We assign the highest poker hand
    value = values(1);

    for i = 1:(size(values, 1) - 1)
        if (values(i) ~= (values(i + 1) + 1))
            result = false;
        end
    end
end

%% has_flush:
function [result, value] = has_flush(hand)
    result = true;
    value = value_of(hand(1));

    cards = size(hand, 2);

    % Check if all cards have the same face
    % A hand consists of Values and Faces: VFVFVFVFVF
    for i = 2:2:(cards - 2)
        if (hand(i) ~= hand(i + 2))
            result = false;
            value = 0;
            return;
        end
        % Set the value to the highest valued card
        value = max(value, value_of(hand(i + 1)));
    end
end

%% has_full_house:
function [result, value] = has_full_house(hand)
    value = 0;
    [result, value_two]   = has_pair(hand);

    % When two players both have a full house the player
    % with highest three of a kind wins
    % if both have the same three of a kind
    % the player with highest pair wins
    if (result)
        [result, value_three] = has_three_of_a_kind(hand);
        if (result)
            value = value_two + 100 * value_three;
        end
    end
end

%% has_four_of_a_kind:
function [result, value] = has_four_of_a_kind(hand)
    [result, value] = has_n_tims_m_of_a_kind(hand, 1, 4);
end

%% has_straight_flush:
% Outputs the result and the highest value of the straight,
% so that it is easy to confirm that a hand has a royal flush
function [result, value] = has_straight_flush(hand)
    [result, value] = has_flush(hand);
    if (result)
        [result, value] = has_straight(hand);
    end
end

%% is_royal_flush:
% A royal flush is simply a straight flush with highest value A
function [result, value] = has_royal_flush(hand)
    [result, value] = has_straight_flush(hand);
    if (value ~= value_of('A'))
        result = false;
        value  = 0;
    end
end

%% has_n_pairs:
function [result, value] = has_n_pairs(hand, n)
    [result, value] = has_n_tims_m_of_a_kind(hand, n, 2);
end

%% has_n_tims_m_of_a_kind: check if the hand has m times a
% n of a kind, for example 2 times a 2 of a kind
% Input: hand, n, m
% Output:
% result: true if the hand has n times a m of a kind
% value: the highest valued m of a kind
function [result, value] = has_n_tims_m_of_a_kind(hand, n, m)
    values = order_hand_by_value(hand);
    % Count each occurance of a value
    [occurances, values] = hist(values, unique(values));
    % Order the occurences by highest value
    [~, I]     = sort(values, 'descend');
    occurances = occurances(I);
    values     = values(I);

    % Check how many pairs the hand has
    has_n  = 0;
    for i = 1:length(values)
        if (occurances(i) == m)
            % If we allready found a pair, then this is an other pair, but lower
            if (has_n == 0)
                value = values(i);
            end
            has_n = has_n + 1;
        end
    end

    if (has_n >= n)
        result = true;
    else
        value = 0;
        result = false;
    end
end