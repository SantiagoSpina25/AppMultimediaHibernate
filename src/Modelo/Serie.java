/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import javax.persistence.*;

/**
 *
 * @author Santiago Spina
 */
@Entity
@Table(name = "serie")
public class Serie implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idSerie")
    private Integer idSerie;
    @Column(name = "titulo")
    private String titulo;
    @Column(name = "anio_lanzamiento")
    private Integer anio_lanzamiento;
    @Column(name = "num_temporadas")
    private Integer num_temporadas;
    @Column(name = "imagen_url")
    private String imagen_url;

    //Relacion 1.N con Temporada
    //mappedBy indica que entidad no tiene la foreign key, en este caso, serie no tiene la clave, sino que la tiene temporada
    @OneToMany(mappedBy = "serie")
    private List<Temporada> temporadas;

    //Relacion N.M con Actor
    @ManyToMany
    @JoinTable(
            name = "serie_actor",//Tabla intermedia
            joinColumns = @JoinColumn(name = "idSerie"),
            inverseJoinColumns = @JoinColumn(name = "idActor")
    )
    private List<Actor> actores;
    
    //Relacion N.M con Genero
    @ManyToMany
    @JoinTable(
            name = "serie_genero",//Tabla intermedia
            joinColumns = @JoinColumn(name = "idSerie"),
            inverseJoinColumns = @JoinColumn(name = "idGenero")
    )
    private List<Genero> generos;

    //Relacion N.M con Lista_de_vistos
    @ManyToMany
    @JoinTable(
            name = "lista_serie",//Tabla intermedia
            joinColumns = @JoinColumn(name = "idSerie"),
            inverseJoinColumns = @JoinColumn(name = "idLista")
    )
    private List<Lista_de_vistos> listas_de_vistos;
    
    public Serie() {
    }

    public Serie(Integer idSerie, String titulo, Integer anio_lanzamiento, Integer num_temporadas, String imagen_url) {
        this.idSerie = idSerie;
        this.titulo = titulo;
        this.anio_lanzamiento = anio_lanzamiento;
        this.num_temporadas = num_temporadas;
        this.imagen_url = imagen_url;
    }

    public Integer getIdSerie() {
        return idSerie;
    }

    public void setIdSerie(Integer idSerie) {
        this.idSerie = idSerie;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public Integer getAnio_lanzamiento() {
        return anio_lanzamiento;
    }

    public void setAnio_lanzamiento(Integer anio_lanzamiento) {
        this.anio_lanzamiento = anio_lanzamiento;
    }

    public Integer getNum_temporadas() {
        return num_temporadas;
    }

    public void setNum_temporadas(Integer num_temporadas) {
        this.num_temporadas = num_temporadas;
    }

    public String getImagen_url() {
        return imagen_url;
    }

    public void setImagen_url(String imagen_url) {
        this.imagen_url = imagen_url;
    }

    public List<Temporada> getTemporadas() {
        return temporadas;
    }

    public void setTemporadas(List<Temporada> temporadas) {
        this.temporadas = temporadas;
    }

    public List<Actor> getActores() {
        return actores;
    }

    public void setActores(List<Actor> actores) {
        this.actores = actores;
    }

    public List<Genero> getGeneros() {
        return generos;
    }

    public void setGeneros(List<Genero> generos) {
        this.generos = generos;
    }

    public List<Lista_de_vistos> getListas_de_vistos() {
        return listas_de_vistos;
    }

    public void setListas_de_vistos(List<Lista_de_vistos> listas_de_vistos) {
        this.listas_de_vistos = listas_de_vistos;
    }
    
    @Override
    public int hashCode() {
        int hash = 7;
        hash = 97 * hash + Objects.hashCode(this.idSerie);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Serie other = (Serie) obj;
        return Objects.equals(this.idSerie, other.idSerie);
    }

    @Override
    public String toString() {
        return "Serie{" + "idSerie=" + idSerie + ", titulo=" + titulo + ", anio_lanzamiento=" + anio_lanzamiento + ", num_temporadas=" + num_temporadas + ", imagen_url=" + imagen_url + '}';
    }

}
