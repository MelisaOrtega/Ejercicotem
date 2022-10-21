<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Formulario2</h1>
        <ul>
            <%
                Class.forName("com.mysql.jdbc.Driver");
                String insert = "INSERT INTO formulario(apellido, nombre,dni) VALUES (?,?,0)";
                String select = "select * from formulario";
                Connection conexion = null;
                PreparedStatement consultaPreparada = null;
                int fila = 999;
                try {
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pruebaenclase", "root", "");
                    consultaPreparada = conexion.prepareStatement(insert);
                    consultaPreparada.setString(1, request.getParameter("apellido"));
                    consultaPreparada.setString(2, request.getParameter("nombre"));
                    
                    fila = consultaPreparada.executeUpdate();
                    out.print("<a href='Formulario2.jsp'>Postulante cargado existosamente</a>");                   

                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("exepcion </br>");
                    out.println("detalle de la consulta: </br>");
                    out.println(consultaPreparada + "</br>");
                    out.println("parametro apellido: " + request.getParameter("apellido"));
                    out.println("parametro nombre: " + request.getParameter("nombre"));
                    out.println("parametro fila: " + fila);
                } finally {
                    try {
                        consultaPreparada.close();
                        conexion.close();
                    } catch (Exception e) {
                    }
                } 
           %>
        </ul>
    </body>
</html>