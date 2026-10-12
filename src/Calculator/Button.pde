class Button {
  // member variables
  float x, y, w, h;
  color c1, c2;
  char val;
  boolean hover;
  boolean isNum;
  boolean newEntry;
  // Constructor
  Button(float x, float y, char val, boolean isNum, color c1) {
    this.x = x;
    this.y = y;
    w = 30;
    h = 30;
    this.c1 = c1;
    c2 = 50;
    this.val = val;
    hover = false;
    this.isNum = isNum;
    newEntry = true;
  }
  // Member Methods: behaviors of the buttons
  void display() {

    rectMode(CENTER);
    ellipse(x, y, w, h);

    fill(255);
    textAlign(CENTER, CENTER);
    text(val, x, y);
  }

  void mouseOver(float tempX, float tempY) {
    if (tempX > x - w/2 && tempX < x + w/2 && tempY > y - h/2 && tempY < y + h/2) {
      fill(c2);
      hover = true;
    } else {
      fill(c1);
      hover = false;
    }
  }
  void performCalculation() { 
    /*
    Stuff still in progress:
      - multiple operators
    */
    int amountOfOperators = 0;
    int operatorPos = -1; // find where the math sign is for example, 12+8, the math sign is at position 2 since 12 is 0 and 1,

    for (int i = 0; i < displayEquation.length(); i = i + 1) { // for loop, for everything in displayOperation (example: 1+1, loops three times)
      char c  = displayEquation.charAt(i); // gets the character for each position, essentially for the first loop where i = 0, it makes the first character position 0.
      // for example 1+1, first loop the positon of 1 = 0, second loop 1, third loop, 2
      println("position: " + i + " character: " + c);
      // found out that || is or, good info if needed later.
      if (c == '+' || c == '-' || c == 'x' || c == '/' || c == '%' || c == '^' || c == 'R' || c == 'r') { // checks to see if the char is an operator
        
        
        amountOfOperators += 1;
        if (amountOfOperators >= 2) {operatorPos = i; op = c;}// hmm what to add here?
          else if (amountOfOperators < 2) {operatorPos = i; op = c;}
      }
      
    } // this loop was just to find the operator's position in displayOperation,
    println();
    println("operator: " + op + " Position: " + operatorPos);
    if (operatorPos == -1) { // but if no operator is found then it returns to the top, and runs it all back, until an operator is found
      return; // this is because if no operator is found the operatorPos is not changed which makes the condition true
    }

    String leftString = displayEquation.substring(0, operatorPos); // left number
    // essentially it takes the character at position 0, for example 1+2, leftString will be 1
    String rightString = displayEquation.substring(operatorPos + 1); // right number
    // and since operatorPos is position 2 in that example, then the next position will be a number. Most likely
    //println(leftString); println(rightString);
    float pi = 3.1415926535897932384626433832795028841971;
    if (leftString.equals("Π")) {l = pi;} 
    else {l = float(leftString);}
    
    if (rightString.equals("Π")) {r = pi;}
    else {r = float(rightString);}
/*    
    println("l: " + l); // for debugging
    println("op: " + op + "position: " + operatorPos);
    println("r: " + r);
*/

    if (op == '+') {result = l + r;} 
      else if (op == '-') {result = l - r;} 
      else if (op == 'x') {result = l * r;} 
      else if (op == '/') {
      if (r == 0) {println("Cannot divide by zero"); return;} result = l / r;} 
      else if (op == '%') {result = l % r;} 
      else if (op == '^') {result = pow(l, r);} 
      else if (op == 'R') {result = 1/l;} 
      else if (op == 'r') {result = sqrt(l);} 

    //println("Result: " + result); // result is printed for debugging, :D

    displayVal = str(result);
    displayEquation = " ";
  }
}
