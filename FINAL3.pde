import processing.sound.*;
//all to import sound 
SoundFile file;
SoundFile file1;
SoundFile file2;
SoundFile file5;
SoundFile file6;
SoundFile file7;

int time; 
int scene = 6; //scene is used to change the background at different points in the game

boolean clickOnce = true; //allows the scene to be changed after the mouse is released
//and makes sure that you can only do one action per click

int currentTile = 0; //determines position in arraylist that is being compared to 
//figure out which colour button to illuminate

boolean on = false; //allows the button to return to its original colour after being clicked
int requiredTime = 1000;

float rand4Square = random(1, 5); //random object to create the computer generated sequence
//of numbers from 1 - 4.
ArrayList<Integer> tileColour = new ArrayList(); //the arraylist that holds the
//computer generated sequence for the 4 square option

float randy6Square = random(1, 7);//random object to create the computer generated sequence
//of numbers from 1 - 6.
ArrayList<Integer> tileColour6 = new ArrayList(); //the arraylist that holds the
//computer generated sequence for the 6 square option

void setup() 
{
  background(255);
  fill(0);
  time = millis(); //records how much time passes starting when the program runs
  frameRate(7); //controls the speed of the "click" or illumination of the buttons
  size(800, 800);
  background(255, 255, 255);

  //all to put sound into program
  file = new SoundFile(this, "beep1.wav");
  file1 = new SoundFile(this, "beep2.wav");
  file2 = new SoundFile(this, "beep3.wav");
  file5 = new SoundFile(this, "beep9.wav");
  file6 = new SoundFile(this, "beep7.wav");
  file7 = new SoundFile(this, "beep6.wav");
}

void draw()
{
  //the main loop that calls each method 
  background(255, 255, 255);
  if (scene==6)
  {
    mainMenu();
  } else if (scene==5)
  {
    instructions();
  } else if (scene==4)
  {
    choosingTiles();
  } else if (scene==3)
  {
    tiles6Screen();
    if (key == 32)
    {
      illuminate6Square(getRandomColour6Square());
      scene = 9;
    }
  } else if (scene==2)
  {
    tiles4Screen(); 
    if (key == 32)
    {
      illuminate4Square(getRandomColour4Square());
      scene = 8;
    }
  } else if (scene == 8) 
  {
    tiles4Screen();
    illuminate4Square (tileColour);
  } else if (scene == 9)
  {
    tiles6Screen();
    illuminate6Square (tileColour6);
  } else if (scene == 10)
  {
    losingScreen();
  } 
}

ArrayList<Integer> getRandomColour4Square ()
{
  //this method creates an arraylist and adds one random number from 1-4 every time it 
  //is called. each number corresponds with a colour on the 4 button screen. 
  rand4Square = random(1, 5);
  tileColour.add((int)rand4Square);
  return tileColour;
}

