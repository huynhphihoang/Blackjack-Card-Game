function [playerCards,dealerCards,playingDeck] = drawCards (deck,n)
    playingDeck = deck(1,:); %This is the deck for playing
    %Draw the cards for n number of times
    [dealerCards,playingDeck] = drawDealerCards(playingDeck,n);
    [playerCards,playingDeck] = drawPlayerCards(playingDeck,n);   
end