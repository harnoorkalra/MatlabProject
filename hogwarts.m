function draft1()

clear; clc;

%Printing the introduction.
introduction=["Welcome" "to" "MATLAB" "Hogwarts!!!"];
dramaticPrint1(introduction);

disp("Press any key to continue.");
pause;
clc;

introduction="Please maximize your Command window by double clicking on it to enhance your experience.";
dramaticPrint2(introduction);
pause(2);
clc;

intro1="This is your first year here. Harry Potter was just born and Lord Voldemort has killed his entire family. ";
dramaticPrint2(intro1);
intro2="Voldemort is approaching Hogwarts along with the people second in command - Bellatrix lestrange, Lucius Malfoy, Peter Pettigrew and his army of death eaters. ";
dramaticPrint2(intro2);
intro3="He has killed off all of the families who refused to join him in his quest to create a dark army. ";
dramaticPrint2(intro3);
intro4="Harry Potter is just 2 months old. He has been sent to be raised by his aunt. ";
dramaticPrint2(intro4);
intro5="Dumbledore, the headmaster, trusts you. Hogwarts is counting on you.    ";
dramaticPrint2(intro5);
intro6="Fight the enemy.  ";
dramaticPrint2(intro6);


disp("Press any key to continue.");
pause;
clc;
intro7=["DEFEND" "HOGWARTS!"];
dramaticPrint1(intro7);


disp("Press any key to continue.");
pause;
clc;


disp("The game has different levels.");
disp("Level 1 - Peter Pettigrew");
disp("Level 2 - Lucius Malfoy");
disp("Level 3 - Bellatrix Lestrange");
disp("Level 4 - Lord Voldemort");
disp("Each level has a different outcome. Remember that saving Hogwarts is your duty.");


%Initialising spells for the game along with their spell powers and
%player,enemy health

enemies=["Lord Voldemort" "Lucius Malfoy" "Peter Pettigrew" "Bellatrix Lestrange"];
player_spells=["Crucio" "Sectumsempra" "Petrificus totalus" "Incendio" "Avada Kedavra" ...
    "Expecto patronum" "Wiggenweld Potion" "Protego" "Stupefy" "Expelliarmus"];
enemy_spells=["Crucio" "Sectumsempra!" "Imperio!!" "BOMBARDA MAXIMA" "AVADA KEDAVRA..." ...
    "Expulso!!" "Episkey" "FURNUNCULUS" "Confringo!" "Incendio"];
spell_power=[-26 -21 -14 -23 -39 -32 +24 -19 -22 -17]; 
player_health=200;
enemy_health=200;

disp("Press 1 to fight Lord Voldemort");
disp("Press 2 to fight Lucius Malfoy");
disp("Press 3 to fight Peter Pettigrew");
disp("Press 4 to fight Bellatrix Lestrange");

%Player inputs his choice for the enemy/level.
character_choice=input("Please enter the number for the character you want: ");
enemy=enemies(character_choice);
 
switch character_choice
    case 1
        clc;
        voldemort(enemy, enemy_health, player_health, player_spells, enemy_spells, spell_power);
    case 2
        clc;
        lucius(enemy, enemy_health, player_health, player_spells, enemy_spells, spell_power);
    case 3 
        clc;
        peter(enemy, enemy_health, player_health, player_spells, enemy_spells, spell_power);
    case 4
        clc;
        bellatrix(enemy, enemy_health, player_health, player_spells, enemy_spells, spell_power);
end 

