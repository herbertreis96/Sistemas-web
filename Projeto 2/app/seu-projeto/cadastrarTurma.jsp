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

    <title>Cadastrar Turma</title>

    <style>

        body{
            font-family: Arial;
            margin: 40px;
        }

        input, select{
            padding: 8px;
            width: 300px;
        }

        button{
            padding: 10px;
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

<h1>Cadastro de Turma</h1>

<form action="salvarTurma.jsp" method="post">

    Código da Turma:

    <br><br>

    <input type="text"
           name="codigoTurma">

    <br><br>

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

    <br><br>

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

    <br><br>

    Semestre:

    <br><br>

    <input type="text"
           name="semestre">

    <br><br>

    Número de Alunos:

    <br><br>

    <input type="number"
           name="numeroAlunos">

    <br><br>

    Horário:

    <br><br>

    <select name="horario">

        <option value="manha">
            Manhã
        </option>

        <option value="tarde">
            Tarde
        </option>

        <option value="noite">
            Noite
        </option>

    </select>

    <br><br>

    <button type="submit">
        Salvar Turma
    </button>

</form>

</body>
</html>