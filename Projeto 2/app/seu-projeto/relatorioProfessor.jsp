<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<%@ page import="java.util.List" %>

<%@ page import="model.Professor" %>
<%@ page import="model.RelatorioProfessor" %>

<%@ page import="dao.ProfessorDAO" %>
<%@ page import="dao.TurmaDAO" %>

<%

    ProfessorDAO professorDAO =
            new ProfessorDAO();

    List<Professor> professores =
            professorDAO.listar();
%>

<html>

<head>

    <title>Relatório Professor</title>

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

<h1>Relatório de Disciplinas Ministradas</h1>

<form method="get">

    Professor:

    <br><br>

    <select name="professorId">

        <%
            for(Professor p : professores) {
        %>

        <option value="<%= p.getId() %>">

            <%= p.getNome() %>

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

    String professorIdParam =
            request.getParameter("professorId");

    if(professorIdParam != null) {

        int professorId =
                Integer.parseInt(
                        professorIdParam
                );

        TurmaDAO turmaDAO =
                new TurmaDAO();

        List<RelatorioProfessor> lista =
                turmaDAO.relatorioProfessor(
                        professorId
                );
%>

<h2>Resultado</h2>

<table>

<tr>

    <th>Professor</th>

    <th>Disciplina</th>

    <th>Carga Total</th>

    <th>Total Alunos</th>

</tr>

<%

        for(RelatorioProfessor r : lista) {
%>

<tr>

    <td><%= r.getProfessor() %></td>

    <td><%= r.getDisciplina() %></td>

    <td><%= r.getCargaTotal() %></td>

    <td><%= r.getTotalAlunos() %></td>

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