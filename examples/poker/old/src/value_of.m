%% value_of:
function [value] = value_of(card)
    if (card == 'T')
        value = 10;
    elseif (card == 'J')
        value = 11;
    elseif (card == 'Q')
        value = 12;
    elseif (card == 'K')
        value = 13;
    elseif (card == 'A')
        value = 14;
    else
        value = str2num(card);
    end
end