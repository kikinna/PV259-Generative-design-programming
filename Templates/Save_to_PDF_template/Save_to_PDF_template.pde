// Template showing how to save drawn objects
// of both current frame or a sequence of frames
// into PDF file or current frame into png image.
// Made by Kristina Zakopcanova
// 
// CONTROLS
// s  saves a current frame into png image
// f  stores objects of current frame into pdf file
// r  start or stop storing of all objects into pdf file


import processing.pdf.*;
// Global variables go here
// these are visible in the whole program

String timestamp;

boolean recordFrame = false;
boolean isRecording = false;


// setup function is run once at the beginning of the program
void setup() {
  size(720, 720);
  background(33);

  setTimestamp();
  
  frameRate(5);
}

// draw function is run every frame
void draw() {
  if (recordFrame) {
    beginRecord(PDF, "Export Frame/Frame-" + timestamp + ".pdf");
    background(33);
    println("Recorded one frame to PDF.\n");
  }
  
  // demo
  fill(255, 25, 100, 50);
  noStroke();
  ellipse(mouseX, mouseY, 50, 50);
  


  if (recordFrame) {
    endRecord();
    saveFrame("Export Frame/Frame-" + timestamp + ".png");
    setTimestamp();
    recordFrame = false;
  }
}



void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("IMG-" + timestamp + "####.png");
    println("Saved a frame to PNG.\n");
  }

  // Record one frame and save to PDF
  if (key == 'f' || key == 'F') saveFrameToPDF();

  // Record all frames from now till you press 'r'
  if (key == 'r' || key == 'R') record();
}


void saveFrameToPDF() {
  recordFrame = true;
}

void record() {
  isRecording = !isRecording;

  if (isRecording) {
    beginRecord(PDF, "Export Seq/Sequence-" + timestamp + ".pdf");
    println("Started recording.\nPress 'r' to stop recording.\n");
    
    background(33);
  } else {
    endRecord();
    saveFrame("Export Seq/Sequence-" + timestamp + ".png");
    setTimestamp();
    println("Stopped recording.\n");
  }
}

void setTimestamp() {
  timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
}
