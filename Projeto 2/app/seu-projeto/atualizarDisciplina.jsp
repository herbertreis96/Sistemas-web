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

    String codigo =
            request.getParameter("codigo");

    String nome =
            request.getParameter("nome");

    int cargaHoraria =
            Integer.parseInt(
                    request.getParameter("cargaHoraria")
            );

    Disciplina disciplina =
            new Disciplina();

    disciplina.setId(id);
    disciplina.setCodigo(codigo);
    disciplina.setNome(nome);
    disciplina.setCargaHoraria(cargaHoraria);

    DisciplinaDAO dao =
            new DisciplinaDAO();

    dao.atualizar(disciplina);

    response.sendRedirect("listarDisciplinas.jsp");
%>
