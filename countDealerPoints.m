function [newDealerPoints] = countDealerPoints (dealerCards,deck)
    newDealerPoints = 0;
    for i = 1:length(dealerCards)
        card = dealerCards(i);
        index = strcmp(card, deck(1, :));
        points = str2double(deck(2,index));
        newDealerPoints = newDealerPoints + points;
    end
end