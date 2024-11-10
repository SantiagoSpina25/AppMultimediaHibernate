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
@Table(name = "usuario")
public class Usuario  implements Serializable{
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idUsuario")
    private Integer idUsuario;
    @Column(name = "nombre")
    private String nombre;
    @Column(name = "correo")
    private String correo;
    @Column(name = "contrasena")
    private String contrasena;
    @Column(name = "tipo_suscripcion")
    private String tipo_suscripcion;
    
    @OneToMany(mappedBy = "usuario")
    private List<Lista_de_vistos> listas_de_vistos;

    public Usuario() {
    }

    public Usuario(Integer idUsuario, String nombre, String correo, String contrasena, String tipo_suscripcion) {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.correo = correo;
        this.contrasena = contrasena;
        this.tipo_suscripcion = tipo_suscripcion;
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getTipo_suscripcion() {
        return tipo_suscripcion;
    }

    public void setTipo_suscripcion(String tipo_suscripcion) {
        this.tipo_suscripcion = tipo_suscripcion;
    }

    public List<Lista_de_vistos> getListas_de_vistos() {
        return listas_de_vistos;
    }

    public void setListas_de_vistos(List<Lista_de_vistos> listas_de_vistos) {
        this.listas_de_vistos = listas_de_vistos;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 23 * hash + Objects.hashCode(this.idUsuario);
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
        final Usuario other = (Usuario) obj;
        return Objects.equals(this.idUsuario, other.idUsuario);
    }

    @Override
    public String toString() {
        return "Usuario{" + "idUsuario=" + idUsuario + ", nombre=" + nombre + ", correo=" + correo + ", contrasena=" + contrasena + ", tipo_suscripcion=" + tipo_suscripcion + '}';
    }
    
    
    
}
