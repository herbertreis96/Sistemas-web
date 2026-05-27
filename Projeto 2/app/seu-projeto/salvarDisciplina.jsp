<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<%@ page import="model.Disciplina" %>
<%@ page import="dao.DisciplinaDAO" %>

<%

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

    disciplina.setCodigo(codigo);
    disciplina.setNome(nome);
    disciplina.setCargaHoraria(cargaHoraria);

    DisciplinaDAO dao =
            new DisciplinaDAO();

    dao.salvar(disciplina);

    response.sendRedirect("listarDisciplinas.jsp");
%>