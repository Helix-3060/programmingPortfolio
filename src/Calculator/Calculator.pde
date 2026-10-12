// Bradley Nieto | Sept 14 2026 | calculator
String displayVal;
String displayEquation;
float l, r, result;
char op;

int sizeBasedOnLength = 10;
int numberButtons = 22;
Button[] nums = new Button[numberButtons];
char[] numbers = new char[numberButtons];

void setup() {
  size(200, 320);

  displayVal = "0.0";
  l = 0.0;
  r = 0.0;
  result = 0.0;
  displayEquation = "";
  op = ' ';

  for (int i = 0; i < numbers.length; i = i + 1) {
    numbers[i] = char('1' + i);
  }
  for (int i = 0; i < nums.length; i = i + 1) {
    int col = i % 3;
    int row = i / 3;
    nums[i] = new Button(50 + col * 30, 150 - row * 30, numbers[i], true, 100);
  }

  // seperate thing, it is 0
  // these buttons are under the grid of 9 through 1
  numbers[9] = char('0');
  nums[9] = new Button(50 + (7 % 3) * 30, 150 + (10 * 3) /* * 30 */, numbers[9], true, 100);//the * 30 is to flip it to the top all that is neccesary is replace it with 150 - (10 / 3) * 30

  numbers[10] = char('.');
  nums[10] = new Button(50 + (8%3) * 30, 150 + (10 * 3), numbers[10], true, 100);

  numbers[11] = char('Π');
  nums[11] = new Button(50 + (9 % 3) * 30, 150 + (10 * 3), numbers[11], true, 100);
  // These buttons are on the side of the grid of 9 through 1
  numbers[17] = char('%');
  nums[17] = new Button(20 + (3 % 5) * 30, 150 - (10 / 3) * 30, numbers[17], false, 175);
  fill(#ED7411);
  numbers[16] = char('/');
  nums[16] = new Button(20 + (4 % 5) * 30, 150 - (10 / 3) * 30, numbers[16], false, #ED7411);

  numbers[15] = char('x');
  nums[15] = new Button(20+(4 % 5) * 30, 150 - (6 / 3) * 30, numbers[15], false, #ED7411);

  numbers[14] = char('-');
  nums[14] = new Button(20+(4 % 5) * 30, 150 - (5 / 3) * 30, numbers[14], false, #ED7411);

  numbers[13] = char('+');
  nums[13] = new Button(20+(4 % 5) * 30, 150 - (2 / 3) * 30, numbers[13], false, #ED7411);

  numbers[12] = char('=');
  nums[12] = new Button(20+(4 % 5) * 30, 150 + (10 * 3), numbers[12], false, #ED7411);

  // clear button
  numbers[18] = char('c');
  nums[18] = new Button(20 + (1 % 5) * 30, 150 - (10 / 3) * 30, numbers[18], false, 175);

  numbers[19] = char('r'); // sqrt
  nums[19] = new Button(170, 120, numbers[19], false, #7E410F);

  numbers[20] = char('^'); // square
  nums[20] = new Button(170, 90, numbers[20], false, #7E410F);

  numbers[21] = char('R'); // reciprocal
  nums[21] = new Button(170, 60, numbers[21], false, #7E410F);
}

void draw() {
  background(#112042);
  updateDisplay();
  for (int i = 0; i < nums.length; i = i + 1) {
    nums[i].mouseOver(mouseX, mouseY);
    textSize(15);
    nums[i].display();
  }
  // nums[18].mouseOver(mouseX, mouseY, false);
  textSize(10);
}

void updateDisplay() {
  // background shape
  rectMode(CENTER);
  // overlay text
  fill(255);
  textSize(14);
  if (displayVal.length()>10) {textSize(12);}
  if (displayVal.length()>14) {textSize(10);}
  if (displayVal.length()>18) {textSize(8);}
  if (displayVal.length()>22) {textSize(6);}
  if (displayVal.length()>10) {textSize(12);}
  text(displayVal, 50 + (7 % 3) * 30, 150 - (12 / 3)*30);
}

void mouseReleased() {
  for (int i = 0; i < nums.length; i++) {
    if (nums[i].hover) {
      if (nums[i].val == '=') {
        nums[i].performCalculation();
      } else if (nums[i].val == 'c' && nums[i].isNum == false) {
        displayEquation = "";
        displayVal = "0.0";
      } else {
        displayEquation += nums[i].val;
        displayVal = displayEquation;
        //println(displayEquation);
      }
    }
  }
}
void keyTyped() {
  for (int i = 0; i < nums.length; i++) {
    if (key == ENTER) {
      nums[i].performCalculation();
      return;
    } else if (key == 'c' || key == 'C' && nums[i].isNum == false && keyPressed == false) {
      displayEquation = "";
      displayVal = "0.0";
    } else if (key == BACKSPACE) {
      if (displayEquation.length() > 0) {displayEquation = displayEquation.substring(0,displayEquation.length()-1);}
      println(displayEquation);
      displayVal = displayEquation;
    } else {
      displayEquation += key;
      displayVal = displayEquation;
      //println(displayEquation);
      return;
    }
  }
}


/*

 #423311
 
 
 #112042
 
 
 #826F42
 
 
 #5A6D97
 
 
 #C2B493
 
 */
