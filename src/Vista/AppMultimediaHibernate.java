
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Vista;

import Controlador.ControladorCRUD;
import Modelo.*;
import java.util.List;
import java.util.Scanner;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Usuario
 */
public class AppMultimediaHibernate {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        
        try {
            // Abrir la sesión de Hibernate
            SessionFactory instancia = (SessionFactory) new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
            Session session = instancia.openSession();
            System.out.println("Base de datos conectada correctamente");

            int eleccion;

            do {
                session.beginTransaction();
                System.out.println("Que desea realizar?");
                System.out.println("1. SELECT");
                System.out.println("2. INSERT");
                System.out.println("3. UPDATE");
                System.out.println("4. DELETE");
                System.out.println("5. SALIR");

                eleccion = sc.nextInt();
                System.out.println("------------------------------------------");
                switch (eleccion) {
                    case 1://SELECT
                        List<?> resultados = null;
                        resultados = ControladorCRUD.obtenerTodos(Actor.class, session);

                        for (int i = 0; i < resultados.size(); i++) {
                            System.out.println(resultados.get(i));
                        }

                        break;
                    case 2://INSERT
                        ControladorCRUD.insertarDato(session, sc);
                        break;
                    case 3://UPDATE
                        ControladorCRUD.actualizarDato(session,sc);
                        break;
                    case 4://DELETE
                        ControladorCRUD.borrarDato(session,sc);
                        break;
                    case 5://salir
                        System.out.println("Saliendo...");
                        //session.close();
                        break;
                    case 6:
                        System.out.println("Indica un numero correcto");
                        break;
                }
                session.getTransaction().commit();
                System.out.println("------------------------------------------");
            } while (eleccion != 5);

        } catch (HibernateException e) {
            System.out.println(e);
        }

    }

}
