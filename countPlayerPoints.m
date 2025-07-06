function [newPlayerPoints] = countPlayerPoints (playerCards,deck)
    newPlayerPoints = 0;
    for i = 1:length(playerCards)
        card = playerCards(i);
        index = strcmp(card, deck(1, :));
        points = str2double(deck(2,index));
        newPlayerPoints = newPlayerPoints + points;
    end
end