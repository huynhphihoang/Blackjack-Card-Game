function [playerDeposit] = cashCalculator (playerDeposit,playerBet,cashInRate)
    playerDeposit = playerDeposit + playerBet*cashInRate;
end