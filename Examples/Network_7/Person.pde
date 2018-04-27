class Person extends VerletParticle2D {
  
  String label;
  
  Person(float x, float y, String label) {
    super(x,y);
    this.label = label;
  }
}
