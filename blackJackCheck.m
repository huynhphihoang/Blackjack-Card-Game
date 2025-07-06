function [hasBlackJackString,hasBlackJack] = blackJackCheck(playerCards)
    % Check if playerCards contain an Ace ('A') and a 10-value card
    hasAce = any(contains(playerCards, 'A'));
    hasTenValueCard = any(contains(playerCards, {'10', 'J', 'Q', 'K'}));
    
    % Player has a blackjack if both conditions are met
    hasBlackJack = hasAce && hasTenValueCard;

    if hasBlackJack
        hasBlackJackString = "YOU HAVE A BLACKJACK";
    else
        hasBlackJackString = "";
    end
end