/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package appmultimediahibernate;

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
public class Serie implements Serializable{
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
    
    //Relacion 1.N con Lista_de_vistos
    //mappedBy indica que entidad no tiene la foreign key, en este caso, serie no tiene la clave, sino que la tiene lista_de_vistos
    @OneToMany(mappedBy = "serie")
    private List<Temporada> series;

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
