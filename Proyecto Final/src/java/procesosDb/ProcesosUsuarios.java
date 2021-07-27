package procesosDb;

import entidades.Usuarios;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class ProcesosUsuarios {
    
    Connection conexion;
    
    public ProcesosUsuarios(){
        conexion = new Conexion().OpenDb();
    }
    
    public int GuardarUsuario(Usuarios usuario){
        int resultado =0;
        try{
            Statement statement = conexion.createStatement();
            
            String query = "INSERT INTO usuarios(contrasena, correo)";
            query += "VALUES ('"+usuario.getContrasena()+"','"+usuario.getCorreo()+"')";
            
            resultado = statement.executeUpdate(query);
            
            statement.close();
            
            return resultado;
        }
        catch(Exception e){
            System.out.println("Exception: " + e);
        }
        return resultado;
    }
    
    public Usuarios ValidarUsuarios(Usuarios usuario){
        
        try{
            
            Statement statement = conexion.createStatement();
            String query = "SELECT * FROM usuarios WHERE contrasena='"+usuario.getContrasena()+"' AND correo='"+usuario.getCorreo()+"'";
            
            ResultSet resultado = statement.executeQuery(query);
            
            while(resultado.next()){
                Usuarios usuarios = new Usuarios();
                usuarios.setCorreo(resultado.getString("correo"));
                usuarios.setIdUsuario(resultado.getInt("id"));
                usuarios.setContrasena(resultado.getString("contrasena"));
                usuarios.setAdmin(resultado.getNString("admin"));
                
                statement.close();
                resultado.close();
                return usuarios;
            }
            
            
            
        }catch(Exception e){
            
        }
        
        return null;
    }
    
    public int ActualizarCorreo(Usuarios usuario){
        int resultado =0;
        try{
            Statement statement = conexion.createStatement();
            
            String query = "UPDATE usuarios SET correo='"+usuario.getCorreo()+"' WHERE id="+usuario.getIdUsuario();
            
            
            resultado = statement.executeUpdate(query);
            
            statement.close();
            
            return resultado;
        }
        catch(Exception e){
            System.out.println("Exception: " + e);
        }
        return resultado;
    }
    
    public int ActualizarContrasena(Usuarios usuario){
        int resultado =0;
        try{
            Statement statement = conexion.createStatement();
            
            String query = "UPDATE usuarios SET contrasena='"+usuario.getContrasena()+"' WHERE id="+usuario.getIdUsuario();
            
            
            resultado = statement.executeUpdate(query);
            
            statement.close();
            
            return resultado;
        }
        catch(Exception e){
            System.out.println("Exception: " + e);
        }
        return resultado;
    }
    
}
