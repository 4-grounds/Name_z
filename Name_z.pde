import processing.sound.*;
/**
 v.2
 Artist: Ian Vanmeter
 Date: 1-25-2020
 Title: "Name_z"
 Instructions:
   • Either say your name while typing your name.
   • Or say your name.
   • Or type your name.
   • Click the mouse to save your name.
   • Press 0 to end program.
*/

float r = 200;
float g = 200;
float b = 200;
float a = 10;
float bg = 100;
float op = 255 * .09;
float flux = .5;
float drop = 30;
int swirl = 0;
int change = 0;

PVector sLocation, eLocation, field;

PFont typeface, typeface1, typeface2;

float upperOverPrint;
float rightOverPrint;
float lowerOverPrint;
float leftOverPrint;

boolean filesMade = false;

AudioIn name;
Amplitude saying;
float volume;

String yourName = "yourName";
String mask = "_";
String fileType = ".png";
String fileType2 = ".txt";
String run = "Name_z_run";
String voice = "voice";
String[] masks = {""};

int place = 1;
int numeral = 1;
int month = month();
int day = day();
int year = year();
int hour = hour();
int min = minute();
String dayMade = "(" + str(month) + "-" + str(day) + "-" + str(year) + "-(" + str(hour) + "|" + str(min) + ")" + ")";

PrintWriter name_z_run;

void setup() {
  // phone wallpaper
  //size(397, 720);

  fullScreen(SPAN);
  background(15);
  frameRate(30);

  typeface1 = createFont("Helevtica", 1000, false);
  typeface2 = createFont("Times New Roman", 1000, false);

  typeface = typeface1;

  upperOverPrint = 0 + (height * .2);
  lowerOverPrint = height + (height * .01);
  leftOverPrint = 0 - (width * .01);
  rightOverPrint = width - (width * .2);

  name = new AudioIn(this, 0);
  name.start();

  saying = new Amplitude(this);
  saying.input(name);

  name_z_run = createWriter(run + dayMade + fileType2);

  name_z_run.println("Name_z run: " + dayMade);
}

void draw() {
  if (frameCount % 250 == 0) {
    fill(bg, op);
    noStroke();
    rect(0, 0, width, height);
  }

  field = new PVector(random(0, width), random(0, height));

  fill(255);
  setTypeface();
  textSize(random(150, 550));

  volume = saying.analyze();

  vortex();
  burst();
  yourVoice();

  stroke(r, g, b, a);
  strokeWeight(flux);
  line(sLocation.x, sLocation.y, eLocation.x, eLocation.y);
  line(width-sLocation.x, height - sLocation.y, width-eLocation.x, height-eLocation.y);

  swirl++;

  if (swirl == 100) {
    swirl = 0;
  }
}

void yourVoice() {
  op = map(volume, .02, .3, 150, 0);
  a = map(volume, .02, .3, 200, 150);
  flux = map(volume, .02, .4, .75, 10);

  if (volume >= .04 && volume <= .4) {
    drop = map(volume, .02, .2, 50, 150);
    stroke(r, g, b, a);
    Ripple rain = new Ripple(field.x, field.y, drop);

    if (volume >= .1 && volume <= .2) {
      rain.expand();
    }
  }
}

void setTypeface() {
  textFont(typeface);

  if (change % 1 == 0) {
    typeface = typeface2;
    textFont(typeface);
  }

  if (change % 2 == 0) {
    typeface = typeface1;
    textFont(typeface);
  }
}

void vortex() {
  
  if (swirl >= 50 && swirl <= 100) {
    sLocation = new PVector(random(0, height * map(volume, .03, .3, 1, 6)), height / map(volume, .03, .3, 5, 10));
    eLocation = new PVector(random(0, width / map(volume, .03, .3, 1, 6)), random(0, height / 3));
  } else {
    sLocation = new PVector(random( 0, width * map(volume, .03, .3, 1, 6)), height / map(volume, .03, .3, 5, 10));
    eLocation = new PVector(width / map(volume, .03, .3, 3, 10), random(0, height));
  }
}

void burst() {
  
  if (change ==  7) {
    fill(b, r, g, a);
    StarBurst boom = new StarBurst(field.x, field.y);
    boom.doubled();
    change = 0;
  }
}

void checkMasks() {
  for (int i = 0; i < masks.length; i++) {
    if (mask == masks[i]) {
      mask = mask + place;
      place++;
    }
  }
}

