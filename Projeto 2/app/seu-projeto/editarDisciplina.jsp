<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<%@ page import="model.Disciplina" %>
<%@ page import="dao.DisciplinaDAO" %>

<%

    int id =
            Integer.parseInt(
                    request.getParameter("id")
            );

    DisciplinaDAO dao =
            new DisciplinaDAO();

    Disciplina disciplina =
            dao.buscarPorId(id);
%>

<html>

<head>
    <title>Editar Disciplina</title>
</head>

<body>

<h1>Editar Disciplina</h1>

<form action="atualizarDisciplina.jsp" method="post">

    <input type="hidden"
           name="id"
           value="<%= disciplina.getId() %>">

    Código:
    <input type="text"
           name="codigo"
           value="<%= disciplina.getCodigo() %>">

    <br><br>

    Nome:
    <input type="text"
           name="nome"
           value="<%= disciplina.getNome() %>">

    <br><br>

    Carga Horária:
    <input type="number"
           name="cargaHoraria"
           value="<%= disciplina.getCargaHoraria() %>">

    <br><br>

    <button type="submit">
        Atualizar
    </button>

</form>

</body>
</html>
