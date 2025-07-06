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
while playerDeposit < 200 || isempty(playerDeposit)
        playerInfo = inputdlg({'Please deposit more credit to engage:'},dlgtitle, ...
            dims,definput);
        playerDeposit = str2double(playerInfo{1});
end