void illuminate4Square (ArrayList<Integer> tileColour) 
{   
  //this method illuminates the computer generated sequence of numbers from the 
  //arraylist returned from the method getRandomColour4Square. it does this
  //by checking the each position of the computer generated arraylist (from the
  //method getRandomColour4Square); depending on what number the position holds, 
  //a different button will light up, as each number from 1-4 corresponds to a different
  //colour of the 4. time and the boolean on variables are used to switch back and
  //forth from the light and original versions of colours to make it appear as if
  //the button is being clicked. 

  if (currentTile == tileColour.size())
  {
    return;
  }
  if (tileColour.get(currentTile) == 1)
  {
    time = millis();
    fill (83, 165, 33);
    rect (100, 100, 280, 280); // dark green
    if (time>= requiredTime && !on)
    {
      file.play();
      fill (145, 232, 127);
      rect (100, 100, 280, 280); // light green
      currentTile++;
      requiredTime = time + 1000;
      on = true;
    }

    if (time>=requiredTime)
    {
      fill (83, 165, 33);
      rect (100, 100, 280, 280); //dark green
      on = false;
    }
  } else if (tileColour.get(currentTile) == 2)
  {
    time = millis();
    fill (255, 204, 0);
    rect(400, 100, 280, 280); // yellow
    if (time>=requiredTime && !on)
    {
      file1.play();
      fill(232, 228, 127);
      rect(400, 100, 280, 280);
      currentTile++;
      requiredTime = time + 1000;
      on = true;
    }

    if (time>=requiredTime)
    {
      fill (255, 204, 0);
      rect(400, 100, 280, 280);
      on = false;
    }
  } else if (tileColour.get(currentTile) == 3)
  {
    time = millis();
    fill (255, 0, 0);
    rect(400, 400, 280, 280); // red
    if (time>= requiredTime && !on)
    {
      file2.play();
      fill (232, 127, 160);
      rect(400, 400, 280, 280);
      currentTile++;
      requiredTime = time + 1000;
      on = true;
    }

    if (time>=requiredTime)
    {
      fill (255, 0, 0);
      rect(400, 400, 280, 280);
      on = false;
    }
  } else if (tileColour.get(currentTile) == 4)
  {
    time = millis();
    fill (20, 75, 200);
    rect(100, 400, 280, 280); // blue
    if (time>= requiredTime && !on)
    {
      file7.play();
      fill (144, 237, 226);
      rect(100, 400, 280, 280);
      currentTile++;
      requiredTime = time + 1000;
      on = true;
    }

    if (time>=requiredTime)
    {
      fill (20, 75, 200);
      rect(100, 400, 280, 280);
      on = false;
    }
  }
}

void mouseReleased()
{
  //allows the scene to be changed after the mouse is released.
  //this works for when the user "clicks" a button, once they release their
  //mouse the scene is able to change without appearing on top of the screen
  //that was on before. it also makes sure that you can only do one action per click
  clickOnce = true;
}

void flashTile4 (int tile) {
  //this function allows the user to press the buttons and for them to be "clicked",
  //or illuminated and deluminated and they press on it. switch acts as an if else
  //and each case is every possibility that could happen, and what to do when it does
  //happen. it illuminates a button by filling it another lighter version of that same
  //colour for a short period of time before it returns to its original colour, giving
  //the effect that it is being clicked (this is for the 4 buttons screen). the 
  //parameter int tile tells the program which button is being pressed.
  switch(tile) {
  case 1:
    file.play();
    fill (145, 232, 127);
    rect(100, 100, 280, 280); //light green
    break;
  case 2:
    file1.play();
    fill(232, 228, 127);
    rect(400, 100, 280, 280); //light yellow
    break;
  case 3:
    file2.play();
    fill (232, 127, 160);
    rect(400, 400, 280, 280); //light red
    break;
  case 4:
    file7.play();
    fill (144, 237, 226);
    rect(100, 400, 280, 280); //light blue
    break;
  }
}

void flashTile6 (int tile)
{
  //this function allows the user to press the buttons and for them to be "clicked",
  //or illuminated and deluminated and they press on it. switch acts as an if else
  //and each case is every possibility that could happen, and what to do when it does
  //happen. it illuminates a button by filling it another lighter version of that same
  //colour for a short period of time before it returns to its original colour, giving
  //the effect that it is being clicked (this is for the 6 buttons screen). the int 
  //tile tells the program what button is being pressed. 
  switch(tile)
  {
  case 1: 
    file.play();
    fill(207, 155, 247);
    rect (500, 150, 200, 200); //light purple
    break;
  case 2: 
    file1.play();
    fill(168, 255, 234);
    rect (60, 400, 200, 200); // light turquoise
    break;
  case 3:
    file2.play();
    fill(255, 211, 252);
    rect (280, 150, 200, 200); // light pink
    break;
  case 4:
    file7.play();
    fill(244, 176, 184);
    rect (280, 400, 200, 200); // light red
    break;
  case 5: 
    file6.play();
    fill(146, 232, 146);
    rect (60, 150, 200, 200); // light green
    break;
  case 6:
    file5.play();
    fill(242, 234, 155);
    rect (500, 400, 200, 200); //light yellow
    break;
  }
}

ArrayList<Integer> getRandomColour6Square ()
{
  //this method creates an arraylist and adds one random number from 1-6 every time it 
  //is called. each number corresponds with a colour on the 6 button screen. 
  randy6Square = random(1, 7);
  tileColour6.add((int)randy6Square);
  return tileColour6;
}