void mousePressed() {
  
  filesMade = true;

  if (mousePressed == true) {
    if (mask == "_") {
      saveFrame(yourName + mask + voice + numeral + dayMade + fileType);
      name_z_run.println(mask + voice + numeral);
      masks = append(masks, mask);
      numeral++;
    } else {
      masks = append(masks, mask);
      checkMasks();
      saveFrame(yourName + mask + dayMade + fileType);
      name_z_run.println(mask);
      mask = "_";
    }
  }
}

void keyPressed() {
  
  switch(key) {
  case 'a':
  case 'A':
    r = 255;  
    g = 0;
    b = 0;
    change++;
    mask += 'a';
    text('A', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case 'b':
  case 'B':
    r = 25;  
    g = 25;
    b = 173;
    change++;
    mask += 'b';
    text('B', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case 'c':
  case 'C':
    r = 255;  
    g = 100;
    b = 0;
    change++;
    mask += 'c';
    text('C', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case 'd':
  case 'D':
    r = 255;  
    g = 255;
    b = 200;
    change++;
    mask += 'd';
    text('D', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case 'e':
  case 'E':
    r = 10;  
    g = 150;
    b = 210;
    change++;
    mask += 'e';
    text('E', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case 'f':
  case 'F':
    r = 100;  
    g = 100;
    b = 200;
    change++;
    mask += 'f';
    text('F', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case 'g':
  case 'G':
    r = 175;  
    g = 11;
    b = 200;
    change++;
    mask += 'g';
    text('G', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case 'h':
  case 'H':
    r = 200;  
    g = 175;
    b = 75;
    change++;
    mask += 'h';
    text('H', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case 'i':
  case 'I':
    r = 0;  
    g = 255;
    b = 0;
    change++;
    mask += 'i';
    text('I', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case 'j':
  case 'J':
    r = 75;  
    g = 15;
    b = 225;
    change++;
    mask += 'j';
    text('J', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case 'k':
  case 'K':
    r = 0;  
    g = 200;
    b = 200;
    change++;
    mask += 'k';
    text('K', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case 'l':
  case 'L':
    r = 234;  
    g = 249;
    b = 38;
    change++;
    mask += 'l';
    text('L', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case 'm':
  case 'M':
    r = 186;  
    g = 200;
    b = 255;
    change++;
    mask += 'm';
    text('M', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case 'n':
  case 'N':
    r = 0;  
    g = 0;
    b = 255;
    change++;
    mask += 'n';
    text('N', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case 'o':
  case 'O':
    r = 168;  
    g = 40;
    b = 150;
    change++;
    mask += 'o';
    text('O', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case 'p':
  case 'P':
    r = 230;  
    g = 237;
    b = 88;
    change++;
    mask += 'p';
    text('P', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case 'q':
  case 'Q':
    r = 109;  
    g = 169;
    b = 169;
    change++;
    mask += 'q';
    text('Q', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case 'r':
  case 'R':
    r = 199;  
    g = 60;
    b = 169;
    change++;
    mask += 'r';
    text('R', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case 's':
  case 'S':
    r = 90;  
    g = 167;
    b = 225;
    change++;
    mask += 's';
    text('S', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case 't':
  case 'T':
    r = 198;  
    g = 34;
    b = 34;
    change++;
    mask += 't';
    text('T', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case 'u':
  case 'U':
    r = 160;  
    g = 50;
    b = 200;
    change++;
    mask += 'u';
    text('U', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case 'v':
  case 'V':
    r = 90;  
    g = 27;
    b = 69;
    change++;
    mask += 'v';
    text('V', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case 'w':
  case 'W':
    r = 127;  
    g = 147;
    b = 29;
    change++;
    mask += 'w';
    text('W', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case 'x':
  case 'X':
    r = 75;  
    g = 195;
    b = 69;
    change++;
    mask += 'x';
    text('X', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case 'y':
  case 'Y':
    r = 190;  
    g = 230;
    b = 100;
    change++;
    mask += 'y';
    text('Y', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case 'z':
  case 'Z':
    r = 0;  
    g = 15;
    b = 150;
    change++;
    mask += 'z';
    text('Z', random(leftOverPrint, rightOverPrint), random(upperOverPrint, lowerOverPrint));
    break;
  case '0': //exit
    if (filesMade == false)
      name_z_run.println("NO FILES MADE");
    name_z_run.flush();
    name_z_run.close();
    exit();
    break;
  }
}