clc;
%function 1 
function []=voldemort(enemy, enemy_health, player_health, player_spells, enemy_spells, spell_power)
        %Displaying all the spells along with their descriptions.
        pause(2); 
        disp(" ");
        fprintf('Choose the spell you want to use: \n');
        pause(0.6);
        fprintf('1 - %s tortures the enemy. \n', player_spells(1));
        pause(0.5);
        fprintf('2 - %s causes multiple lacerations on the enemy''s skin. \n', player_spells(2));
        pause(0.5);
        fprintf('3 - %s MIGHT cause immobility in the enemy along with health reduction \n', player_spells(3));
        pause(0.5);
        fprintf('4 - %s creates fire. \n',player_spells(4));
        pause(0.5);
        fprintf('5 - %s is a death curse. \n', player_spells(5));
        pause(0.5);
        fprintf('6 - %s creates a patronus of an animal to make the enemy ward off. \n', player_spells(6));
        pause(0.5);
        fprintf('7 - %s +Health \n', player_spells(7));
        pause(0.5);
        fprintf('8 - %s - Shielding charm \n', player_spells(8));
        pause(0.5);
        fprintf('9 - %s stuns the opponent. \n', player_spells(9));
        pause(0.5);
        fprintf('10 - %s knocks down the opponent''s wand\n',player_spells(10));
        pause(0.6);
        disp(" ");
        %Terminating the spell when one of the healths become 0.
        while enemy_health>0 && player_health>0
            disp(" ");
            player_spell = input('Enter the number corresponding to the spell: ');
            disp("");
            
            %Damage if the number entered is out of bounds.
            if player_spell~= 1:10
                disp("Oh no! You didn't cast a spell. You get -10 damage.");
                player_health=player_health-10;
                player_spell = input('Enter the number corresponding to the spell: ');
                disp("");
            end 
            
            %Decreasing enemy health and displaying of player's chosen
            %spell
            switch player_spell
                case 1
                    enemy_health=enemy_health+spell_power(1);
                    disp("You: CRUCIO!");
                case 2
                    enemy_health=enemy_health+spell_power(2);
                    disp("You: SECTUMSEMPRA!");
                case 3
                    enemy_health=enemy_health+spell_power(3);
                    disp("You: PETRIFICUS TOTALUS!");
                case 4
                    enemy_health=enemy_health+spell_power(4);
                    disp("You: INCENDIO!");
                case 5
                    enemy_health=enemy_health+spell_power(5);
                    disp("You: AVADA KEDAVRA!!");
                case 6
                    enemy_health=enemy_health+spell_power(6);
                    disp("You: EXPECTO PATRONUM!");
                case 7
                    player_health=player_health+spell_power(7);
                    disp("You: *drinks potion");
                case 8 
                    enemy_health=enemy_health+spell_power(8);
                    disp("You: Protego!");
                case 9
                    enemy_health=enemy_health+spell_power(9);
                    disp("You: Stupefy!");
                case 10
                    enemy_health=enemy_health+spell_power(10);
                    disp("You: Expelliarmus!");
            end
   
            %Randomising the enemy's spells.
            enemy_spell=randi(10);
            if enemy_spell==1                                               %Doing this to add more difficulty to the game. This will increase the probability of the strongest spell chosen to 2/10
                   enemy_spell=5;                                           %instead of  1/10 like the other spells.
            end 
            
            %displaying the damage of enemy and player.
            if enemy_spell~=7
                player_health=player_health+spell_power(enemy_spell)-16;
                disp(enemy+": "+enemy_spells(enemy_spell));
                    fprintf('Your damage is %d \t %s''s damage is %d \n',spell_power(enemy_spell)-14, enemy, spell_power(player_spell));
            else 
                enemy_health=enemy_health+spell_power(enemy_spell)+16;
                disp(enemy+": Episkey!");
                    fprintf('Your damage is %d \t %s''s damage is %d \n',spell_power(enemy_spell)-14, enemy, spell_power(player_spell)+14);
            end 
       
            %Displaying the final health of enemy and player after each spell
            fprintf('Your health = %d \t \t \t %s ''s health = %d \n',...
                 player_health, enemy, enemy_health);
        end


 
