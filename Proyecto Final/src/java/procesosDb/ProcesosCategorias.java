package procesosDb;

import entidades.Categorias;
import entidades.Series;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProcesosCategorias {
    
    Connection conexion;
    
    public ProcesosCategorias(){
        conexion = new Conexion().OpenDb();
    }
    
    public List<Categorias> ListarCategorias(){
        
        try {
            Statement statement = conexion.createStatement();
            
            String query = "SELECT * FROM categorias";
            ResultSet resultado = statement.executeQuery(query);
            
            List<Categorias> categorias = new ArrayList<>();
            
            while(resultado.next()){
                Categorias categoria = new Categorias();
                categoria.setIdCategorias(Integer.parseInt(resultado.getString("id_categoria")));
                categoria.setNombre(resultado.getString("nombre"));
                
                categorias.add(categoria);
            }
            
            statement.close();
            resultado.close();
            
            return categorias;

        } catch (Exception e) {
        }
        
        return null;
    }
    
    public List<Series> BuscarPorId(Integer id){
        
        try {
            Statement statement = conexion.createStatement();
            
            
            String query = "CALL obtener_por_id("+id+")";
            
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
    
    public List<Categorias> BuscarEnSerie(Integer id){
        
        try {
            Statement statement = conexion.createStatement();
            
            
            String query = "CALL obtener_categorias_series("+id+")";
            
            ResultSet resultado = statement.executeQuery(query);
            
            List<Categorias> categorias = new ArrayList<>();
            
            while(resultado.next()){
                Categorias categoria = new Categorias();
                
                categoria.setNombre(resultado.getString("nombre"));
                categoria.setIdCategorias(Integer.parseInt(resultado.getString("id_categoria")));
                
                categorias.add(categoria);
            }
            statement.close();
            resultado.close();
            
            return categorias;

        } catch (Exception e) {
        }
        
        return null;
    }
    
    public Categorias obtenerCategoria(Integer id){
        try {
            Statement statement = conexion.createStatement();
            
            String query = "CALL obtener_coincidencia_categoria("+id+")";
            
            ResultSet resultadoQuery = statement.executeQuery(query);
            
            while(resultadoQuery.next()){
                Categorias categoria = new Categorias();
                
                categoria.setNombre(resultadoQuery.getString("nombre"));
                
                statement.close();
                
                return categoria;
            }
            
            
        } catch (Exception e) {
        }
        
        return null;
    }
    
    
}
