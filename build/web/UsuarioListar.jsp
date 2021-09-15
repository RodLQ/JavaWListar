<%-- 
    Document   : UsuarioListar
    Created on : 14-sep-2021, 12:15:45
    Author     : Rodrigo
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        
    </head>
    <body>
        <div class="" >
            <br>
            <div class="row text-center">
                <div class="col-12 col-xl-2 " >
                </div>
                <div class="col-12 col-xl-8 border rounded p-5" >
                    <h3 class="text-dark border border-dark rounded p-2" >Lista de Usuarios</h3>
                    <% List lis = (List) session.getAttribute("lis"); %>
                    <div class="table-responsive" >
                        <table class="table table-striped">
                            <thead>
                              <tr>
                                <th scope="col">ItemAi</th>
                                <th scope="col">idUsuario</th>
                                <th scope="col">CodUsuario</th>
                                <th scope="col">Usuario</th>
                                <th scope="col">Password</th>
                                <th scope="col">Nombres</th>                        
                                <th scope="col">Apellidos</th>
                                <th scope="col">Email</th>
                                <th scope="col">Permisos</th>
                                <th scope="col">Estado</th>
                                <th scope="col">Enlinea</th>
                                <th scope="col">Num_Ingresos</th>
                                <th scope="col">Fec_Creacion</th>
                                <th scope="col">Fec_Modificacion</th>
                                <th scope="col">Fec_Eliminacion</th>
                                <th scope="col">Fec_UltimoAcceso</th>
                                <th scope="col">Creado_Por</th>
                                <th scope="col">Modificado_Por</th>
                                <th scope="col">Eliminado_Por</th>
                                <th scope="col">Hora_Creacion</th>
                                <th scope="col">Hora_Modificacion</th>
                                <th scope="col">Hora_Eliminacion</th>
                                <th scope="col">Hora_UltimoAcceso</th>
                              </tr>
                            </thead>
                            <tbody>
                                <% for (int i = 1; i < lis.size(); i++) { %>
                                <% Object[] f = (Object[]) lis.get(i);%>
                                    <tr>
                                        <% for (int x = 0; x < 23; x++) { %>
                                            <td><%= f[x]%></td>
                                        <% }%>
                                    </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                    <form action="UsuarioControl" method="post">
                        <input class="btn btn-outline-success" type="submit" value="listar" name="acc" />
                    </form>
                </div>
                <div class="col-12 col-xl-2 " >
                </div>                
            </div>
            <br>
        </div>
        
    </body>
</html>