%Displaying the winning/losing statements.
disp("The war is now over.");
disp("Press any key to continue.");
pause;
clc;
        if enemy_health<=0 && enemy_health<player_health
            win1="Nagini, Voldemort's snake, lays dead beside him.";
            win2="Nothing of Voldemort remains but his ashes. ";
            win3="You have saved everyone.";
            win4="Congratulations! You defeated Lord Voldemort and saved Hogwarts from getting destroyed. ";
            dramaticPrint2(win1); 
            pause(1);
            dramaticPrint2(win2);
            pause(1);
            dramaticPrint2(win3);
            pause(1);
            dramaticPrint2(win4);
            pause(1);
            disp("Press any key to end the game.");
            pause;
        else
            loss1="Nagini, Voldemort's snake, hisses at you while Voldemort gets ready to attack you.";
            pause(1);
            loss2="The last words you heard - ''AVADA KEDAVRA''";
            pause(1);
            loss3="OH NO! YOU LOST! Hogwarts is destroyed. ";
            pause(1);
            dramaticPrint2(loss1);
            dramaticPrint2(loss2);
            dramaticPrint2(loss3);
            disp("Press any key to end the game.");
            pause;
        end 

    end 

%Function 2
%Similar structure as the previous function.
function []=lucius(enemy, enemy_health, player_health, player_spells, enemy_spells, spell_power)

        pause(2); 
        disp(" ");
        fprintf('Choose the spell you want to use: \n');
        pause(0.6);
        fprintf('1 - %s tortures the enemy. \n', player_spells(1));
        pause(0.5);
        fprintf('2 - %s causes multiple lacerations on the enemy''s skin. \n', player_spells(2));
        pause(0.5);
        fprintf('3 - %s MIGHT cause immobility in the enemy along with health reduction \n', player_spells(3));
        pause(0.5);
        fprintf('4 - %s creates fire. \n',player_spells(4));
        pause(0.5);
        fprintf('5 - %s is a death curse. \n', player_spells(5));
        pause(0.5);
        fprintf('6 - %s creates a patronus of an animal to make the enemy ward off. \n', player_spells(6));
        pause(0.5);
        fprintf('7 - %s +Health \n', player_spells(7));
        pause(0.5);
        fprintf('8 - %s - Shielding charm \n', player_spells(8));
        pause(0.5);
        fprintf('9 - %s stuns the opponent. \n', player_spells(9));
        pause(0.5);
        fprintf('10 - %s knocks down the opponent''s wand\n',player_spells(10));
        pause(0.6);
        disp(" ");

        while enemy_health>0 && player_health>0
            disp(" ");
            player_spell = input('Enter the number corresponding to the spell: ');
            disp("");
            
            
                     if player_spell~= 1:10
                disp("Oh no! You didn't cast a spell. You get -10 damage.");
                player_health=player_health-10;
                player_spell = input('Enter the number corresponding to the spell: ');
                disp("");
                     end 
            
            switch player_spell
                case 1
                    enemy_health=enemy_health+spell_power(1);
                    disp("You: CRUCIO!");
                case 2
                    enemy_health=enemy_health+spell_power(2);
                    disp("You: SECTUMSEMPRA!");
                case 3
                    enemy_health=enemy_health+spell_power(3);
                    disp("You: PETRIFICUS TOTALUS!");
                case 4
                    enemy_health=enemy_health+spell_power(4);
                    disp("You: INCENDIO!");
                case 5
                    enemy_health=enemy_health+spell_power(5);
                    disp("You: AVADA KEDAVRA!!");
                case 6
                    enemy_health=enemy_health+spell_power(6);
                    disp("You: EXPECTO PATRONUM!");
                case 7
                    player_health=player_health+spell_power(7);
                    disp("You: *drinks potion");
                case 8 
                    enemy_health=enemy_health+spell_power(8);
                    disp("You: Protego!");
                case 9
                    enemy_health=enemy_health+spell_power(9);
                    disp("You: Stupefy!");
                case 10
                    enemy_health=enemy_health+spell_power(10);
                    disp("You: Expelliarmus!");
            end
            
    
            enemy_spell=randi(10);
            if enemy_spell==1 
        
                enemy_spell=5;
            end 
            
            
            if enemy_spell~=7
                player_health=player_health+spell_power(enemy_spell)-8;
                disp(enemy+": "+enemy_spells(enemy_spell));
                    fprintf('Your damage is %d \t %s''s damage is %d \n',spell_power(enemy_spell)-6, enemy, spell_power(player_spell));
            else 
                enemy_health=enemy_health+spell_power(enemy_spell)+8;
                disp(enemy+": Episkey!");
                    fprintf('Your damage is %d \t %s''s damage is %d  \n',spell_power(enemy_spell)-6, enemy, spell_power(player_spell)+6);
            end 
         
    
            fprintf('Your health = %d \t \t \t %s ''s health = %d \n',...
                 player_health, enemy, enemy_health);
        end
    disp("The war is now over.");
