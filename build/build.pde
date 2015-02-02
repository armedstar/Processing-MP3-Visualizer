/*  */

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
BeatDetect beat;
AudioPlayer source;
BeatListener bl;

ArrayList<ParticleSystem> systems;

PImage[] kickImgs = new PImage[1];
PImage[] snareImgs = new PImage[1];
PImage[] hiImgs = new PImage[1];

float kickSize, snareSize, hatSize;

HColorPool goldRush = new HColorPool()
    /*.add(#FFA521)
    .add(#FFFFA3)
    .add(#8E5421)
    .add(#451F13)
    .add(#FFFFE5)*/

    .add(#d8e5e0)
    .add(#444543)
    .add(#262827)
    .add(#a7b0ac)
    .add(#171616)
;

color kickClr, snareClr, hiClr;

void setup()
{
  size(800, 800, P3D);
  H.init(this).background(#ECECEC).use3D(true).autoClear(true);
  smooth();

  kickImgs[0] = loadImage("snake2.png");
  kickClr = goldRush.getColor();

  snareImgs[0] = loadImage("dagger2.png");
  snareClr = goldRush.getColor();

  hiImgs[0] = loadImage("skull2.png");
  hiClr = goldRush.getColor();

  systems = new ArrayList<ParticleSystem>();

  minim = new Minim(this);
  source = minim.loadFile("pray_teenage_deejay.mp3", 512);
  source.play();
  //source = minim.getLineIn(Minim.STEREO);
  beat = new BeatDetect(source.bufferSize(), source.sampleRate());
  beat.setSensitivity(50);  
  
  kickSize = snareSize = hatSize = 16;
  bl = new BeatListener(beat, source);  

}

void draw()
{
  H.drawStage();

  background(0);
  fill(255);

  if ( beat.isKick() ){
     addParticleBurst(kickImgs[ int(random(kickImgs.length)) ], kickClr);
     println("kick");
  }

  if( beat.isSnare() ){
      tint(snareClr);
      addParticleBurst(snareImgs[ int(random(snareImgs.length)) ], snareClr);
      println("snare");
  }

  if( beat.isHat() ){ 
    addParticleBurst(hiImgs[ int(random(hiImgs.length)) ], hiClr);
    println("hat");
  }

  for (ParticleSystem ps : systems) {
    ps.run();
  }

}

void addParticleBurst(PImage img, color clr ) {
  systems.add( new ParticleSystem(new PVector(width/2,height/3), img, clr) );
}
