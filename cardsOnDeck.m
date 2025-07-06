function [] = cardsOnDeck (playerCards,dealerCards,playerPoints,dealerPoints,playerBlackJackString,dealerBlackJackString)
    fprintf('Player Cards: ');
    for i = 1:length(playerCards)
        fprintf('%s ', playerCards{i});
    end
    fprintf('           Total points: %d\n', playerPoints);
    fprintf("%s",playerBlackJackString);
    fprintf("\n");
    fprintf('Dealer Cards: ');
    for i = 1:length(dealerCards)
        fprintf('%s ', dealerCards{i});
    end
    fprintf('           Total points: %d\n', dealerPoints);
    fprintf("%s",dealerBlackJackString);
end