disp("Press any key to continue.");
pause;
clc;
        if enemy_health<=0 && enemy_health<player_health
            win1="Lucius's wife walks towards the body of her husband. She gets down on her knees and holds his hand. ";
            win2="She looks at you and nods. Somehow, she knew all of this was wrong and that her husband had went too far supporting Voldemort.";
            win3="I suppose she understood that people get what they deserve. ";
            win4="Congratulations! You held your fort and survived! Hogwarts has been saved.";
            dramaticPrint2(win1);
            dramaticPrint2(win2);
            dramaticPrint2(win3);
            dramaticPrint2(win4);
            disp("Press any key to end the game.");
            pause;
        else
            lost1="Bill Weasley was putting a protection charm on the fort when one of the death eaters attacked him from behind. ";
            lost2="Bill's lifeless body collapsed on the ground. ";
            lost3="As you turn your head, Lucius attacks you. You fall down bleeding.";
            lost4="You lost your fort. The army of the death eaters has invaded Hogwarts.";
            dramaticPrint2(lost1);
            dramaticPrint2(lost2);
            dramaticPrint2(lost3);
            dramaticPrint2(lost4);
            disp("Press any key to end the game.");
            pause;
        end 

    end 

%Function 3
%Similar structure as the previous function.

function []=peter(enemy, enemy_health, player_health, player_spells, enemy_spells, spell_power)

        pause(2); 
        disp(" ");
        fprintf('Choose the spell you want to use: \n');
        pause(0.6);
        fprintf('1 - %s tortures the enemy. \n', player_spells(1));
        pause(0.5);
        fprintf('2 - %s causes multiple lacerations on the enemy''s skin. \n', player_spells(2));
        pause(0.5);
        fprintf('3 - %s MIGHT cause immobility in the enemy along with health reduction \n', player_spells(3));
        pause(0.5);
        fprintf('4 - %s creates fire. \n',player_spells(4));
        pause(0.5);
        fprintf('5 - %s is a death curse. \n', player_spells(5));
        pause(0.5);
        fprintf('6 - %s creates a patronus of an animal to make the enemy ward off. \n', player_spells(6));
        pause(0.5);
        fprintf('7 - %s +Health \n', player_spells(7));
        pause(0.5);
        fprintf('8 - %s - Shielding charm \n', player_spells(8));
        pause(0.5);
        fprintf('9 - %s stuns the opponent. \n', player_spells(9));
        pause(0.5);
        fprintf('10 - %s knocks down the opponent''s wand\n',player_spells(10));
        pause(0.6);
        disp(" ");

        while enemy_health>0 && player_health>0
            disp(" ");
            player_spell = input('Enter the number corresponding to the spell: ');
            disp("");
            if player_spell~= 1:10
                disp("Oh no! You didn't cast a spell. You get -10 damage.");
                player_health=player_health-10;
                player_spell = input('Enter the number corresponding to the spell: ');
                disp("");
            end 
            
            switch player_spell
                case 1
                    enemy_health=enemy_health+spell_power(1);
                    disp("You: CRUCIO!");
                case 2
                    enemy_health=enemy_health+spell_power(2);
                    disp("You: SECTUMSEMPRA!");
                case 3
                    enemy_health=enemy_health+spell_power(3);
                    disp("You: PETRIFICUS TOTALUS!");
                case 4
                    enemy_health=enemy_health+spell_power(4);
                    disp("You: INCENDIO!");
                case 5
                    enemy_health=enemy_health+spell_power(5);
                    disp("You: AVADA KEDAVRA!!");
                case 6
                    enemy_health=enemy_health+spell_power(6);
                    disp("You: EXPECTO PATRONUM!");
                case 7
                    player_health=player_health+spell_power(7);
                    disp("You: *drinks potion");
                case 8 
                    enemy_health=enemy_health+spell_power(8);
                    disp("You: Protego!");
                case 9
                    enemy_health=enemy_health+spell_power(9);
                    disp("You: Stupefy!");
                case 10
                    enemy_health=enemy_health+spell_power(10);
                    disp("You: Expelliarmus!");
            end
          
            enemy_spell=randi(10);
            if enemy_spell==1  
        
                enemy_spell=5;
            end 
            
          
            if enemy_spell~=7
                player_health=player_health+spell_power(enemy_spell)-4;
                disp(enemy+": "+enemy_spells(enemy_spell));
                    fprintf('Your damage is %d \t %s''s damage is %d \n',spell_power(enemy_spell)-2, enemy, spell_power(player_spell));
            else 
                enemy_health=enemy_health+spell_power(enemy_spell)+4;
                disp(enemy+": Episkey!");
                    fprintf('Your damage is %d \t %s''s damage is %d \n',spell_power(enemy_spell)-2, enemy, spell_power(player_spell)+2);
            end 
      
            fprintf('Your health = %d \t \t \t %s ''s health = %d \n',...
                player_health, enemy, enemy_health);
        end
    
 disp("The war is now over.");
