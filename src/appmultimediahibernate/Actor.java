/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package appmultimediahibernate;

import java.io.Serial;
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
import javax.persistence.Temporal;

/**
 *
 * @author Santiago Spina
 */
@Entity
@Table(name = "actor")

public class Actor implements Serializable{
     private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idActor")
    private Integer idActor;
    @Column(name = "nombre")
    private String nombre;
    @Column(name = "fecha_nacimiento")
    //@Temporal(javax.persistence.TemporalType.DATE)
    private Date fecha_nacimiento;
    @Column(name = "nacionalidad")
    private String nacionalidad;

    
    
    public Actor() {
    }
    
    public Actor(Integer idActor, String nombre, Date fecha_nacimiento, String nacionalidad) {
        this.idActor = idActor;
        this.nombre = nombre;
        this.fecha_nacimiento = fecha_nacimiento;
        this.nacionalidad = nacionalidad;
    }

    public Integer getIdActor() {
        return idActor;
    }

    public void setIdActor(Integer idActor) {
        this.idActor = idActor;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Date getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(Date fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 37 * hash + Objects.hashCode(this.idActor);
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
        final Actor other = (Actor) obj;
        return Objects.equals(this.idActor, other.idActor);
    }

    @Override
    public String toString() {
        return "Actor{" + "idActor=" + idActor + ", nombre=" + nombre + ", fecha_nacimiento=" + fecha_nacimiento + ", nacionalidad=" + nacionalidad + '}';
    }

    
}
