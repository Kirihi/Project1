package procesosDb;

import entidades.Series;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProcesosBusqueda {
    
    Connection conexion;
    
    public ProcesosBusqueda(){
        conexion = new Conexion().OpenDb();
    }
    
    public List<Series> ListarBusqueda(String busqueda){
        
        try {
            Statement statement = conexion.createStatement();
            
            String query = "SELECT * FROM series WHERE nombre LIKE '%"+busqueda+"%'";
            ResultSet resultado = statement.executeQuery(query);
            
            List<Series> series = new ArrayList<>();
            
            while(resultado.next()){
                Series serie = new Series();
                
                serie.setId(Integer.parseInt(resultado.getString("id")));
                serie.setNombre(resultado.getString("nombre"));
                serie.setDescripcion(resultado.getString("descripcion"));
                serie.setFoto(resultado.getString("imagen"));
                
                series.add(serie);
            }
            
            statement.close();
            resultado.close();
            
            return series;

        } catch (Exception e) {
        }
        
        return null;
    }
    
}
