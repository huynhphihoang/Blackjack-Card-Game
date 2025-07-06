%Test case 1
playerCards1 = ["AHearts" "JSpades"];
%Expected a blackjack

%Test case 2
playerCards2 = ["JSpades" "3Diamonds"];
%Expected a no-blackjack ("")

playerCards = playerCards2;
string = blackJackCheck(playerCards);
string