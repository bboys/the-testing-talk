%% who_wins:
function [player_1_wins, player_2_wins] = who_wins(filename)
    H = importdata(filename);
    games = import_games(H);

    player_1_wins = 0;
    player_2_wins = 0;

    for game = games
        [p1, p2] = compare_hands(game{1}, game{2});
        player_1_wins = player_1_wins + p1;
        player_2_wins = player_2_wins + p2;
    end

    fprintf('Player 1 wins %d rounds of %d rounds.\n', player_1_wins, player_1_wins + player_2_wins);
end
