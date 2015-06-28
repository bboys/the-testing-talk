%% import_hands:
function [games] = import_games(H)
    n = length(H);
    games = cell(2, n);
    for h = 1:n
        games(:, h) = parse_hand(H{h});
    end
end

%% parse_hand:
function [hand] = parse_hand(hand)
    % Remove the spaces
    hand(find(hand == ' ')) = [];
    n = length(hand);
    hand = {hand(1:(n / 2)), hand(((n / 2) + 1):n)};
end