<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");
%>

<%@ page import="model.Professor" %>
<%@ page import="dao.ProfessorDAO" %>

<%
    String matricula =
            request.getParameter("matricula");

    String nome =
            request.getParameter("nome");

    String email =
            request.getParameter("email");

    String telefone =
            request.getParameter("telefone");

    Professor professor =
            new Professor();

    professor.setMatricula(matricula);
    professor.setNome(nome);
    professor.setEmail(email);
    professor.setTelefone(telefone);

    ProfessorDAO dao =
            new ProfessorDAO();

    dao.salvar(professor);

    response.sendRedirect("listar.jsp");
%>