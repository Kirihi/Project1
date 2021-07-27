package procesosDb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    
    public Connection OpenDb(){
        try{
            Class.forName("org.mariadb.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/nequeplay", "root", "admin");
        }
        catch(ClassNotFoundException e){
            System.out.println("Error en la libreria mariadb: " + e);
        }
        catch(SQLException e){
            System.out.println("Error al conectarse a la db: " + e);
        }
        return null;
    }
    
}
