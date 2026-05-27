<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<%@ page import="java.util.List" %>

<%@ page import="model.Disciplina" %>
<%@ page import="model.Professor" %>

<%@ page import="dao.DisciplinaDAO" %>
<%@ page import="dao.ProfessorDAO" %>

<%

    DisciplinaDAO disciplinaDAO =
            new DisciplinaDAO();

    List<Disciplina> disciplinas =
            disciplinaDAO.listar();
%>

<html>

<head>

    <title>Consulta Professores</title>

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

        select, button{
            padding: 8px;
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

<h1>Professores Aptos por Disciplina</h1>

<form method="get">

    Disciplina:

    <br><br>

    <select name="disciplinaId">

        <%
            for(Disciplina d : disciplinas) {
        %>

        <option value="<%= d.getId() %>">

            <%= d.getNome() %>

        </option>

        <%
            }
        %>

    </select>

    <button type="submit">
        Buscar
    </button>

</form>

<hr>

<%

    String disciplinaIdParam =
            request.getParameter("disciplinaId");

    if(disciplinaIdParam != null) {

        int disciplinaId =
                Integer.parseInt(
                        disciplinaIdParam
                );

        ProfessorDAO professorDAO =
                new ProfessorDAO();

        List<Professor> professores =
                professorDAO.buscarPorDisciplina(
                        disciplinaId
                );
%>

<h2>Professores Encontrados</h2>

<table>

<tr>
    <th>Nome</th>
    <th>Email</th>
    <th>Telefone</th>
</tr>

<%

        for(Professor p : professores) {
%>

<tr>

    <td><%= p.getNome() %></td>

    <td><%= p.getEmail() %></td>

    <td><%= p.getTelefone() %></td>

</tr>

<%
        }
%>

</table>

<%
    }
%>

</body>
</html>