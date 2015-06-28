% test importing games
function tests = test_import_games
    tests = functiontests(localfunctions);
end

%% test_games_are_transformed_to_cells:
function [] = test_a_game_is_transformed_to_a_cell(tc)
    H = {
        '8C TS KC 9H 4S 7D 2S 5D 3S AC',
    };
    games = import_games(H);
    assert(size(games, 2) == 1);
    assert(size(games, 1) == 2);
end

%% test_games_are_transformed_to_cells
function [] = test_games_are_transformed_to_cells(tc)
    H = {
        '8C TS KC 9H 4S 7D 2S 5D 3S AC',
        '5C AD 5D AC 9C 7C 5H 8D TD KS',
        '3H 7H 6S KC JS QH TD JC 2D 8S'
    };
    games = import_games(H);
    assert(size(games, 2) == 3);
    assert(size(games, 1) == 2);
end

%% test_each_cell_contains_a_hand:
function [] = test_each_cell_contains_a_hand_of_5_cards(tc)
    H = {
        '8C TS KC 9H 4S 7D 2S 5D 3S AC'
    };
    games = import_games(H);

    assert(size(games, 1) == 2);
    hand_1 = games{1};
    hand_2 = games{2};

    assert(length(hand_1) == 10);
    assert(length(hand_2) == 10);
end
