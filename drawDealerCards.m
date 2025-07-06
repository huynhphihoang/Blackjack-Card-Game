function [dealerCards,playingDeck] = drawDealerCards (playingDeck,n)    
    %Randomly draw 2 cards for the dealer(NPC)
    dealerCards = [];
    
    %Shuffe the cards
    shuffledPlayingDeck = randperm(length(playingDeck));
    for i = 1:n    
        randomIndex = shuffledPlayingDeck(i+2);
        dealerCards = [dealerCards playingDeck(randomIndex)];
    end
    
    %Remove the cards from the deck
    playingDeck(shuffledPlayingDeck(1:n)) = [];
end