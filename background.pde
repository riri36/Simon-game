int score = 0; //counts score of user

void mainMenu()
{
  //greets the user and asks if they want instructions
  fill(0);
  textSize(32);
  text("Main Menu", 310, 100);
  textSize(30);
  text("Hello! Let's play...", 250, 190);
  textSize(45);
  fill(244, 65, 229);
  text("S ", 310, 265);
  fill(244, 66, 66);
  text("I ", 330, 265);
  fill(244, 131, 65);
  text("M ", 345, 265);
  fill(244, 208, 65);
  text("O ", 380, 265);
  fill(187, 244, 65);
  text("N ", 410, 265);
  fill(65, 244, 184);
  text("!", 440, 265);
  textSize(32);
  fill(0);
  text("Would you like instructions?", 190, 340);
  fill(255, 0, 0);
  rect(450, 400, 80, 80); // red
  fill (83, 165, 33);
  rect (220, 400, 80, 80); // green 
  textSize(22);
  fill(0);
  text("YES", 240, 450);
  text("NO", 475, 450);
}

void tiles4Screen()
{
  //plays the 4 squares screen and prints the score at the bottom
  fill(0);
  textSize(32);
  text("PRESS the spacebar to BEGIN", 150, 50);
  fill (83, 165, 33);
  rect (100, 100, 280, 280); // green  
  fill (255, 204, 0);
  rect(400, 100, 280, 280); // yellow
  fill (255, 0, 0);
  rect(400, 400, 280, 280); // red
  fill (20, 75, 200);
  rect(100, 400, 280, 280); // blue
  fill(0);
  text("SCORE: "+score, 300, 750);
}

