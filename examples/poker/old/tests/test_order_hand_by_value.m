% test importing games
function tests = test_import_games
    tests = functiontests(localfunctions);
end

%% test_it_gets_the_hands_values_and_sorts_them:
function [] = test_it_gets_the_hands_values_and_sorts_them(tc)
    hand   = '8CTSKC9H4S';
    values = order_hand_by_value(hand);
    tc.assertEqual(values, [13; 10; 9; 8; 4], 'Hand is not ordered correctly');
end
