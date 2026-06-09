<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<html>

<head>

    <title>Cadastrar Professor</title>

    <style>

        body{
            font-family: Arial;
            margin: 40px;
        }

        input{
            width: 300px;
            padding: 8px;
        }

        input[type=submit]{
            width: 150px;
        }

    </style>

</head>

<body>

<a href="index.jsp">
    Início
</a>

<hr>

<h1>Cadastrar Professor</h1>

<form action="salvarProfessor.jsp" method="post">

    Matrícula:
    <br>
    <input
        type="text"
        name="matricula"
        required>
    <br><br>

    Nome:
    <br>
    <input
        type="text"
        name="nome"
        required>
    <br><br>

    Email:
    <br>
    <input
        type="email"
        name="email">
    <br><br>

    Telefone:
    <br>
    <input
        type="text"
        name="telefone">
    <br><br>

    <input
        type="submit"
        value="Salvar">

</form>

</body>

</html>