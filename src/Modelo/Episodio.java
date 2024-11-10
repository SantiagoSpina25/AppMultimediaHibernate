/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;
import javax.persistence.*;

/**
 *
 * @author Santiago Spina
 */
@Entity
@Table(name = "episodio")
public class Episodio implements Serializable{
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idEpisodio")
    private Integer idEpisodio;
    @Column(name = "titulo")
    private String titulo;
    @Column(name = "duracion")
    private Integer duracion;
    @Column(name = "fecha_lanzamiento")
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date fecha_lanzamiento;
    
    //Relacion N.1 con Temporada
    @ManyToOne
    @JoinColumn (name = "idTemporada")
    Temporada temporada;
    

    public Episodio() {
    }

    public Episodio(Integer idEpisodio, String titulo, Integer duracion, Date fecha_lanzamiento, Temporada temporada) {
        this.idEpisodio = idEpisodio;
        this.titulo = titulo;
        this.duracion = duracion;
        this.fecha_lanzamiento = fecha_lanzamiento;
        this.temporada = temporada;
    }

    public Integer getIdEpisodio() {
        return idEpisodio;
    }

    public void setIdEpisodio(Integer idEpisodio) {
        this.idEpisodio = idEpisodio;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public Integer getDuracion() {
        return duracion;
    }

    public void setDuracion(Integer duracion) {
        this.duracion = duracion;
    }

    public Date getFecha_lanzamiento() {
        return fecha_lanzamiento;
    }

    public void setFecha_lanzamiento(Date fecha_lanzamiento) {
        this.fecha_lanzamiento = fecha_lanzamiento;
    }

    public Temporada getTemporada() {
        return temporada;
    }

    public void setTemporada(Temporada temporada) {
        this.temporada = temporada;
    }
    
    

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 37 * hash + Objects.hashCode(this.idEpisodio);
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
        final Episodio other = (Episodio) obj;
        return Objects.equals(this.idEpisodio, other.idEpisodio);
    }

    @Override
    public String toString() {
        return "Episodio{" + "idEpisodio=" + idEpisodio + ", titulo=" + titulo + ", duracion=" + duracion + ", fecha_lanzamiento=" + fecha_lanzamiento + '}';
    }
    
    
    
}
