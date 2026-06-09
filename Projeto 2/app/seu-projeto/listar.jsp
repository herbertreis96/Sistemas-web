<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<%@ page import="java.util.List" %>
<%@ page import="model.Professor" %>
<%@ page import="dao.ProfessorDAO" %>

<html>

<head>

    <title>Lista Professores</title>

    <style>

        body{
            font-family: Arial;
            margin: 40px;
        }

        table{
            border-collapse: collapse;
            width: 100%;
        }

        th, td{
            border: 1px solid #ccc;
            padding: 10px;
        }

        th{
            background-color: #f2f2f2;
        }

        a{
            text-decoration: none;
        }

    </style>

</head>

<body>

<a href="index.jsp">
    Início
</a>

<hr>

<h1>Professores Cadastrados</h1>

<a href="cadastrarProfessor.jsp">
    Novo Professor
</a>

<br><br>

<table>

<tr>
    <th>ID</th>
    <th>Matrícula</th>
    <th>Nome</th>
    <th>Email</th>
    <th>Telefone</th>
</tr>

<%

    ProfessorDAO dao =
            new ProfessorDAO();

    List<Professor> lista =
            dao.listar();

    for(Professor p : lista){
%>

<tr>

    <td><%= p.getId() %></td>

    <td><%= p.getMatricula() %></td>

    <td><%= p.getNome() %></td>

    <td><%= p.getEmail() %></td>

    <td><%= p.getTelefone() %></td>

</tr>

<%
    }
%>

</table>

</body>

</html>