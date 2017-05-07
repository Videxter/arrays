Chmusick live => NRev rev => Gain gate => dac;
Notes notes;

SinOsc bass => NRev v => dac;
TriOsc tri;


live.file("kick",1) => Buffer.d1.read;
live.file("hh27",1) => Buffer.d2.read;
live.file("xmas",1) => Buffer.d3.read;
live.file("can",4) => Buffer.d4.read;
live.file("can",4) => Buffer.d4.read;
live.file("snare",7) => Buffer.d5.read;
live.file("kick",3) => Buffer.d6.read;


4 => live.CYCLES;
4 => live.MEASURE;
0.01 => rev.mix;
v.mix(0.2);
130 => live.TEMPO;
0.2 => gate.gain;
0.02 => tri.gain;
Buffer.d1.gain(0.7);
Buffer.d2.gain(0.8);
Buffer.d4.gain(0.2);
Buffer.d5.gain(0.4);
Buffer.d6.gain(0.3);
0.7 => bass.gain;


[1,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0] @=> int bdR[];
live.every(1)  @=> int hhR[];
[31,33,33,33,0,0,0,33,33,0,0,33,0,0,34,33] @=> int bassR[];
[29,29,29,29,29,29,29,29,29,29,29,29,31,32,32,32,32,32,32,27,27,31,31,31,31,31,31,31,31,32,21,27]@=> int b[];
[3]@=> int s[];
//[33,33,33,0,0,0,33,33,0,0,33,0,0,34,33,31] => live.rotate @=> int bassR[];
[64,0,69,0,0,65,0,0]@=> int m[];
[0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0]@=> int sn[];
[0,0,0,1,0,0,0,0,0,0,1,0,0,0,1,0] @=> int house[];
[0,1,0,1,0,0,1,0,0,0,0,1,0,0,0,1] @=> int house2[];

spork~live.play(Buffer.d1,bdR,0);
spork~live.play(Buffer.d5,sn,0);
spork~live.play(Buffer.d4,house2,0);
spork~live.play(Buffer.d2,hhR,0);
spork~live.play(bass,m,0);
spork~live.play(tri,s,0); 
/*spork~live.play(Buffer.d3,jungle,0);*/
/*spork~synth.sound(8,live.subArray(live.transpose(notes.modes(5),45),[1,-1,-1,-1,-1,6,-1,-1,-1,-1]));*/
spork~live.play(Buffer.d6,house,0);


while(true){
    for(0 => int i; i < 8; i++){
        live.Dur(live.TEMPO,live.MEASURE) => now;
        //live.file("arpy",i+1) => Buffer.d3.read;
        if(STATIC.BEATS % 8 == 0){
            for(0 => int i; i < bassR.size(); i++){
                if(bassR[i] != 0){
                    //bassR[i] + 2 => bassR[i];
                }
            }
        }
    }
}
