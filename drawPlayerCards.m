function [playerCards,playingDeck] = drawPlayerCards(playingDeck,n)
    %Randomly draw 2 cards for the player
    playerCards = [];

    %Shuffe the cards
    shuffledPlayingDeck = randperm(length(playingDeck));
    for i = 1:n
        randomIndex = shuffledPlayingDeck(i);
        playerCards = [playerCards playingDeck(randomIndex)];
    end
    
    %Remove the cards from the deck
    playingDeck(shuffledPlayingDeck(1:n)) = [];
end