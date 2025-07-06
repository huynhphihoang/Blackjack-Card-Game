%Test case 1
playerCards1 = ["JSpades" "5Hearts"];
dealerCards1 = ["AClubs" "ADiamonds"];
deck1 = ["AClubs" "ADiamonds" "JSpades" "5Hearts"; 1 1 10 5];%Customized deck 
%Expected
string1 = "playerPoints = 15, dealerPoints = 2";

%Test case 2
playerCards2 = ["" ""];
dealerCards2 = ["AClubs" "9Spades"];
deck2 = ["AClubs" "ADiamonds" "9Spades";1 1 9];
string2 = "playerPoints = ,dealerPoints = 10";

%Test case 3
playerCards3 = ["AHearts" "7Spades" "10Diamonds"];
dealerCards3 = ["5Clubs" "ADiamonds" "9Clubs"];
deck3 = ["AHearts" "7Spades" "10Diamonds" "5Clubs" "ADiamonds" "9Clubs";
    1 7 10 5 1 9];
string3 = "Player Points: 18, Dealer Points = 15";

%Testing the function
playerCards = playerCards3;
dealerCards = dealerCards3;
string = string3;
deck = deck3;

[playerPoints,dealerPoints] = countPoints(playerCards,dealerCards,deck);
playerPoints
dealerPoints
string