disp("Press any key to continue.");
pause;
clc;

        if enemy_health<=0 && enemy_health<player_health
            win1="You have killed Peter Pettigrew and the death eaters who were with him. ";
            win2="Congratulations! You won! Hogwarts has been saved because of your contribution and knowledge. ";
            dramaticPrint2(win1);
            dramaticPrint2(win2);
            disp("Press any key to end the game.");
            pause;
        else
            lost1="OH NO! You didn't watch out! Peter sneakily attacked you while you took a breather. ";
            lost2="Hogwarts has been destroyed since you failed to hold your fort. ";
            lost3="Watch out for the sneaky death eaters the next time.";
            dramaticPrint2(lost1);
            dramaticPrint2(lost2);
            dramaticPrint2(lost3);
            disp("Press any key to end the game.");
            pause;
        end 

end 

%Function 4
%Similar structure as the previous function.

function []=bellatrix(enemy, enemy_health, player_health, player_spells, enemy_spells, spell_power)

        pause(2); 
        disp(" ");
        fprintf('Choose the spell you want to use: \n');
        pause(0.6);
        fprintf('1 - %s tortures the enemy. \n', player_spells(1));
        pause(0.5);
        fprintf('2 - %s causes multiple lacerations on the enemy''s skin. \n', player_spells(2));
        pause(0.5);
        fprintf('3 - %s MIGHT cause immobility in the enemy along with health reduction \n', player_spells(3));
        pause(0.5);
        fprintf('4 - %s creates fire. \n',player_spells(4));
        pause(0.5);
        fprintf('5 - %s is a death curse. \n', player_spells(5));
        pause(0.5);
        fprintf('6 - %s creates a patronus of an animal to make the enemy ward off. \n', player_spells(6));
        pause(0.5);
        fprintf('7 - %s +Health \n', player_spells(7));
        pause(0.5);
        fprintf('8 - %s - Shielding charm \n', player_spells(8));
        pause(0.5);
        fprintf('9 - %s stuns the opponent. \n', player_spells(9));
        pause(0.5);
        fprintf('10 - %s knocks down the opponent''s wand\n',player_spells(10));
        pause(0.6);
        disp(" ");

        while enemy_health>0 && player_health>0
            disp(" ");
            player_spell = input('Enter the number corresponding to the spell: ');
            disp("");
            if player_spell~= 1:10
                disp("Oh no! You didn't cast a spell. You get -10 damage.");
                player_health=player_health-10;
                player_spell = input('Enter the number corresponding to the spell: ');
                disp("");
            end 
            
            switch player_spell
                case 1
                    enemy_health=enemy_health+spell_power(1);
                    disp("You: CRUCIO!");
                case 2
                    enemy_health=enemy_health+spell_power(2);
                    disp("You: SECTUMSEMPRA!");
                case 3
                    enemy_health=enemy_health+spell_power(3);
                    disp("You: PETRIFICUS TOTALUS!");
                case 4
                    enemy_health=enemy_health+spell_power(4);
                    disp("You: INCENDIO!");
                case 5
                    enemy_health=enemy_health+spell_power(5);
                    disp("You: AVADA KEDAVRA!!");
                case 6
                    enemy_health=enemy_health+spell_power(6);
                    disp("You: EXPECTO PATRONUM!");
                case 7
                    player_health=player_health+spell_power(7);
                    disp("You: *drinks potion");
                case 8 
                    enemy_health=enemy_health+spell_power(8);
                    disp("You: Protego!");
                case 9
                    enemy_health=enemy_health+spell_power(9);
                    disp("You: Stupefy!");
                case 10
                    enemy_health=enemy_health+spell_power(10);
                    disp("You: Expelliarmus!");
            end
           
            enemy_spell=randi(10);
            if enemy_spell==1 || enemy_spell==6 
        
                enemy_spell=5;
            end 
            
         
            if enemy_spell~=7
                player_health=player_health+spell_power(enemy_spell)-11;
                disp(enemy+": "+enemy_spells(enemy_spell));
                    fprintf('Your damage is %d \t %s''s damage is %d \n',(spell_power(enemy_spell))-9, enemy, spell_power(player_spell));
            else 
                enemy_health=enemy_health+spell_power(enemy_spell)+11;
                disp(enemy+": Episkey!");
                    fprintf('Your damage is %d \t %s''s damage is %d \n',(spell_power(enemy_spell))-9, enemy, (spell_power(player_spell))+9);
            end 
            
    
            fprintf('Your health = %d \t \t \t %s ''s health = %d \n',...
                player_health, enemy, enemy_health);
        end
    
