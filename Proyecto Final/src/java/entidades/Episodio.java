package entidades;

import java.util.List;

public class Episodio {
    
    private List<Integer> episodio;
    private List<Integer> temporada;
    private List<String> nombre;
    private List<Integer> duracion;
    private List<Integer> idSerie;

    public List<Integer> getEpisodio() {
        return episodio;
    }

    public void setEpisodio(List<Integer> episodio) {
        this.episodio = episodio;
    }

    public List<Integer> getTemporada() {
        return temporada;
    }

    public void setTemporada(List<Integer> temporada) {
        this.temporada = temporada;
    }

    public List<String> getNombre() {
        return nombre;
    }

    public void setNombre(List<String> nombre) {
        this.nombre = nombre;
    }

    public List<Integer> getIdSerie() {
        return idSerie;
    }

    public void setIdSerie(List<Integer> idSerie) {
        this.idSerie = idSerie;
    }

    public List<Integer> getDuracion() {
        return duracion;
    }

    public void setDuracion(List<Integer> duracion) {
        this.duracion = duracion;
    }
    
}
