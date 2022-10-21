<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de alumnos inscriptos</title>
    </head>
    <body>
        <h1>Listado de alumnos</h1>
    <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pruebaenclase"
        ,"root", "");
        Statement s = conexion.createStatement();
        request.setCharacterEncoding("UTF-8");
        String insercion = "INSERT INTO formulario (apellido, nombre, curso, dni, sexo, email, telefono, fecha, edad, nacionalidad, domicilio, localidad,plan, nivel) VALUES ('"
            + request.getParameter("apellido")
            + "', '" + request.getParameter("nombre")
            + "', '" + request.getParameter("curso")
            + "', " + Integer.valueOf( request.getParameter("dni"))
            + ", '" + request.getParameter("sexo")
            + "', '" + request.getParameter("email")
            + "', '" + request.getParameter("telefono")
            + "', '" + request.getParameter("fecha")
            + "', " + Integer.valueOf(request.getParameter("edad"))
            + ", '" + request.getParameter("nacionalidad")
            + "', '" + request.getParameter("domicilio")
            + "', '" + request.getParameter("localidad")
            + "', '" + request.getParameter("plan")
            + "', '" + request.getParameter("nivel")
            + "')";
        s.execute(insercion);
        conexion.close();
    %>
    Alumno dado de alta.

    </body>
</html>