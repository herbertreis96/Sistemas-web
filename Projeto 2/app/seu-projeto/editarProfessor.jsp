<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="model.Professor" %>
<%@ page import="dao.ProfessorDAO" %>

<%
    int id =
            Integer.parseInt(
                    request.getParameter("id")
            );

    ProfessorDAO dao =
            new ProfessorDAO();

    Professor professor =
            dao.buscarPorId(id);
%>

<html>

<head>
    <title>Editar Professor</title>
</head>

<body>

<h1>Editar Professor</h1>

<form action="atualizarProfessor.jsp" method="post">

    <input type="hidden"
           name="id"
           value="<%= professor.getId() %>">

    Matrícula:
    <br>

    <input type="text"
           name="matricula"
           value="<%= professor.getMatricula() %>">

    <br><br>

    Nome:
    <br>

    <input type="text"
           name="nome"
           value="<%= professor.getNome() %>">

    <br><br>

    Email:
    <br>

    <input type="text"
           name="email"
           value="<%= professor.getEmail() %>">

    <br><br>

    Telefone:
    <br>

    <input type="text"
           name="telefone"
           value="<%= professor.getTelefone() %>">

    <br><br>

    <button type="submit">
        Atualizar
    </button>

</form>

<br>

<a href="listar.jsp">
    Voltar
</a>

</body>
</html>
