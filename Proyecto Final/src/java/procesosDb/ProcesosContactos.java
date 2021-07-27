package procesosDb;

import entidades.Contacto;
import java.sql.Connection;
import java.sql.Statement;

public class ProcesosContactos {
    
    Connection conexion;
    
    public ProcesosContactos(){
        conexion = new Conexion().OpenDb();
    }
    
    public int recibirMensaje(Contacto contacto){
        int resultado = 0;
        
        try {
            
            Statement statement = conexion.createStatement();
            
            String query = "CALL agregar_contacto('"+contacto.getNombreContacto()+"','"+contacto.getCorreoContacto()+"','"+contacto.getTipo()+"','"+contacto.getAsunto()+"','"+contacto.getMensaje()+"')";
            
            resultado = statement.executeUpdate(query);
            
            statement.close();
            
            return resultado;
            
        } catch (Exception e) {
            System.out.println("procesosDb.ProcesosContactos.recibirMensaje(): " + e);
        }
        
        return 0;
    }
    
}
