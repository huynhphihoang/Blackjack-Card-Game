function [newPlayerPoints, newDealerPoints] = countPoints(playerCards, dealerCards, deck)
    newPlayerPoints = countPlayerPoints(playerCards,deck);
    newDealerPoints = countDealerPoints(dealerCards,deck);
end