class Particle{
	color clr;
	PVector pt;
	PImage img;
	float ranSize;
	float ranRot;

	int lifespan = 150;

	PVector location;
	PVector velocity;
	PVector acceleration;

	Particle(PVector _pt, PImage _img, color _clr) {
		
		pt = _pt; 
		img = _img;
		clr = _clr;

		location = pt.get();
		velocity = new PVector( random(-10,10), random(-10,10) );
		acceleration = new PVector(0, 0.1);

		ranSize = random(100, 200);
		ranRot = random(0, 45);


	}

	void run() {

		velocity.add(acceleration);
		location.add(velocity);

		noStroke(); 

		pushMatrix();
			translate(location.x, location.y);
			//ellipse(0,0,20,20);
			rotate(ranRot);
			image(img, 0, 0, ranSize, ranSize);
			tint(clr);
		popMatrix();

		if (lifespan>0) lifespan--;
	}

	boolean isDead() {
		return (lifespan==0);
	}
}
