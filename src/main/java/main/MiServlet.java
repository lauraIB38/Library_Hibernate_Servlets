package main;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojos.Libro;
import pojos.Prestamo;
import pojos.Socio;

/**
 * Servlet implementation class MiServlet
 */

public class MiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private static ProyectoDAO proyectoDAO= new ProyectoDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MiServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		switch (request.getParameter("tipoMenuC")){
		case "1": {
			List <Libro> listaLibros = proyectoDAO.listaLibros();
			request.setAttribute("listaLibros", listaLibros);
			request.setAttribute("tipoMenuS", "libros");
			request.setAttribute("encabezado", "Libros");
			getServletContext().getRequestDispatcher("/Index.jsp").forward(request, response);
			break;
			
		}
		case "2":{
			List <Socio> listaSocios = proyectoDAO.listaSocios(); //meter los socios en una lista
			request.setAttribute("listaSocios", listaSocios);//cargar la lista en un atributo
			request.setAttribute("tipoMenuS", "socios"); //el tipo de menu es de socios
			request.setAttribute("encabezado", "Socios");//cargar el encabezado
			getServletContext().getRequestDispatcher("/Index.jsp").forward(request, response);
			break;
		}
		case "3":{
			List<Prestamo> listaPrestamos = proyectoDAO.librosPrestadosActualmente();
			request.setAttribute("listaPrestamos", listaPrestamos);
			request.setAttribute("tipoMenuS", "prestamos");
			request.setAttribute("encabezado", "Prestamos");
			getServletContext().getRequestDispatcher("/Index.jsp").forward(request, response);
			break;
		}
		
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
