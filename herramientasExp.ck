public void sonar(Osc s, int note[], dur t)
{   
    while (true){
        s => dac;    
        0.5 => s.gain;
        for (0 => int i; i< note.cap(); i++)
        {
            Std.mtof(note[i]) => s.freq;
            t/2 => now;
            //(10.0*i) +=> c;
            //Std.mtof(note[i]) => s.freq;
            //t/2 => now;
            <<<"Entro",note[i]>>>;
        }
        mut(note)@=> note; 
        s =< dac;
    }
}


public static int[] mut(int j[])
{
   for (0 => int i; i < j.cap(); i++)
   {
       if (Math.random2( 0, j.cap()) == i )
       {
           Math.random2( 40, 80 + j.cap()-1 ) => j[i];
           <<<"Muta">>>;
       }    
   }
   return j;
}

[36,37,39,38]@=> int i[];

TriOsc sn[2];   
SawOsc sw[2];

//spork~mut(i);
//<<<i[3]>>>;

spork~sonar(sn[0], i, 0.5::second);
   
while(true)
{
    1::ms =>now;
    
}   