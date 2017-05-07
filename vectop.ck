public class Vectop
{
    
    int v [0];
    int m[0][0];
    
    public void init( int w[]) { w @=> v;}
    

    public int[] shape(int vect[])
    {
        "(" => string s;
        Std.itoa(vect.cap())+","+=> s;
        ")" +=> s;
        chout <= s <= IO.nl();
        return [vect.cap(),0];
    }

    public int[] shape(int vect[][])
    {
        "(" => string s;
        Std.itoa(vect.cap())+","+Std.itoa(vect[0].cap())+=> s;
        ")" +=> s;
        chout <= s <= IO.nl();
        return [vect.cap(),vect[0].cap()];
    }    
    
    public int[] sum(int v1[],int v2[])
    {   
        if (v1.cap() == v2.cap())
        {
            int suma[v1.cap()];
            for(0 => int i; i<v1.cap(); i++) { v1[i] + v2[i] => suma[i]; }
            return suma;
        }
        else
        {
            <<<"Error:The vectors are diferent dimentions.">>>;
        }
    }
    
    //convierte arrays de ondas a arrays osc
    public Osc[] sntoo(SinOsc s[])
    {// sine to Osc
        Osc a[s.cap()];
        for (0 => int i; i < s.cap(); i++) s[i] @=> a[i];    
        return a;
    } 

    public Osc[] swtoo(SawOsc s[])
    {// saw to osc
        Osc a[s.cap()];
        for (0 => int i; i < s.cap(); i++) s[i] @=> a[i];    
        return a;
    } 

    public Osc[] sqtoo(SqrOsc s[])
    {// sqt to osc
        Osc a[s.cap()];
        for (0 => int i; i < s.cap(); i++) s[i] @=> a[i];    
        return a;
    }

    public Osc[] ttoo(TriOsc s[])
    {// tri to osc
        Osc a[s.cap()];
        for (0 => int i; i < s.cap(); i++) s[i] @=> a[i];    
        return a;
    } 

    // Concatenacion para arrays de Osciladores
    public Osc[] concatOsc( Osc v1[], Osc v2[] )
    {// concatena 2 arrays de osc
        v1.cap()+v2.cap() => int dim;
        Osc result[dim];
        0 => int c;
        for(0 => int i; i < result.cap(); i++)
        {
            if (i < v1.cap()) 
            { v1[i] @=> result[i]; }
            else if (i >= v1.cap())
            {
                v2[c] @=> result[i];
                c++;
            }
        }
        return result;
    }     

    public Osc[] concatOsc( Osc v1[], Osc v2[], Osc v3[])
    {// concatena 3 arrays de Osc 
        concatOsc( v1, v2 )@=> Osc s[];
        return concatOsc( s, v3 );
    }
    
    public Osc[] concatOsc( Osc v1[], Osc v2[], Osc v3[], Osc v4[])
    {// concatena 4 arrays de Osc 
        concatOsc( v1, v2 )@=> Osc s[];
        return concatOsc( s, v3, v4 );
    }
     
    public int[] concat(int v1[],int v2[]){
        v1.cap()+v2.cap() => int dim;
        int result[dim];
        0 => int c;
        for(0 => int i; i < result.cap(); i++)
        {
            if (i < v1.cap()) { v1[i] => result[i]; }
            else if (i >= v1.cap())
            {
                v2[c] => result[i];
                c++;
            }
        }
        return result;
    } 
    
    public int[] concat( int v1[], int v2[] , int v3[] ){
        return concat( concat( v1, v2 ) , v3 );
    }
    
    public int[] concat( int v1[], int v2[] , int v3[], int v4[] ){
        return concat( concat( v1, v2 ) , v3, v4 );
    }
   
    public int[] sort(int list[]){
        list.cap() => int n;
        int aux; 
        
        for (1 => int i; i <= n; i++)
        {
            for (0 => int j; j <= n-i ; i++)
            {
                if ( list[j] > list[j+1] )
                {
                    list[j] => aux;
                    list[j+1] => list[j];
                    aux => list[j+1];
                }
            }
        }
        return list;
    }

    public void printVect(int vect[])
    {
        string row;
        "[" => row;
        for(0 => int i; i<vect.cap(); i++) 
        {   
            if ( i < vect.cap()-1 ) Std.itoa(vect[i])+", "+=> row; 
            else if ( i == vect.cap()-1 ) Std.itoa(vect[i])+=> row;    
            /*<<<"\n",vect[i]>>>;*/ 
        }
        "]"+=> row;
        chout <=  row <= IO.nl();
    }
    
    public void printVect(int vect[][])
    {
        string row;
        "[" => row;
        for(0 => int i; i < vect.cap(); i++) 
        {   
            "["+=> row;
            // para imprimir todas las filas row, se llena aqui 
            for (0 => int j; j < vect[0].cap(); j++)
            {
                if ( j < vect[i].cap()-1 ) Std.itoa(vect[i][j])+", "+=> row; 
                else if ( j == vect[i].cap()-1 ) Std.itoa(vect[i][j])+=> row;    
                
            }
            // mientras que i no sea la ultima fila, siempre se limpia row
            // y agrega la llave de la siguiente fila
            "]"+=> row;
            if ( i < vect.cap()-1 ) 
            {
                chout <=  row <= IO.nl();
                " " => row; 
            }
            // cuando i sea la ultima fila no limpia row
            else if (i == vect.cap()-1) chout <=  row <= IO.nl();
                
            
        }
        "]"+=> row;
        chout <=  row <= IO.nl();
    }

    public int[] emult(int n, int vect[])
    {
        for(0 => int i; i < vect.cap(); i++) { n*vect[i]=>vect[i]; }
        return vect;
    }

    public int[] fill(int times, int number)
    {// crea un array de constantes number de longitud times 
        int vect[times];
        for (0 => int i; i < vect.cap(); i++) { number => vect[i]; }
        return vect;
    }
    
    public int[] fill(int len, int array[])
    {// crea un array de longitud len con repeticiones de array
        int fil[len];
        for (0 => int i; i < fil.cap(); i++) 
        { 
            array[ i % array.cap() ] => fil[i];
        }
        return fil;
    }

    public int[] range(int n1, int n2) 
    {
        Std.abs(n2-n1) => int dim;  
        int vect[dim];
        for(0 => int i; i < vect.cap(); i++) { n1+i => vect[i]; }
        return vect;
    }
    
    public int count ( int n, int m[] )
    {
        int c;
        for ( 0 => int i; i < m.cap(); i++ )
        {
            if ( m[i] == n ) 1 +=> c;
        }
        return c;
    }
    
    public int[] replace( int a, int b, int array[] )
    {// Reemplaza un numero a por uno b
        for ( 0 => int i; i < array.cap(); i++ )
        {
            if (array[i] == a) b => array[i];
        }
        return array;
    }
    
    
    public int[] replace( int a[], int b, int array[] )
    {// Reemplaza un conjunto de numeros a[] por un solo numero b
        for ( 0 => int i; i < array.cap(); i++ )
        {
            for (0 => int j ; j < a.cap(); j++)
            {
                if (array[i] == a[j]) b => array[i]; 
            } 
            
        }
        return array;
    }
    
    public int[] replaceEven( int a, int array[] )
    {// reemplaza todas las posiciones pares del array
        0 => int c;
        for ( 1 => int i; i < array.cap(); 2*c + 1 => i ) 
        { // no se porque i empieza desde 1 pero asi funciona
            1 +=> c;
            a => array[ i ];
        }
        return array;
    }
   
    public int[] replaceOdd( int a, int array[] )
    {// reemplaza todas las posiciones impares del array
        // la definicion de impar para arrays es 2*n
        int c;
        for ( 0 => int i; i < array.cap(); 2*c => i ) 
        {
            1 +=> c;
            a => array[ i ];
        }
        return array;
    }
    
    public int[] remove( int a, int array[] )
    {
        return replace(a, 0, array);
    }
    
    public int[] remove( int a[], int array[] )
    {// reemplaza por ceros los numeros de a que esten array
        return replace(a, 0, array);
    }
    
    public int[] removeEven( int array[] )
    {// reemplaza por ceros las posiciones pares de array
        return replaceEven(0, array);
    }
    
    public int[] removeOdd( int array[] )
    {// reemplaza por ceros las posiciones impares de array
        return replaceOdd(0, array);
    }
    
    // Nota: no hacer una fun gainRack para poner el mismo gain a todo
    // los Objetos Gain ya lo hacen
    
    public int dimEquals( Osc wave[], float db[] )
    {// verifica dimensiones de las funciones gain Rack 
        if ( wave.cap() == db.cap() ) return 1;
        else 
        {
            chout <=  " Error: las dimesiones de los arrays son diferentes. " <= IO.nl();
            return 0;
        }
    }
    
    public void gainRack( SinOsc wave[], float db[] )
    {// asigna los valores float a cada onda en el orden del array
        if ( dimEquals( sntoo( wave ), db ) ){   
            for (0 => int i; i < wave.cap(); i++) db[i] => wave[i].gain;            
        }
    }
    
    public void gainRack( SqrOsc wave[], float db[] )
    {// asigna los valores float a cada onda en el orden del array
        if ( dimEquals( sqtoo( wave ), db ) ){
            for (0 => int i; i < wave.cap(); i++) db[i] => wave[i].gain;            
        }
    }
    
    public void gainRack( SawOsc wave[], float db[] )
    {// asigna los valores float a cada onda en el orden del array
        if ( dimEquals( swtoo( wave ), db ) ){
            for (0 => int i; i < wave.cap(); i++) db[i] => wave[i].gain;            
        }
    }
    
    public void gainRack( TriOsc wave[], float db[] )
    {// asigna los valores float a cada onda en el orden del array
        if ( dimEquals( ttoo( wave ), db ) ){
            for (0 => int i; i < wave.cap(); i++) db[i] => wave[i].gain;            
        }
    }
    
    public void gainRack( Osc wave[], float db[] )
    {// asigna los valores float a cada onda en el orden del array
        if ( dimEquals( wave , db ) ){
            for (0 => int i; i < wave.cap(); i++) db[i] => wave[i].gain;            
        }
    }
    
    
}

//Vectop v;
 
//v.nvect(10,1)@=> int n[]; 

//v.shape(n); 

//v.removeEven(n)@=> n;

//v.printVect(v.fill(16,[12,13,14,15])); 
/*/v.printVect(v.replacE(1,2,n));

SinOsc s[2];
SawOsc s[2];
SqrOsc s[2];

v.concatOsc()

v.gainRack(s, [0.2,0.4]);

<<<s[1].gain()>>>;
*/

//v.printVect(v.removeEven(n));