disp("The war is now over.");
disp("Press any key to continue.");
pause;
clc;

        if enemy_health<=0 && enemy_health<player_health
            win1="Bellatrix Lestrange had killed innumerable innocent people since she escaped from Azkaban, the prison of the wizarding world. ";
            win2="She was a cunning witch with no emotions. ";
            win3="She broke into countless pieces as you casted your last spell.";
            win4="Congratulations for killing off one of the most cunning, evil and powerful witches in the wizarding history.";
            win5="The war ended with the death of Voldemort by Professor Dumbledore.";
            win6="Hogwarts is once again safe and sound.";
            dramaticPrint2(win1);
            dramaticPrint2(win2);
            dramaticPrint2(win3);
            dramaticPrint2(win4);
            dramaticPrint2(win5);
            dramaticPrint2(win6);
            disp("Press any key to end the game.");
            pause;
        else
            lost1="OH NO! Bellatrix casted a curse, grinning wickedly, as you fell on your back. ";
            lost2="You were saved by Nymphadora Tonks, an upper year student at Hogwarts.";
            lost3="Nymphadora got busy saving you and so the death eaters sneaked into the fort with Bellatrix.";
            lost4="You lost Hogwarts!! ";
            dramaticPrint2(lost1);
            dramaticPrint2(lost2);
            dramaticPrint2(lost3);
            dramaticPrint2(lost4);
            disp("Press any key to end the game.");
            pause;
        end 
    
        disp(" ");

    end 

%Function to print string dramatically
function [] = dramaticPrint1(str)
   clc;
    for i=1:length(str)
        fprintf('%s', str(i));                                              %Printing the elements of the array one by one.
        fprintf('\n');
        pause(0.9);
    end
    fprintf('\n');
end

%Function to print string dramatically
function []=dramaticPrint2(str)
    len=strlength(str);
    i=1;
    while i<=len+2
        fprintf(extractBetween(str,i,i+1));                                 %Extracting and printing the letters of the string one by one.
        i=i+2;
        pause(0.1);
        if i>len
            break;
        end 
    end 
    fprintf('\n');
    
end 

end