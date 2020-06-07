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
    <body style="text-align: center">
        <div class="container">
            <br>
            <h1>PRODUCTOS</h1>
            <p style="text-align: left"><a href="AvisoController?action=add" class="btn btn-info">Nuevo Producto</a></p>
            <table class="table table-bordered table-striped ">
                <tr>
                    <th>Id</th>
                    <th>Descripcion</th>
                    <th>Stock</th>
                    <th></th>
                    <th></th>
                </tr>
                <c:forEach var="item" items="${productos}">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.descripcion}</td>
                        <td>${item.stock}</td>
                        <td><a href="AvisoController?action=edit&id=${item.id}" class="btn btn-primary">Editar</a></td>
                        <td><a href="AvisoController?action=delete&id=${item.id}" class="btn btn-danger"onclick="return(confirm('Esta seguro ???'))">Eliminar</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
      <footer>
      <p align="center"><i>Creado por <strong>Jhosmar Santy Algodon Ramos - Emergentes II - 2020</strong></i> </p><br>   
      </footer>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    </body>
</html>
