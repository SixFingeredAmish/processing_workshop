// code adapted from Karsten Schmidt
// http://www.openprocessing.org/sketch/22525
 
import toxi.physics2d.constraints.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.*;
import toxi.geom.*;

VerletPhysics2D physics;
VerletParticle2D selectedParticle;

// create a HashMap to store the participants data
HashMap<Integer, ArrayList<String>> tables = new HashMap<Integer, ArrayList<String>>();

// snap distance for mouse selection
float SNAP_DIST = 400;


void setup() {
  size(1280, 800);

  ArrayList<String> nodes1 = new ArrayList<String>();
  nodes1.add("person1");
  nodes1.add("person2");
  nodes1.add("person3");

  ArrayList<String> nodes2 = new ArrayList<String>();
  nodes2.add("person4");
  nodes2.add("person5");
  nodes2.add("person6");

  ArrayList<String> nodes3 = new ArrayList<String>();
  nodes3.add("person7");
  nodes3.add("person8");
  nodes3.add("person9");
  
  tables.put(0, nodes1);
  tables.put(1, nodes2);
  tables.put(2, nodes3);
  
  initPhysics();
}

void draw() {
  // first, update the physics
  physics.update();
  
  // then, draw
  background(0);

  // draw springs
  stroke(255, 0, 255);
  
  for (VerletSpring2D spring : physics.springs) {
    line(spring.a.x, spring.a.y, spring.b.x, spring.b.y);
  }
  
  // draw particles
  noStroke();
  
  for (VerletParticle2D particle : physics.particles) {
    fill(255);
    ellipse(particle.x, particle.y, 25, 25);
    
    // draw label if needed
    if (particle instanceof Person) {
      
      // first need to cast particle to be a LabeledParticle in order to access its label property
      Person lp = (Person) particle;
      fill(150, 150, 150);
      text(lp.label, particle.x + 15, particle.y - 15);
    }
  }
  
  // highlight selected particle
  if (selectedParticle != null) {

    // change the color of a particle when clicking on it
    if (selectedParticle instanceof Person) {
      fill(255, 0, 255);
      ellipse(selectedParticle.x, selectedParticle.y, 25, 25);
    }
  }
}


void keyPressed() {
  initPhysics();
}

void mousePressed() {
  // find particle under mouse
  Vec2D mousePos=new Vec2D(mouseX,mouseY);
  
  for(int i = 1; i < physics.particles.size(); i++) {
    
    VerletParticle2D p = physics.particles.get(i);
    
    if (mousePos.distanceToSquared(p)<SNAP_DIST) {
      selectedParticle = p.lock(); // locks/immobilizes particle in space
      break;
    }
  }
}

void mouseDragged() {
  if (selectedParticle != null) {
    // move selected particle to new mouse pos
    selectedParticle.set(mouseX, mouseY);
  }
}

void mouseReleased() {
  // unlock the selected particle
  if (selectedParticle != null) {
    selectedParticle.unlock(); // unlocks the particle
    selectedParticle = null;
  }
}


void initPhysics() {
  physics = new VerletPhysics2D();
  physics.setDrag(0.05);
  physics.setWorldBounds(new Rect(0, 0, width, height));
  
  // add root particle at center of screen
  VerletParticle2D root = new VerletParticle2D(width/2, height/2).lock();
  physics.addParticle(root);
  physics.addBehavior(new AttractionBehavior(root, 250, -1));
  
  // add other particles
  for(int tableID : tables.keySet()) {
    VerletParticle2D p = new Person(random(width), random(height), "relation" + tableID);
    physics.addParticle(p);
    physics.addBehavior(new AttractionBehavior(p, 400, -1));
    physics.addSpring(new VerletSpring2D(p, root, 200, 1));

    for(String name : tables.get(tableID)) {
      VerletParticle2D n = new Person(random(width), random(height), name);
      physics.addParticle(n);
      physics.addBehavior(new AttractionBehavior(n, 150, -0.5));
      physics.addSpring(new VerletSpring2D(n, p, 100, 0.01));
    }
  }
}