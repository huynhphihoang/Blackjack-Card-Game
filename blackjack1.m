%% Collecting player's basic information
%Create a popup input dialog
dlgtitle = 'Welcome to the UOA Casino BlackJack Table';
prompt = {'What is your name:','How much credit do you have?(minimum $200)'};
dims = [1 100];
definput = {'',''};
playerInfo = inputdlg(prompt,dlgtitle,dims,definput);

if ~isempty(playerInfo)
    playerName = playerInfo{1}; %Storing the player's name
    playerDeposit = str2double(playerInfo{2}); %Storing the deposit amount
end

while playerDeposit < 200 || isempty(playerDeposit) %Checking if the player has deposited a sufficient amount
        playerInfo = inputdlg({'Please deposit more credit to engage:'},dlgtitle, ...
            dims,definput);
        playerDeposit = str2double(playerInfo{1});
end
%% Creating a vector containing playable cards
%Generating card desk consists of 52 cards
%Define 3 vectors 
cardValues = ["2", "3", "4", "5", "6" ,"7" ,"8" ,"9", "10" ,"J", "Q", "K", "A"];%Card Values 
cardSymbol = ["Hearts", "Spades", "Diamonds", "Clubs"]; %Hearts, Spades, Diamonds, Clubs

cardNumericValues = [2 3 4 5 6 7 8 9 10 10 10 10 1]; %Values for calculation
%Genearte a 2D Matrix with first row being the concatenated result of first two
%and the cardNumericValues vector in the second row
deck = strings(2,length(cardValues)*length(cardSymbol));

%An index for assigning numeric values
numericValueIndex = 1;

%Fill in the deck vector
for i = 1:length(cardValues)
    for j =1:length(cardSymbol)
        index = (i-1)*length(cardSymbol) + j;
        cardFace = strcat(cardValues(i) + cardSymbol(j));
        deck(1,index) = cardFace;
        deck(2,index) = cardNumericValues(numericValueIndex);
    end
    numericValueIndex = numericValueIndex + 1;
end

%% 
%Initialize payoff rate
cashInRate = 1;

%Initialize card vectors
playerCards = [];
dealerCards = [];

%Announce the start of the round
fprintf("Let's start the round: \n");
playerBet = roundBet(playerName,playerDeposit);
[playerCards,dealerCards,playingDeck] = drawCards(deck,2);
while true
    %Checking for a blackjack
    [playerBlackJackString,playerBlackJack] = blackJackCheck (playerCards);
    [dealerBlackJackString,dealerBlackJack] = blackJackCheck (dealerCards);
    
    %Payoff rates for blackjacks either of the player or dealer
    cashInRate = 1;

    %Display the cards on hands
    displayDepositAmount(playerDeposit,playerBet);
    [playerPoints, dealerPoints] = countPoints(playerCards,dealerCards,deck);
    cardsOnDeck (playerCards,dealerCards,playerPoints,dealerPoints, ...
        playerBlackJackString,dealerBlackJackString);
    
    %Checking for a start-of-round blackjack
    if playerBlackJack == true && dealerBlackJack == true %Both have blackjack
        cashInRate = 1;
        playerDeposit = cashCalculator(playerDeposit,playerBet,cashInRate);
        fprintf("YOU HAVE A PUSH WITH THE DEALER");
        fprintf("\n");
        fprintf("You have earned: $%.0f, and still have $%.1f",playerBet*cashInRate,playerDeposit);
    
    elseif  playerBlackJack == true %The player has blackjack
        cashInRate = 1.5;
        playerDeposit = cashCalculator(playerDeposit,playerBet,cashInRate);
        fprintf("YOU HAVE A WON THE GAME");
        fprintf("\n");
        fprintf("You have earned: $%.1f, and still have $%.1f",playerBet*cashInRate,playerDeposit);
    
    elseif dealerBlackJack == true %The dealer has blackjack
        cashInRate = -1;
        playerDeposit = cashCalculator(playerDeposit,playerBet,cashInRate);
        fprintf("THE DEALER HAVE A WON THE GAME");
        fprintf("\n");
        fprintf("You have earned: $%.1f, and still have $%.1f",playerBet*cashInRate,playerDeposit);
    end

    % Ask the player if they want to play again
    fprintf("Do you want to play again? (yes/no): ");
    playAgain = input("", 's');
    
    % Check if the player wants to play again
    if strcmpi(playAgain, 'no')
        break; % Exit the loop if the player doesn't want to play again
    end
end
%%
%Starting a new round if none of the above conditions are met
[newPlayerPoints, newDealerPoints, playerCards, dealerCards, playingDeck] = standOrHit(playerCards,dealerCards,deck, playingDeck,playerPoints,dealerPoints);

