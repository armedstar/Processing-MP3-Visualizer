import java.util.Iterator;

class ParticleSystem {
	PVector pt;
	PImage img;
	color clr;

	ArrayList<Particle> particles;
	int numParticles = 5;

	ParticleSystem(PVector _pt, PImage _img, color _clr) {

		pt = _pt;
		img = _img;
		clr = _clr;

		particles = new ArrayList<Particle>();

		for (int i = 0; i < numParticles; ++i) {
			Particle p = new Particle(pt, img, clr);
			particles.add(p);
		}
	}

	void run() {
		Iterator<Particle> it = particles.iterator();

		while( it.hasNext() ) { 
			Particle p = it.next();
			p.run();

			if( p.isDead() ) it.remove();
		}
	}

}