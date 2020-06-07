<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
  <style type="text/css">
     body {
        background-image: url('img/fondo.jpg');
        background-repeat: no-repeat;
        background-attachment: fixed
        }
  </style>
  <body> 
      <br>
        <div class="container">
            <h1><c:if test="${aviso.id == 0}">Nuevo</c:if>
                <c:if test="${aviso.id != 0}">Editar</c:if> aviso
                </h1>
                <form action="AvisoController" method="post">
                    <input type="hidden" name="id" value="${aviso.id}" />
                <div class="form-group">
                    <label>Descripcion:</label>
                    <input type="text" name="descripcion" value="${aviso.descripcion}" class="form-control" >
                </div>
                <div class="form-group">
                    <label>Stock</label>
                    <input type="number" name="stock" class="form-control" value="${aviso.stock}" >
                </div>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>
        <script type="text/javascript" src="js/jquery-3.3.1.slim.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
    </body>
</html>
