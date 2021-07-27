package dto;

import entidades.Episodio;
import java.util.List;

public class NuevaTemporadaDTO {
    
    private Integer temporada;
    private Episodio episodios;
    private Integer idSerie;

    public Integer getIdSerie() {
        return idSerie;
    }

    public void setIdSerie(Integer idSerie) {
        this.idSerie = idSerie;
    }

    public Episodio getEpisodios() {
        return episodios;
    }

    public void setEpisodios(Episodio episodios) {
        this.episodios = episodios;
    }

    public Integer getTemporada() {
        return temporada;
    }

    public void setTemporada(Integer temporada) {
        this.temporada = temporada;
    }
    
    
    
}