void illuminate6Square (ArrayList<Integer> tileColour6) 
{   
  //this method illuminates the computer generated sequence of numbers from the 
  //arraylist returned from the method getRandomColour6Square. it does this
  //by checking the each position of the computer generated arraylist (from the
  //method getRandomColour6Square); depending on what number the position holds, 
  //a different button will light up, as each number from 1-6 corresponds to a different
  //colour of the 6. time and the boolean on variables are used to switch back and
  //forth from the light and original versions of colours to make it appear as if
  //the button is being clicked. when time is greater than or equal to requiredTime,
  //(which is equal to time plus 1000 milliseconds) and on is false
  if (currentTile == tileColour6.size())
  {
    return;
  }
  if (tileColour6.get(currentTile) == 1)
  {
    time = millis();
    fill (132, 30, 216);
    rect (500, 150, 200, 200); // dark purple
    if (time>= requiredTime && !on)
    {
      file.play();
      fill(207, 155, 247);
      rect (500, 150, 200, 200); //light purple
      currentTile++;
      requiredTime = time + 1000;
      on = true;
      
    }

    if (time>=requiredTime)
    {
      fill (132, 30, 216);
      rect (500, 150, 200, 200); // dark purple
      on = false;
    
    }
  } else if (tileColour6.get(currentTile) == 2)
  {
    time = millis();
    fill (30, 216, 216);
    rect (60, 400, 200, 200); // turquoise
    if (time>=requiredTime && !on)
  
    {
      file1.play();
      fill(168, 255, 234);
      rect (60, 400, 200, 200); // light turquoise
      currentTile++;
      requiredTime = time + 1000;
      on = true;
     
    }

    if (time>=requiredTime)
    {
      fill (30, 216, 216);
      rect (60, 400, 200, 200); // turquoise
      on = false;
    
    }
  } else if (tileColour6.get(currentTile) == 3)
  {
    time = millis();
    fill (237, 47, 202);
    rect (280, 150, 200, 200); // pink

    if (time>= requiredTime && !on)
    {
      file2.play();
      fill(255, 211, 252);
      rect (280, 150, 200, 200); // light pink
      currentTile++;
      requiredTime = time + 1000;
      on = true;
     
    }

    if (time>=requiredTime)
    {
      fill (237, 47, 202);
      rect (280, 150, 200, 200); // pink
      on = false;
      
    }
  } else if (tileColour6.get(currentTile) == 4)
  {
    time = millis();
    fill (255, 0, 0);
    rect (280, 400, 200, 200); // red
    if (time>= requiredTime && !on)
    {
      file7.play();
      fill(244, 176, 184);
      rect (280, 400, 200, 200); // light red
      currentTile++;
      requiredTime = time + 1000;
      on = true;
    }

    if (time>=requiredTime)
    {
      fill (255, 0, 0);
      rect (280, 400, 200, 200); // red
      on = false;
    }
  } else if (tileColour6.get(currentTile) == 5)
  {
    time = millis();
    fill (83, 165, 33);
    rect (60, 150, 200, 200); // green
    if (time>= requiredTime && !on)
    {
      file6.play();
      fill(146, 232, 146);
      rect (60, 150, 200, 200); // light green
      currentTile++;
      requiredTime = time + 1000;
      on = true;
    }
    if (time>=requiredTime)
    {
      fill (83, 165, 33);
      rect (60, 150, 200, 200); // green
      on = false;
    }
  } else if (tileColour6.get(currentTile) == 6)
  {
    time = millis();
    fill (255, 204, 0);
    rect (500, 400, 200, 200); // yellow
    if (time>= requiredTime && !on)
    {
      file5.play();
      fill(242, 234, 155);
      rect (500, 400, 200, 200); //light yellow
      currentTile++;
      requiredTime = time + 1000;
      on = true;
    }
    if (time>=requiredTime)
    {
      fill (255, 204, 0);
      rect (500, 400, 200, 200); // yellow
      on = false;
    }
  }
}
