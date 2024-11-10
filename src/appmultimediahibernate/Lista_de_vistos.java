/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package appmultimediahibernate;

import java.io.Serializable;
import java.util.Date;
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
 * @author Santiago Spina
 */
@Entity
@Table(name = "lista_de_vistos")
public class Lista_de_vistos implements Serializable{
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idLista")
    private Integer idLista;
    @Column(name = "titulo")
    private String titulo;
    @Column(name = "tipo_contenido")
    private String tipo_contenido;
    @Column(name = "fecha_agregado")
    private Date fecha_agregado;
    @Column(name = "estado")
    private String estado;

    public Lista_de_vistos() {
    }

    public Lista_de_vistos(Integer idLista, String titulo, String tipo_contenido, Date fecha_agregado, String estado) {
        this.idLista = idLista;
        this.titulo = titulo;
        this.tipo_contenido = tipo_contenido;
        this.fecha_agregado = fecha_agregado;
        this.estado = estado;
    }

    public Integer getIdLista() {
        return idLista;
    }

    public void setIdLista(Integer idLista) {
        this.idLista = idLista;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getTipo_contenido() {
        return tipo_contenido;
    }

    public void setTipo_contenido(String tipo_contenido) {
        this.tipo_contenido = tipo_contenido;
    }

    public Date getFecha_agregado() {
        return fecha_agregado;
    }

    public void setFecha_agregado(Date fecha_agregado) {
        this.fecha_agregado = fecha_agregado;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 41 * hash + Objects.hashCode(this.idLista);
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
        final Lista_de_vistos other = (Lista_de_vistos) obj;
        return Objects.equals(this.idLista, other.idLista);
    }

    @Override
    public String toString() {
        return "Lista_de_vistos{" + "idLista=" + idLista + ", titulo=" + titulo + ", tipo_contenido=" + tipo_contenido + ", fecha_agregado=" + fecha_agregado + ", estado=" + estado + '}';
    }
    
    
    
}
