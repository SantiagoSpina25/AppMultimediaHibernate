
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;
import javax.persistence.*;

/**
 *
 * @author Santiago spina
 */
@Entity
@Table(name = "pelicula")

public class Pelicula implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idPelicula")
    private Integer idPelicula;
    @Column(name = "titulo")
    private String titulo;
    @Column(name = "anio_lanzamiento")
    private Integer anio_lanzamiento;
    @Column(name = "duracion")
    private Integer duracion;
    @Column(name = "url_imagen")
    private String url_imagen;
    
    //Relacion N.M con Lista_de_vistos
    @ManyToMany
    @JoinTable(
            name = "lista_pelicula",//Tabla intermedia
            joinColumns = @JoinColumn(name = "idPelicula"),
            inverseJoinColumns = @JoinColumn(name = "idLista")
    )
    private List<Lista_de_vistos> listas_de_vistos;
    
    //Relacion N.M con Actor
    @ManyToMany
    @JoinTable(
            name = "pelicula_actor",//Tabla intermedia
            joinColumns = @JoinColumn(name = "idPelicula"),
            inverseJoinColumns = @JoinColumn(name = "idActor")
    )
    private List<Actor> actores;
    
    //Relacion N.M con Genero
    @ManyToMany
    @JoinTable(
            name = "pelicula_genero",//Tabla intermedia
            joinColumns = @JoinColumn(name = "idPelicula"),
            inverseJoinColumns = @JoinColumn(name = "idGenero")
    )
    private List<Genero> generos;
    

    public Pelicula() {
        
    }
    
    public Pelicula(Integer idPelicula, String titulo, Integer anio_lanzamiento, Integer duracion, String url_imagen) {
        this.idPelicula = idPelicula;
        this.titulo = titulo;
        this.anio_lanzamiento = anio_lanzamiento;
        this.duracion = duracion;
        this.url_imagen = url_imagen;
    }

    
    
    public Integer getIdPelicula() {
        return idPelicula;
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

    public Integer getDuracion() {
        return duracion;
    }

    public void setDuracion(Integer duracion) {
        this.duracion = duracion;
    }

    public String getUrl_imagen() {
        return url_imagen;
    }

    public void setUrl_imagen(String url_imagen) {
        this.url_imagen = url_imagen;
    }

    public List<Lista_de_vistos> getListas_de_vistos() {
        return listas_de_vistos;
    }

    public void setListas_de_vistos(List<Lista_de_vistos> listas_de_vistos) {
        this.listas_de_vistos = listas_de_vistos;
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

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 43 * hash + Objects.hashCode(this.idPelicula);
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
        final Pelicula other = (Pelicula) obj;
        return Objects.equals(this.idPelicula, other.idPelicula);
    }

    @Override
    public String toString() {
        return "Pelicula{" + "idPelicula=" + idPelicula + ", titulo=" + titulo + ", anio_lanzamiento=" + anio_lanzamiento + ", duracion=" + duracion + ", url_imagen=" + url_imagen + '}';
    }

    

    

    
    
}