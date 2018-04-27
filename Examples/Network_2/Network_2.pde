// code adapted from Karsten Schmidt
// http://www.openprocessing.org/sketch/22525
 
import toxi.physics2d.constraints.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.*;
import toxi.geom.*;

VerletPhysics2D physics;
VerletParticle2D selectedParticle;

String[] nodes = new String[10];

// snap distance for mouse selection
float SNAP_DIST = 400;


void setup() {
  size(1280, 800);

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
  }
  
  // highlight selected particle
  if (selectedParticle != null) {
    fill(255, 0, 255);
    ellipse(selectedParticle.x, selectedParticle.y, 25, 25);
  }
}


void keyPressed() {
  initPhysics();
}

void mousePressed() {
  // find particle under mouse
  Vec2D mousePos = new Vec2D(mouseX,mouseY);
  
  for(int i = 1; i < physics.particles.size(); i++) {
    
    VerletParticle2D p = physics.particles.get(i);
    
    if (mousePos.distanceToSquared(p) < SNAP_DIST) {
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
  VerletParticle2D root = new VerletParticle2D(width/2, height/2).lock(); // locks/immobilizes particle in space
  physics.addParticle(root);
  physics.addBehavior(new AttractionBehavior(root, 250, -1));
  
  // add other particles
  for (int i = 0; i < nodes.length; i++) {
    VerletParticle2D p = new VerletParticle2D(random(width), random(height));
    physics.addParticle(p);
    physics.addBehavior(new AttractionBehavior(p, 400, -1));
    physics.addSpring(new VerletSpring2D(p, root, 200, 1));
  }
}