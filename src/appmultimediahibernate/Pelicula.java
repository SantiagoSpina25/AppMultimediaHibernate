
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package appmultimediahibernate;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

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

    public Pelicula() {
        
    }
    
    public Pelicula(String titulo, Integer anio_lanzamiento, Integer duracion, String url_imagen) {
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
        return "Pelicula{" + "idPelicula=" + idPelicula + '}';
    }

    

    
    
}