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
@Table(name = "temporada")
public class Temporada implements Serializable {
     private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idTemporada")
    private Integer idTemporada;
    @Column(name = "numero_temporada")
    private Integer numero_temporada;
    @Column(name = "numero_episodios")
    private Integer numero_episodios;
    @Column(name = "fecha_lanzamiento")
    private Date fecha_lanzamiento;
    
    //Relacion 1.N con Episodio
    //mappedBy indica que entidad no tiene la foreign key, en este caso, temporada no tiene la clave, sino que la tiene episodio
    @OneToMany(mappedBy = "temporada")
    private List<Episodio> episodios;
    
    //Relacion N.1 con Serie
    @ManyToOne
    @JoinColumn (name = "idSerie")
    Serie serie;
    

    public Temporada() {
    }

    public Temporada(Integer idTemporada, Integer numero_temporada, Integer numero_episodios, Date fecha_lanzamiento, Serie serie) {
        this.idTemporada = idTemporada;
        this.numero_temporada = numero_temporada;
        this.numero_episodios = numero_episodios;
        this.fecha_lanzamiento = fecha_lanzamiento;
        this.serie = serie;
    }

    public Integer getIdTemporada() {
        return idTemporada;
    }

    public void setIdTemporada(Integer idTemporada) {
        this.idTemporada = idTemporada;
    }

    public Integer getNumero_temporada() {
        return numero_temporada;
    }

    public void setNumero_temporada(Integer numero_temporada) {
        this.numero_temporada = numero_temporada;
    }

    public Integer getNumero_episodios() {
        return numero_episodios;
    }

    public void setNumero_episodios(Integer numero_episodios) {
        this.numero_episodios = numero_episodios;
    }

    public Date getFecha_lanzamiento() {
        return fecha_lanzamiento;
    }

    public void setFecha_lanzamiento(Date fecha_lanzamiento) {
        this.fecha_lanzamiento = fecha_lanzamiento;
    }

    public List<Episodio> getEpisodios() {
        return episodios;
    }

    public void setEpisodios(List<Episodio> episodios) {
        this.episodios = episodios;
    }

    public Serie getSerie() {
        return serie;
    }

    public void setSerie(Serie serie) {
        this.serie = serie;
    }
    
    

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 67 * hash + Objects.hashCode(this.idTemporada);
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
        final Temporada other = (Temporada) obj;
        return Objects.equals(this.idTemporada, other.idTemporada);
    }

    @Override
    public String toString() {
        return "Temporada{" + "idTemporada=" + idTemporada + ", numero_temporada=" + numero_temporada + ", numero_episodios=" + numero_episodios + ", fecha_lanzamiento=" + fecha_lanzamiento + '}';
    }
    
    
}
