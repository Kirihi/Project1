package dto;

import entidades.Episodio;
import entidades.Series;
import java.util.List;

public class NuevaSerieDTO {
    
    private Series serie;
    private List<Integer> categorias;
    private Episodio episodios;


    public Series getSerie() {
        return serie;
    }

    public void setSerie(Series serie) {
        this.serie = serie;
    }

    public List<Integer> getCategorias() {
        return categorias;
    }

    public void setCategorias(List<Integer> categorias) {
        this.categorias = categorias;
    }

    public Episodio getEpisodios() {
        return episodios;
    }

    public void setEpisodios(Episodio episodios) {
        this.episodios = episodios;
    }

}
