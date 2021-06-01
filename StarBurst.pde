class StarBurst{
  
  PVector blast1, blast2, blast3, blast4;
  
  StarBurst(float x, float y){
    blast1 = new PVector(x, y);
    blast2 = new PVector(blast1.x + random(0, 100), blast1.y);
    blast3 = new PVector(blast1.x - blast1.y, blast1.y + random(0, 100));
    blast4 = new PVector(blast1.x - random(0, 100), blast1.y / random(0, 100));
    
    noStroke();
    beginShape();
    vertex(blast1.x, blast1.y);
    vertex(blast2.x, blast2.y);
    vertex(blast3.x, blast3.y);
    vertex(blast2.x, blast4.y);
    vertex(blast3.x, blast2.y);
    vertex(blast4.x, blast4.y);
    vertex(blast3.x, blast4.y);
    endShape(CLOSE);
  }
  
  void doubled(){
    noStroke();
    beginShape();
    vertex(blast1.x, blast1.y - blast1.y);
    vertex(blast2.x - blast2.x, blast2.y + blast2.y);
    vertex(blast3.x, blast3.y - blast3.y);
    vertex(blast2.x - blast2.x, blast4.y + blast4.y);
    vertex(blast3.x + blast3.x, blast2.y - blast2.y);
    vertex(blast4.x - blast4.x, blast4.y);
    vertex(blast3.x - blast3.x, blast4.y + blast4.y);
    endShape(CLOSE);
  }
}
