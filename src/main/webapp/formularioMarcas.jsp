<%-- 
    Document   : formularioMarcas
    Created on : 3 jul 2020, 7:56:25
    Author     : Bauch
--%>
<%@page import="Data.*"%>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String title = "Editar Marca", ref = "editarMarca.jsp";
    if (request.getParameter("id") == null) {
        title = "Insetar Marca";
        ref = "insertarMarca.jsp";
    }
    MarcasDB marca = new MarcasDB();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%out.print(title);%></title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body style="background: #191927">
        <h1 class="text-center" style="background: #191927"><font color="FFFFFF"><%out.print(title);%></font></h1>
        <div class="container">
            <form action="<%out.print(ref);%>" method="GET">
                <div class="col">
                    <%if (request.getParameter("id") == null) {%>
                    <input type="text" class="form-control" placeholder="Nuevo Marca" name="name" id="name" required>
                    <%} else {
                        for (int i = 0; i < marca.listadoMarcas().size(); i++) {
                            if (marca.listadoMarcas().get(i).getID() == Integer.parseInt(request.getParameter("id"))) {%>
                    <input type="text" class="form-control" value="<%out.print(marca.listadoMarcas().get(i).getNombre());%>" name="name" id="name" required>
                    <%}
                                    }
                                }%> 
                </div>
                <div class="form-row">
                    <div class="col">
                        <br>
                        <input type="hidden" value="<%out.print(request.getParameter("id"));%>" name="id" id="id">
                        <input type="submit" class="btn btn-outline-success btn-block" value="Enviar"/>
                    </div>
                    <div class="col">
                        <br>
                        <a class="btn btn-outline-primary btn-block" href="catalogoMarca.jsp">Regresar</a>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
