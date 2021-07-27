package procesosDb;

import dto.NuevaSerieDTO;
import dto.NuevaTemporadaDTO;
import entidades.Series;
import entidades.Temporadas;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProcesosSeries {
    
    Connection conexion;
    
    public ProcesosSeries(){
        conexion = new Conexion().OpenDb();
    }
    
    public List<Series> getAllSeries(){
        
        try {
            Statement statement = conexion.createStatement();
            String query = "SELECT * FROM series";
            
            ResultSet resultado = statement.executeQuery(query);
            
            List<Series> series = new ArrayList<>(); //Esta lista almacena todas las series
            
            while(resultado.next()){
                Series serie = new Series();
                serie.setId(Integer.parseInt(resultado.getString("id")));
                serie.setNombre(resultado.getString("nombre"));
                serie.setDescripcion(resultado.getString("descripcion"));
                serie.setFoto(resultado.getString("imagen"));
                serie.setFondo(resultado.getString("fondo"));

                
                series.add(serie);
            }
            
            statement.close();
            resultado.close();
            
            return series;
            
        } catch (Exception e) {
        }
        
        return null;
    }
    
    public Series ObtenerInformacion(Integer serie){
        
        try {
            
            Statement statement = conexion.createStatement();
            
            String query = "SELECT * FROM series WHERE id=" + serie;

            
            ResultSet resultado = statement.executeQuery(query);
            
            while(resultado.next()){
                Series serieCreada = new Series();
                serieCreada.setId(serie);
                serieCreada.setFoto(resultado.getString("imagen"));
                serieCreada.setDescripcion(resultado.getString("descripcion"));
                serieCreada.setNombre(resultado.getString("nombre"));
                serieCreada.setFondo(resultado.getString("fondo"));
              
                statement.close();
                resultado.close();
                return serieCreada;
            }
            
        } catch (Exception e) {
        }
        return null;
    } 
    
    public List<Temporadas> ObtenerTemporadas(Integer serie){
        
        try {
            
            Statement statement = conexion.createStatement();
            
            String query = "SELECT * FROM temporadas WHERE id_serie=" + serie;
            
            ResultSet resultado = statement.executeQuery(query);    
            
            List<Temporadas> temporadas = new ArrayList<>();
            
            while(resultado.next()){
                Temporadas temporada = new Temporadas();
                temporada.setIdSerie(Integer.parseInt(resultado.getString("id_serie")));
                temporada.setTemporada(Integer.parseInt(resultado.getString("temporada")));
                temporada.setCapitulos(Integer.parseInt(resultado.getString("capitulos")));
                
                temporadas.add(temporada);
            }
            
            statement.close();
            resultado.close();

            return temporadas;
        } catch (Exception e) {
        }
        return null;
    } 
    
     public int CrearSerie(NuevaSerieDTO serie){
        int resultado = 0;
        try {
            
            Statement statement = conexion.createStatement();
            
            String query = "CALL crear_serie('"+ serie.getSerie().getNombre()+"','"+serie.getSerie().getDescripcion()+"','"+serie.getSerie().getFoto()+"','"+serie.getSerie().getFondo()+"')";
            

            
            resultado = statement.executeUpdate(query);
            
           query = "SELECT * FROM series ORDER BY id DESC LIMIT 1";
           
           ResultSet resultadoDos = statement.executeQuery(query);
           
           while(resultadoDos.next()){
               
               serie.getCategorias().stream()
                       .forEach(i -> {
                           try {
                                statement.executeUpdate("INSERT INTO categorias_series(id_series, id_categorias) VALUES ("+resultadoDos.getString("id")+","+i+")");
                            } catch (SQLException e) {
                            }
                       });
               
               for(int i=0; i<serie.getEpisodios().getEpisodio().size(); i++){
                   try {
                       statement.executeUpdate("CALL agregar_episodios ("+serie.getEpisodios().getEpisodio().get(i)+",'"+
                               serie.getEpisodios().getNombre().get(i)+"',"+
                               serie.getEpisodios().getDuracion().get(i)+","+resultadoDos.getString("id")+")");
                   } catch (SQLException e) {
                   }
               }
           }
            
            resultadoDos.close();
            statement.close();
            

            return resultado;
        } catch (SQLException e) {
        }
        return resultado;
    }
     
    public int CrearTemporada(NuevaTemporadaDTO temporadas){
        int resultado = 0;
        
        try {
            
            Statement statement = conexion.createStatement();
            
            for(int i=0; i<temporadas.getEpisodios().getDuracion().size(); i++){
                statement.executeUpdate("CALL agregar_temporada("+temporadas.getEpisodios().getEpisodio().get(i)+","+
                        temporadas.getTemporada()+",'"+temporadas.getEpisodios().getNombre().get(i)+"',"+
                        temporadas.getEpisodios().getDuracion().get(i)+","+temporadas.getIdSerie()+")");
            }
            
            statement.close();
            return resultado;
            
        } catch (Exception e) {
        }
        
        return resultado;
    }
    
    public int ActualizarSerie(Series serie){
        int resultado = 0;
        try {
            
            Statement statement = conexion.createStatement();
            
            String query = "CALL actualizar_serie('"+serie.getNombre()+"','"+serie.getDescripcion()+"','"+serie.getFoto()+"','"+serie.getFondo()+"',"+serie.getId()+")";
            
            resultado = statement.executeUpdate(query);
            
            statement.close();
            return resultado;
        } catch (SQLException e) {
        }
        return resultado;
    } 
    
    public int EliminarSerie(Integer id){
        int resultado = 0;
        try {
            
            Statement statement = conexion.createStatement();
            
            String query = "CALL borrar_serie("+id+")";
            
            resultado = statement.executeUpdate(query);
            
            statement.close();
            return resultado;
        } catch (SQLException e) {
        }
        return resultado;
    } 
     
}
