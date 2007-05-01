/*
 * Main.java
 *
 * Created on 1 de mayo de 2007, 16:59
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package dietacjava;

import com.ugos.JIProlog.engine.*;
import com.ugos.JIProlog.*;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

/**
 *
 * @author Carlos
 */
public class Main {
    
    /** Creates a new instance of Main */
    public Main() {
        }
    
    public List<String> leerAlimentos(){
        List<String> alimentos = new ArrayList();
        alimentos.add("arroz"); alimentos.add("cereales"); alimentos.add("pan");
        alimentos.add("patatas"); alimentos.add("pasta"); alimentos.add("fruta");
        alimentos.add("verduras"); alimentos.add("legumbres"); alimentos.add("pescado");
        alimentos.add("cerdo"); alimentos.add("vacuno"); alimentos.add("ave");
        alimentos.add("embutidos"); alimentos.add("fritos"); alimentos.add("lacteos");
        alimentos.add("huevos"); alimentos.add("dulces");
        return alimentos;       
    }
    public static void main(String[] args) {
        try {
            Main m = new Main();
            Writer fout = new FileWriter("out.txt");
            
            JIPEngine jip = new JIPEngine();
            jip.consultFile("reglas.pl");
            
            List<String> results = new ArrayList();
            results.add("noApto"); results.add("posible"); results.add("recomendado");
            results.add("muyRecomendado");results.add("prioritario");
            
            List<String> alimentos = m.leerAlimentos();
            
            for(String alimento : alimentos){
                for(String result : results){
                    JIPQuery jquery = jip.openSynchronousQuery(result + "(" + alimento + ").");
                    JIPTerm solution = jquery.nextSolution();
                    if(solution != null){
                        String str = alimento+":"+result;
                        fout.write(str+System.getProperty("line.separator"));
                        System.out.println(str);
                    }
                }
            }
            fout.close();
        } catch (JIPSyntaxErrorException ex) {
            ex.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        System.exit(0);
    }
    
}