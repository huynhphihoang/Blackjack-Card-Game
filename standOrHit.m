function [playerPoints, dealerPoints, playerCards, dealerCards, playingDeck] = standOrHit(playerCards, dealerCards, deck, playingDeck, playerPoints, dealerPoints)
    % Initialize new card hands
    newPlayerCards = [];
    newDealerCards = [];
    newPlayerPoints = 0;
    newDealerPoints = 0;
    % Asking the user if they want to draw another card
    fprintf("\n");
    fprintf("Do you wish to stand(1) or hit(2)? ");
    playerDecision = input("");

    % Test if the user has input the wanted numbers 1 or 2
    while playerDecision ~= 1 && playerDecision ~= 2
        playerDecision = input("Please make a valid option: ");
    end

    % Conditional execution
    if playerDecision == 2
        [newPlayerCards, newDealerCards, playingDeck] = drawCards(deck, 1);
        [newPlayerPoints, newDealerPoints] = countPoints(newPlayerCards, newDealerCards, deck);
    elseif playerDecision == 1
        [newDealerCards, playingDeck] = drawDealerCards(playingDeck, 1);
        [newDealerPoints] = countDealerPoints(newDealerCards,deck);
    end
    % Adding old points to new ones, and adding old card hands to new ones
    playerPoints = newPlayerPoints + playerPoints;
    dealerPoints = newDealerPoints + dealerPoints;
    playerCards = [playerCards newPlayerCards];
    dealerCards = [dealerCards newDealerCards];
end