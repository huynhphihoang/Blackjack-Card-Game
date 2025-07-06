%Generating card desk consists of 52 cards
%Define 3 vectors 
cardValues = ["2", "3", "4", "5", "6" ,"7" ,"8" ,"9", "10" ,"J", "Q", "K", "A"];%Card Values 
cardSymbol = ["H", "S", "D", "C"]; %Hearts, Spades, Diamonds, Clubs
cardNumericValues = [2 3 4 5 6 7 8 9 10 10 10 10 1]; %Values for calculation
%Genearte a 2D Matrix with 2 rows are the concatenated result of first two
%and the cardNumericValues vector
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


