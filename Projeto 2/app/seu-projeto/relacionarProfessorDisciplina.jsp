<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<%@ page import="java.util.List" %>

<%@ page import="model.Professor" %>
<%@ page import="model.Disciplina" %>

<%@ page import="dao.ProfessorDAO" %>
<%@ page import="dao.DisciplinaDAO" %>

<%

    ProfessorDAO professorDAO =
            new ProfessorDAO();

    DisciplinaDAO disciplinaDAO =
            new DisciplinaDAO();

    List<Professor> professores =
            professorDAO.listar();

    List<Disciplina> disciplinas =
            disciplinaDAO.listar();
%>

<html>

<head>
    <title>Relacionar Professor e Disciplina</title>
</head>

<body>

<h1>Professor Apto a Ministrar Disciplina</h1>

<form action="salvarRelacao.jsp" method="post">

    Professor:

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

    <br><br>

    Disciplina:

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

    <br><br>

    <button type="submit">
        Salvar Relação
    </button>

</form>

</body>
</html>
