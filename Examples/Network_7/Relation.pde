class Relation extends VerletParticle2D {
  
  String label;
  
  Relation(float x, float y, String label) {
    super(x,y);
    this.label = label;
  }
}