int numClicks = 0; //counts the number of times the user clicks a button in the correct
//sequence and also is used as the index for the position in the arraylist that is
//being checked.
void mousePressed()
{
  if (scene==2)//4 button screen
  {
    //illuminates the 4 screen buttons when clicked on by user and plays a sound
    //using the xy coordinates of the buttons
    if (mouseX <= 380 && mouseX >= 100 && mouseY <= 380 && mouseY >= 100)
    {
      flashTile4(1); //green
    } else if (mouseX <= 680 && mouseX >= 400 && mouseY <= 380 && mouseY >= 100)
    {
      flashTile4(2); //yellow
    } else if (mouseX <= 680 && mouseX >= 400 && mouseY <= 680 && mouseY >= 400)
    {
      flashTile4(3); //red
    } else if (mouseX <= 380 && mouseX >= 100 && mouseY <= 680 && mouseY >= 400)
    {
      flashTile4(4); //blue
    }
  }
  if (scene==5)//scene == 5 is instructions
  {
    //if the mouse presses the "click to continue" button, it will change scene to
    //equal 4, which will lead to the choosingTiles() method using the xy coordinates 
    //of the buttons
    if (mouseX >= 550 && mouseX <=750 && mouseY >=680 && mouseY <=755)
    {
      scene=4; //choosingTiles();
    }
  }
  if (scene==6)
  {
    //scene == 6 is the main menu method, so if the user clicks yes to instructions
    //then the scene will change to equal 5 and the instructions method will play,
    //but if the user clicks no to instructions the scene will change to equal 4 and
    //the choosing tiles method will play using the xy coordinates of the buttons.
    if (mouseX >=220 && mouseX <= 300 && mouseY >= 400 && mouseY <= 480 && clickOnce)
    {
      scene=5;
      clickOnce = false;
    } else if (mouseX >= 450 && mouseX <= 530 && mouseY >=400 && mouseY <= 480 && clickOnce)
    {
      scene=4;
      clickOnce = false;
    }
  }
  if (scene==3)//6 button screen
  {
    //illuminates the 6 screen buttons when clicked on by user and plays a sound
    //each time it is clicked using the xy coordinates of the buttons.
    if (mouseX >= 500 && mouseX <= 700 && mouseY >= 150 && mouseY <= 350)
    {
      flashTile6(1);
    } else if (mouseX >= 60 && mouseX <= 260 && mouseY >= 400 && mouseY <= 600)
    {
      flashTile6(2);
    } else if (mouseX >= 280 && mouseX <= 480 && mouseY >= 150 && mouseY <= 350)
    {
      flashTile6(3);
    } else if (mouseX >= 280 && mouseX <= 480 && mouseY >= 400 && mouseY <= 600)
    {
      flashTile6(4);
    } else if (mouseX >= 60 && mouseX <= 260 && mouseY >= 150 && mouseY <= 350)
    {
      flashTile6(5);
    } else if (mouseX >= 500 && mouseX <= 700 && mouseY >= 400 && mouseY <= 600)
    {
      flashTile6(6);
    }
  }
  if (scene == 4)
  { 
    //takes a user from the choosing tiles method to either the 4 buttons screen or
    //to the 6 buttons screen using the xy coordinates of the buttons
    if (mouseX >= 450 && mouseX <= 530 && mouseY >= 400 && mouseY <= 480 && clickOnce)
    {
      scene=3; // 6 square
      clickOnce = false;
    } else if (mouseX >= 220 && mouseX <= 300 && mouseY >= 400 && mouseY <= 480 && clickOnce)
    {
      scene=2; // 4 square
      clickOnce = false;
    }
  }
  if (scene == 8)
  {    
    //checks where the user is clicking using the xy coordinates of the buttons
    //and corresponds each location with a different value from the 4 square
    //arraylist. this checks each location with the value of the colour in the
    //computer generated arraylist (tileColour), and if they are not equal then 
    //the scene switches to the losing screen for 4 buttons
    tiles4Screen();
    if (mouseX <= 380 && mouseX >= 100 && mouseY <= 380 && mouseY >= 100)
    {
      flashTile4(1);
      if (tileColour.get(numClicks) != 1)
      {
        scene = 10;
      } //green
    } else if (mouseX <= 680 && mouseX >= 400 && mouseY <= 380 && mouseY >= 100)
    {
      flashTile4(2);
      if (tileColour.get(numClicks) != 2)
      {
        scene = 10;
      } //yellow
    } else if (mouseX <= 680 && mouseX >= 400 && mouseY <= 680 && mouseY >= 400)
    {
      flashTile4(3);
      if (tileColour.get(numClicks) != 3)
      {
        scene = 10;
      } //red
    } else if (mouseX <= 380 && mouseX >= 100 && mouseY <= 680 && mouseY >= 400)
    {
      flashTile4(4);
      if (tileColour.get(numClicks) != 4)
      {
        scene = 10;
      } //blue
    }
    numClicks++;
    if (numClicks == tileColour.size())
    {
      //resets all the variables
      getRandomColour4Square ();
      currentTile = 0;
      numClicks = 0;
      if (scene != 10) //if the user gets all the buttons in the right sequence, 
      //their score will increase
      {
        score++;
      }
    }
  }
  if (scene == 9)
  {
    //checks where the user is clicking using the xy coordinates of the buttons
    //and corresponds each location with a different value from the 6 square
    //arraylist. this checks each location with the value of the colour in the
    //computer generated arraylist (tileColour6), and if they are not equal then 
    //the scene switches to the losing screen for 6 buttons
    tiles6Screen();
    if (mouseX >= 500 && mouseX <= 700 && mouseY >= 150 && mouseY <= 350)
    {
      flashTile6(1);
      if (tileColour6.get(numClicks) != 1)
      {
        scene = 10; //purple
      }
    } else if (mouseX >= 60 && mouseX <= 260 && mouseY >= 400 && mouseY <= 600)
    {
      flashTile6(2);
      if (tileColour6.get(numClicks) != 2)
      {
        scene = 10; //turquoise
      }
    } else if (mouseX >= 280 && mouseX <= 480 && mouseY >= 150 && mouseY <= 350)
    {
      flashTile6(3);
      if (tileColour6.get(numClicks) != 3)
      {
        scene = 10; //pink
      }
    } else if (mouseX >= 280 && mouseX <= 480 && mouseY >= 400 && mouseY <= 600)
    {
      flashTile6(4);
      if (tileColour6.get(numClicks) != 4)
      {
        scene = 10; //red
      }
    } else if (mouseX >= 60 && mouseX <= 260 && mouseY >= 150 && mouseY <= 350)
    {
      flashTile6(5);
      if (tileColour6.get(numClicks) != 5)
      {
        scene = 10; //green
      }
    } else if (mouseX >= 500 && mouseX <= 700 && mouseY >= 400 && mouseY <= 600)
    {
      flashTile6(6);
      if (tileColour6.get(numClicks) != 6)
      {
        scene = 10; //yellow
      }
    }
    numClicks++;
    if (numClicks == tileColour6.size())
    {
      //resets all the variables
      getRandomColour6Square ();
      currentTile = 0;
      numClicks = 0;
      if (scene != 10) {
        score++;
      }
    }
  }
}
void tiles6Screen()
{
  //the screen that shows the 6 buttons and prints the score at the bottom
  fill(0);
  textSize(32);
  text("PRESS the spacebar to BEGIN", 150, 70);
  fill (132, 30, 216);
  rect (500, 150, 200, 200); // dark purple
  fill (30, 216, 216);
  rect (60, 400, 200, 200); // turquoise
  fill (237, 47, 202);
  rect (280, 150, 200, 200); // pink
  fill (255, 0, 0);
  rect (280, 400, 200, 200); // red
  fill (83, 165, 33);
  rect (60, 150, 200, 200); // green
  fill (255, 204, 0);
  rect (500, 400, 200, 200); // yellow
  fill(0);
  text("SCORE: "+score, 300, 750);
}

