function [playerBet] = roundBet (playerName,playerDeposit)
    %Asking the player for their bet
    playerBet = input("What is your bet?(minimum $20 and maximum $1000) ");

    %Checking for sufficient and valid amount
    while playerBet < 20 || playerBet > 1000
        fprintf("%s",playerName);
        if playerBet < 20
            playerBet = input(", please bet more: ");
        elseif playerBet > playerDeposit
            playerBet = input(", please bet a valid amount: ");
        else
            playerBet = input(", you exceeded the maximum amount, bet again: ");
        end
    end
end