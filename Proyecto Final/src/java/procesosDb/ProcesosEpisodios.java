package procesosDb;

import entidades.Episodios;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProcesosEpisodios {
    
    Connection conexion;
    
    public ProcesosEpisodios(){
        conexion = new Conexion().OpenDb();
    }
    
    public List<Episodios> ListarEpisodios(Integer id){
        
        try {
            
            Statement statement = conexion.createStatement();
            
            String query = "SELECT * FROM episodios WHERE idSerie="+id;
            
            ResultSet resultado = statement.executeQuery(query);
            
            List<Episodios> episodios = new ArrayList<>();
            
            while(resultado.next()){
                Episodios episodio = new Episodios();
                
                episodio.setEpisodio(resultado.getString("episodio"));
                episodio.setTemporada(resultado.getString("temporada"));
                episodio.setNombre(resultado.getString("nombre"));
                episodio.setIdSerie(Integer.parseInt(resultado.getString("idSerie")));
                episodio.setIdEpisodio(Integer.parseInt(resultado.getString("id_episodio")));
                episodio.setDuracion(Integer.parseInt(resultado.getString("duracion")));
                
                episodios.add(episodio);
            }
            
            statement.close();
            resultado.close();
            
            return episodios;
            
            
        } catch (Exception e) {
        }
        
        return null;
    }
    
    public Episodios BuscarPorId(Integer id){
        
        try {
            
            Statement statement = conexion.createStatement();
            
            String query = "SELECT * FROM episodios WHERE id_episodio="+id;
            
            ResultSet resultado = statement.executeQuery(query);
            
            while(resultado.next()){
                Episodios episodio = new Episodios();
                
                episodio.setEpisodio(resultado.getString("episodio"));
                episodio.setTemporada(resultado.getString("temporada"));
                episodio.setNombre(resultado.getString("nombre"));
                episodio.setIdSerie(Integer.parseInt(resultado.getString("idSerie")));
                episodio.setIdEpisodio(Integer.parseInt(resultado.getString("id_episodio")));
                episodio.setDuracion(Integer.parseInt(resultado.getString("duracion")));
                
                statement.close();
                resultado.close();
                
                return episodio;
            }
            
        } catch (Exception e) {
        }
        
        return null;
    }
    
    public List<Episodios> ObtenerTemporadas(Integer idSerie){
        
        try {
            
            Statement statement = conexion.createStatement();
            
            String query = "SELECT DISTINCT temporada FROM episodios WHERE idSerie="+idSerie; 
            
            List<Episodios> temporadas = new ArrayList<>();
            ResultSet resultado = statement.executeQuery(query);
            
            while(resultado.next()){
                Episodios temporada = new Episodios();
                temporada.setTemporada(resultado.getString("temporada"));
                
                temporadas.add(temporada);
            }
            
            resultado.close();
            statement.close();
            
            return temporadas;
            
        } catch (Exception e) {
        }
        
        return null;
    }
    
    public List<Episodios> ListarPorTemporada(Integer idSerie, Integer temporada){
        
        try {
            
            Statement statement = conexion.createStatement();
            
            String query = "CALL listar_por_temporada("+idSerie+","+temporada+")";
            
            List<Episodios> episodios = new ArrayList<>();
            
            ResultSet resultado = statement.executeQuery(query);
            
            while(resultado.next()){
                Episodios episodio = new Episodios();
                
                episodio.setDuracion(Integer.parseInt(resultado.getString("duracion")));
                episodio.setEpisodio(resultado.getString("episodio"));
                episodio.setIdEpisodio(Integer.parseInt(resultado.getString("id_episodio")));
                episodio.setIdSerie(Integer.parseInt(resultado.getString("idSerie")));
                episodio.setNombre(resultado.getString("nombre"));
                episodio.setTemporada(resultado.getString("temporada"));
                
                episodios.add(episodio);
            }
            
            statement.close();
            resultado.close();
            
            return episodios;
            
        } catch (NumberFormatException | SQLException e) {
        }
        
        return null;
    }
    
    public int ActualizarEpisodios(Episodios episodio){
        int resultado = 0;
        try {
            
            Statement statement = conexion.createStatement();
            
            String query = "CALL actualizar_episodio('"+episodio.getNombre()+"',"+episodio.getDuracion()+","+episodio.getIdEpisodio()+")";
            
            resultado = statement.executeUpdate(query);
            
            statement.close();
            
            return resultado;
            
        } catch (Exception e) {
        }
        
        return resultado;
    }
    
    public int EliminarEpisodio(Integer id){
        int resultado = 0;
        
            try {
            Statement statement = conexion.createStatement();
            
            String query = "CALL borrar_episodio("+id+")";
            
            resultado = statement.executeUpdate(query);
            
            statement.close();
            
            return resultado;
            
        } catch (Exception e) {
        }
        
        return resultado;
    }
        
    public int EliminarTemporada(Integer temporada, Integer idSerie){
        int resultado = 0;
        
            try {
            Statement statement = conexion.createStatement();
            
            String query = "CALL borrar_temporada("+temporada+","+idSerie+")";
            
            resultado = statement.executeUpdate(query);
            
            statement.close();
            
            return resultado;
            
        } catch (Exception e) {
        }
        
        return resultado;
    }
    
    public int AgregarEpisodio(Episodios episodio){
        int resultado = 0;
        
        try {
            Statement statement = conexion.createStatement();
            
            String query = "CALL agregar_episodio("+episodio.getTemporada()+",'"+episodio.getNombre()+"',"+episodio.getDuracion()+","+episodio.getIdSerie()+")";
            
            resultado = statement.executeUpdate(query);
            
            statement.close();
            
            return resultado;
        } catch (Exception e) {
        }
        
        return resultado;
    }
}
