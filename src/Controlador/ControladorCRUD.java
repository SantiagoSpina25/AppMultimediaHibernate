/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.Actor;
import Modelo.Episodio;
import Modelo.Genero;
import Modelo.Lista_de_vistos;
import Modelo.Pelicula;
import Modelo.Serie;
import Modelo.Temporada;
import Modelo.Usuario;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Scanner;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;

/**
 *
 * @author Santiago Spina
 */
public class ControladorCRUD {

    public ControladorCRUD() {

    }

    //Este metodo obtiene todos los resultados (todos los campos) de una clase especificada.
    //Es un metodo generico <T> (devuelve un List)
    public static <T> List<T> obtenerTodos(Class<T> entidad, Session session) {
        List<T> resultados = null;

        try {

            Query<T> query = session.createQuery("FROM " + entidad.getName(), entidad);
            resultados = query.getResultList();

        } catch (HibernateException he) {
            System.out.println(he);
        }

        return resultados;
    }

    public static void insertarDato(Session session, Scanner sc) {
        try {
            //Convierto la fechas (string) a Date
            SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");

            System.out.println("¿En qué tabla deseas insertar un registro?");
            System.out.println("1. Actor");
            System.out.println("2. Episodio");
            System.out.println("3. Genero");
            System.out.println("4. Lista_de_vistos");
            System.out.println("5. Pelicula");
            System.out.println("6. Serie");
            System.out.println("7. Temporada");
            System.out.println("8. Usuario");

            int eleccionTabla = sc.nextInt();

            switch (eleccionTabla) {
                case 1: // Insertar un Actor
                    sc.nextLine();  // Limpiar el buffer de entrada
                    System.out.print("Introduce el nombre del actor: ");
                    String nombre = sc.nextLine();

                    System.out.print("Introduce la fecha de nacimiento: ");
                    String fecha_nacimiento = sc.next();
                    System.out.print("Introduce la nacionalidad: ");
                    String nacionalidad = sc.next();

                    // Crear una nueva instancia de la clase Actor
                    Actor nuevoActor = new Actor(null, nombre, formato.parse(fecha_nacimiento), nacionalidad);

                    session.save(nuevoActor);
                    System.out.println("Actor insertado correctamente.");
                    break;

                case 2: // Insertar un episodio
                    sc.nextLine();  // Limpiar el buffer de entrada
                    System.out.print("Introduce el titulo del episodio: ");
                    String titulo = sc.nextLine();

                    System.out.print("Introduce la duracion en minutos del episodio: ");
                    int duracion = sc.nextInt();

                    System.out.print("Introduce la fecha de lanzamiento: ");
                    String fecha_lanzamiento = sc.next();

                    System.out.print("Introduce el idTemporada: ");
                    int idTemporada = sc.nextInt();

                    // Obtener la temporada desde la base de datos
                    Temporada temporada = session.get(Temporada.class, idTemporada);

                    if (temporada != null) {
                        // Crear un nuevo episodio y asociarlo con la temporada
                        Episodio episodio = new Episodio(null, titulo, duracion, formato.parse(fecha_lanzamiento), temporada);

                        // Guardar el episodio en la base de datos
                        session.save(episodio);
                        System.out.println("Episodio insertado correctamente.");
                    } else {
                        System.out.println("No se encontró la temporada con ID: " + idTemporada);
                    }

                    break;

                case 3://Insertar genero
                    System.out.println("Introduce el id del genero: ");
                    int idGenero = sc.nextInt();

                    sc.nextLine();  // Limpiar el buffer de entrada
                    System.out.print("Introduce el nombre del genero: ");
                    String nombreGenero = sc.next();
                    sc.nextLine();
                    System.out.print("Introduce la descripcion del genero: ");
                    String descripcion = sc.nextLine();

                    Genero genero = new Genero(idGenero, nombreGenero, descripcion);
                    session.save(genero);

                    System.out.println("Genero insertado correctamente.");
                    break;

                case 4://insertar lista_de_vistos
                    sc.nextLine();
                    System.out.println("Introduce el titulo del contenido de la lista: ");
                    String tituloContenido = sc.nextLine();

                    System.out.println("Introduce el tipo de contenido (serie o pelicula)");
                    String tipoContenido = sc.next();

                    System.out.println("Introduce la fecha en la que fue agregado");
                    String fechaAgregado = sc.next();

                    sc.nextLine();
                    System.out.println("Introduce el estado del contenido (por ver, en progreso, visto)");
                    String estado = sc.nextLine();

                    System.out.println("Introduce id de usuario: ");
                    int idUsuario = sc.nextInt();

                    // Obtener el usuario desde la base de datos
                    Usuario usuario = session.get(Usuario.class, idUsuario);

                    if (usuario != null) {
                        // Crear un nuevo usuario y asociarlo con la lista
                        Lista_de_vistos lista_de_vistos = new Lista_de_vistos(null, tituloContenido, tipoContenido, formato.parse(fechaAgregado), estado, usuario);

                        // Guardar el episodio en la base de datos
                        session.save(lista_de_vistos);
                        System.out.println("Lista insertado correctamente.");
                    } else {
                        System.out.println("No se encontró un usuario con ID: " + idUsuario);
                    }

                    break;
                case 5://insertar una pelicula
                    sc.nextLine();
                    System.out.println("Introduce titulo de la pelicula: ");
                    String tituloPelicula = sc.nextLine();

                    System.out.println("Introduce año de lanzamiento: ");
                    int fechaLanzamientoPelicula = sc.nextInt();

                    System.out.println("Introduce duracion de la pelicula en minutos: ");
                    int duracionPelicula = sc.nextInt();

                    System.out.println("Introduce url imagen de la pelicula: ");
                    String urlImagenPelicula = sc.next();

                    Pelicula pelicula = new Pelicula(null, tituloPelicula, fechaLanzamientoPelicula, duracionPelicula, urlImagenPelicula);
                    session.save(pelicula);

                    System.out.println("Pelicula introducida correctamente");
                    break;
                case 6://insertar una serie
                    sc.nextLine();
                    System.out.println("Introduce titulo de la serie: ");
                    String tituloSerie = sc.nextLine();

                    System.out.println("Introduce año de lanzamiento: ");
                    int fechaLanzamientoSerie = sc.nextInt();

                    System.out.println("Introduce numero de temporadas: ");
                    int numTemporadas = sc.nextInt();

                    System.out.println("Introduce url imagen de la serie: ");
                    String urlImagenSerie = sc.next();

                    Serie serie = new Serie(null, tituloSerie, fechaLanzamientoSerie, numTemporadas, urlImagenSerie);
                    session.save(serie);

                    System.out.println("Serie introducida correctamente");
                    break;
                case 7://insertar una temporada
                    System.out.println("Introduce numero de la temporada: ");
                    int numTemporada = sc.nextInt();

                    System.out.println("Introduce numero de episodios: ");
                    int numEpisodios = sc.nextInt();

                    System.out.println("Introduce fecha de lanzamiento: ");
                    String fechaLanzamientoTemporada = sc.next();

                    System.out.println("Introduce id de la serie: ");
                    int idSerie = sc.nextInt();

                    // Obtener el usuario desde la base de datos
                    Serie serieTemporada = session.get(Serie.class, idSerie);

                    if (serieTemporada != null) {

                        Temporada nuevaTemporada = new Temporada(null, numTemporada, numEpisodios, formato.parse(fechaLanzamientoTemporada), serieTemporada);

                        // Guardar el episodio en la base de datos
                        session.save(nuevaTemporada);
                        System.out.println("Temporada insertada correctamente.");
                    } else {
                        System.out.println("No se encontró una serie con ID: " + idSerie);
                    }

                    break;
                case 8://insertar un usuario
                    System.out.println("Introduce nombre del usuario: ");
                    String nombreUsuario = sc.next();

                    System.out.println("Introduce correo del usuario: ");
                    String correoUsuario = sc.next();

                    System.out.println("Introduce contraseña del usuario: ");
                    String contraUsuario = sc.next();

                    System.out.println("Introduce tipo suscripcion (basica o premium): ");
                    String tipoSuscripcion = sc.next();

                    Usuario nuevoUsuario = new Usuario(null, nombreUsuario, correoUsuario, contraUsuario, tipoSuscripcion);
                    session.save(nuevoUsuario);

                    System.out.println("Usuario introducido correctamente");
                    break;

                default:
                    System.out.println("Opción no válida");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void actualizarDato(Session session, Scanner sc) {

        System.out.println("¿En qué tabla deseas actualizar un registro?");
        System.out.println("1. Actor");
        System.out.println("2. Episodio");
        System.out.println("3. Genero");
        System.out.println("4. Lista_de_vistos");
        System.out.println("5. Pelicula");
        System.out.println("6. Serie");
        System.out.println("7. Temporada");
        System.out.println("8. Usuario");

        int eleccionTabla = sc.nextInt();
    }

    public static void borrarDato(Session session, Scanner sc) {
        System.out.println("¿En qué tabla deseas borrar un registro?");
        System.out.println("1. Actor");
        System.out.println("2. Episodio");
        System.out.println("3. Genero");
        System.out.println("4. Lista_de_vistos");
        System.out.println("5. Pelicula");
        System.out.println("6. Serie");
        System.out.println("7. Temporada");
        System.out.println("8. Usuario");

        int eleccionTabla = sc.nextInt();

        switch (eleccionTabla) {
            case 1: // Borrar un Actor
                System.out.print("Ingrese el ID del actor que desea borrar: ");
                int idActor = sc.nextInt();

                //Busco al actor en la bd
                Actor actor = session.get(Actor.class, idActor);

                if (actor != null) {
                    session.delete(actor);
                    System.out.println("Actor eliminado correctamente.");
                } else {
                    System.out.println("Actor con ID " + idActor + " no encontrado.");
                }
                break;
            case 2: // Borrar un episodio
                System.out.print("Ingrese el ID del episodio que desea borrar: ");
                int idEpisodio = sc.nextInt();

                //Busco al episodio en la bd
                Episodio episodio = session.get(Episodio.class, idEpisodio);

                if (episodio != null) {
                    session.delete(episodio);
                    System.out.println("Episodio eliminado correctamente.");
                } else {
                    System.out.println("Episodio con ID " + idEpisodio + " no encontrado.");
                }
                break;

            case 3://Borrar genero
                System.out.print("Ingrese el ID del genero que desea borrar: ");
                int idGenero = sc.nextInt();

                //Busco al genero en la bd
                Genero genero = session.get(Genero.class, idGenero);

                if (genero != null) {
                    session.delete(genero);
                    System.out.println("Genero eliminado correctamente.");
                } else {
                    System.out.println("Genero con ID " + idGenero + " no encontrado.");
                }
                break;

            case 4://Borrar lista_de_vistos
                System.out.print("Ingrese el ID del lista_de_vistos que desea borrar: ");
                int idLista = sc.nextInt();

                //Busco la lista_de_vistos en la bd
                Lista_de_vistos lista_de_vistos = session.get(Lista_de_vistos.class, idLista);

                if (lista_de_vistos != null) {
                    session.delete(lista_de_vistos);
                    System.out.println("Lista_de_vistos eliminada correctamente.");
                } else {
                    System.out.println("Lista_de_vistos con ID " + idLista + " no encontrado.");
                }
                break;
            case 5://Borrar una pelicula
                System.out.print("Ingrese el ID de la pelicula que desea borrar: ");
                int idPelicula = sc.nextInt();

                //Busco la pelicula en la bd
                Pelicula pelicula = session.get(Pelicula.class, idPelicula);

                if (pelicula != null) {
                    session.delete(pelicula);
                    System.out.println("Pelicula eliminada correctamente.");
                } else {
                    System.out.println("Pelicula con ID " + idPelicula + " no encontrada.");
                }
                break;
            case 6://Borrar una serie
                System.out.print("Ingrese el ID de la serie que desea borrar: ");
                int idSerie = sc.nextInt();

                //Busco la serie en la bd
                Serie serie = session.get(Serie.class, idSerie);

                if (serie != null) {
                    session.delete(serie);
                    System.out.println("Serie eliminada correctamente.");
                } else {
                    System.out.println("Serie con ID " + idSerie + " no encontrada.");
                }
                break;
            case 7://Borrar una temporada
                System.out.print("Ingrese el ID de la temporada que desea borrar: ");
                int idTemporada = sc.nextInt();

                //Busco la temporada en la bd
                Temporada temporada = session.get(Temporada.class, idTemporada);

                if (temporada != null) {
                    session.delete(temporada);
                    System.out.println("Temporada eliminada correctamente.");
                } else {
                    System.out.println("Temporada con ID " + idTemporada + " no encontrada.");
                }
                break;
            case 8://Borrar un usuario
                System.out.print("Ingrese el ID del usuario que desea borrar: ");
                int idUsuario = sc.nextInt();

                //Busco el usuario en la bd
                Usuario usuario = session.get(Usuario.class, idUsuario);

                if (usuario != null) {
                    session.delete(usuario);
                    System.out.println("Usuario eliminado correctamente.");
                } else {
                    System.out.println("Usuario con ID " + idUsuario + " no encontrado.");
                }
                break;

            default:
                System.out.println("Opción no válida");
        }

    }
}