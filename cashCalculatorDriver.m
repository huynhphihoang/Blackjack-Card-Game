cashInRate = [-1 0 1 1.5];
playerDeposit = 450;
playerBet = [20 100 50 65];
result = [];
expectedResult = [430 450 500 547.5]; 
for i = 1:length(cashInRate)
    result = [result cashCalculator(playerDeposit,playerBet(i),cashInRate(i))];
    fprintf("%.2f",result(i));
    fprintf("\n");
    fprintf("Expect: %.2f",expectedResult(i));
    fprintf("\n");
end