void restartGame()
{
  //resets all the variables so that the user can play again without closing and
  //restarting the program
  currentTile = 0;
  numClicks = 0;
  score = 0;
  tileColour.clear();
  tileColour6.clear();
}

void choosingTiles()
{
  //this is the method where the user can choose whether they want to play with
  //4 or 6 buttons
  restartGame();
  textAlign(LEFT);
  textSize(38);
  text("Would you like to play with 6 or 4 tiles?", 50, 300);
  fill (60, 134, 252);
  rect(450, 400, 80, 80); // blue
  fill (252, 60, 194);
  rect (220, 400, 80, 80); // pink

  textSize(22);
  fill(0);
  text("4", 252, 450);
  text("6", 485, 450);
}

void instructions()
{
  //the method where instructions are printed
  textAlign(LEFT);
  fill(0);
  textSize(30);
  text("Instructions", 50, 100);
  textSize(20);
  text("Here's how to play. The premise of the game is to recreate the pattern ", 30, 200);
  text("shown by the computer and continue for as long as possible. So firstly", 30, 250);
  text("you will click the SPACEBAR only once to start. The sequence of colours will", 30, 300);
  text("be illuminated. Once the pattern is finished being displayed by the computer", 30, 350);
  text("you will recreate the pattern by clicking the correct colours in the correct", 30, 400);
  text("order. Every time a new colour is added to the pattern, and every correct", 30, 450);
  text("pattern you input, your score increases by 1. If you click on the wrong", 30, 500);
  text("colour, you will automatically lose the game. There are two options: 4", 30, 550);
  text("colours or 6 colours. We recommend the 4 colour option for beginners and", 30, 600);
  text("6 colour option for more advanced players. Have fun!", 30, 650);
  fill (0);
  rect (550, 680, 200, 75); //purple
  textSize(15);
  fill (255, 255, 255);
  textAlign(CENTER);
  text("Click to continue", 650, 710);
}

void losingScreen()
{
  //the losing screen for both 4 and 6 button games. it asks the user if they want to 
  //play again or to exit the game, and if they want to play again then they press the 
  //button near the bottom, and if they want to exit then they press the escape key. 
  //it prints their score and the highscore. 
  background (255, 255, 255);
  numClicks = 0;
  fill(0);
  textSize(40);
  text("You lose! :'(", 280, 200);
  textSize(30);
  fill(0);
  text("Your score was "+score+"!", 265, 300);
  text("The high score is 30!", 238, 370);
  text("Press ESCAPE to quit the game.", 180, 540);
  fill (0);
  rect (550, 680, 200, 75); //purple
  textSize(15);
  fill (255, 255, 255);

  text("Click to play again!", 580, 715);
  if (mouseX >= 550 && mouseX <=750 && mouseY >=680 && mouseY <=755)
  {
    scene=4; //goes back to choosing tiles
  }
  key = 'c';
  keyPressed();
  if (key == 27)//escape key
  {
    scene = 11;//exits program
  }
}
