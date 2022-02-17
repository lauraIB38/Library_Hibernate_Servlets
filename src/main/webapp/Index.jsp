<%@page import="pojos.Prestamo"%>
<%@page import="pojos.Socio"%>
<%@page import="pojos.Libro"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
table, th, td {
  border: 1px solid;
  padding: 15px;
}
</style>
<script>
	function cambiarPagina(cod) {
		document.getElementById("tipoMenuC").value = cod;
		document.getElementById("formulario1").submit();
	}
</script>
</head>
<body>
	<%
	String encabezado = "BIBLIOTECA";
	String tipoMenuS = "";
	if(request.getAttribute("tipoMenuS") != null)
		tipoMenuS = (String)request.getAttribute("tipoMenuS");
	if (request.getAttribute("encabezado") != null) 
		encabezado = (String) request.getAttribute("encabezado");
	
	%>
	<h1>
		<%
		out.print(encabezado);
		%>
	</h1>
	
	<form action="MiServlet" method="GET" id="formulario1">
		<select id=selectMenu onchange="cambiarPagina(this.value)">
			<option value=0></option>
			<option value=1 <%= tipoMenuS.equals("libros")?"selected":"" %>>Libros</option>
			<option value=2 <%= tipoMenuS.equals("socios")?"selected":"" %>>Socios</option>
			<option value=3 <%= tipoMenuS.equals("prestamos")?"selected":"" %>>Prestamos</option>
			<option value=4 <%= tipoMenuS.equals("consultas")?"selected":"" %>>Consultas</option>s
		</select> <input type="hidden" name="tipoMenuC" id="tipoMenuC">
		<br><br>
		<%
		if (tipoMenuS.equals("libros")) {
			out.println("<table>");
			List<Libro> listaLibros = (List<Libro>) request.getAttribute("listaLibros");
			out.println("<tr><th>Titulo</th><th>Editorial</th><th>Num Ejemplares</th><th>Paginas</th><th>Edicion</th></tr>");
			if (listaLibros != null) {
				for(Libro l : listaLibros)  {
					try {
						out.println("<tr><td>" + l.getTitulo() + "</td><td>" + l.getEditorial() + "</td><td>"
								+ l.getNumEjemplares() + "</td><td>" + l.getNumPaginas() + "</td><td>" + l.getAnioEdicion() + "</td><td><input type=\"button\" value = \"Modificar\"></td><td><input type=\"button\" value = \"Eliminar\"></td></tr>" );
					} catch (Exception e) {
		
					}
				}
			}
			out.println("</table>");
		}
		if (tipoMenuS.equals("socios")) {
			out.println("<table>");
			
			List<Socio> listaSocios = (List<Socio>) request.getAttribute("listaSocios");
			out.println("<tr><th>Nombre</th><th>Apellido</th><th>Edad</th><th>Dirección</th><th>Teléfono</th></tr>");
			if (listaSocios != null) {
				for(Socio s : listaSocios)  {
					try {
						out.println("<tr><td>" + s.getNombre() + "</td><td>" + s.getApellidos() + "</td><td>"
								+ s.getEdad() + "</td><td>" + s.getDireccion() + "</td><td>" +s.getTelefono() + "</td><td><input type=\"button\" value = \"Modificar\"></td><td><input type=\"button\" value = \"Eliminar\"></td></tr>" );
					} catch (Exception e) {
		
					}
				}
			}
			out.println("</table>");
		}
		if (tipoMenuS.equals("prestamos")) {
			out.println("<table>");
			
			List<Prestamo> listaPrestamos = (List<Prestamo>) request.getAttribute("listaPrestamos");
			out.println("<tr><th>Libro</th><th>Socio</th><th>Fecha Inicio</th><th>Fecha Fin</th></tr>");
			if (listaPrestamos != null) {
				for(Prestamo p : listaPrestamos)  {
					try {
						out.println("<tr><td>" + p.getLibro().getTitulo() + "</td><td>" + p.getSocio().getNombre() + " " + p.getSocio().getApellidos() + "</td><td>"
								+ p.getFechaInicio() + "</td><td>" + p.getFechaFin() + "</td></tr>" );
					} catch (Exception e) {
		
					}
				}
			}
			out.println("</table>");
		}
		
		%>
	</form>


</body>
</html>