<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<%@ page import="java.util.List" %>
<%@ page import="model.Disciplina" %>
<%@ page import="dao.DisciplinaDAO" %>

<html>

<head>

    <title>Lista Disciplinas</title>

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
            padding: 10px;
            border: 1px solid #ccc;
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

<h1>Disciplinas Cadastradas</h1>

<a href="cadastrarDisciplina.jsp">
    Nova Disciplina
</a>

<br><br>

<table>

<tr>
    <th>ID</th>
    <th>Código</th>
    <th>Nome</th>
    <th>Carga Horária</th>
    <th>Ações</th>
</tr>

<%

    DisciplinaDAO dao =
            new DisciplinaDAO();

    List<Disciplina> lista =
            dao.listar();

    for(Disciplina d : lista) {
%>

<tr>

    <td><%= d.getId() %></td>

    <td><%= d.getCodigo() %></td>

    <td><%= d.getNome() %></td>

    <td><%= d.getCargaHoraria() %></td>

    <td>

        <a href="editarDisciplina.jsp?id=<%= d.getId() %>">
            Editar
        </a>

        |

        <a href="excluirDisciplina.jsp?id=<%= d.getId() %>">
            Excluir
        </a>

    </td>

</tr>

<%
    }
%>

</table>

</body>
</html>