<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");
%>

<%@ page import="model.Professor" %>
<%@ page import="dao.ProfessorDAO" %>

<%
    int id =
            Integer.parseInt(
                    request.getParameter("id")
            );

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

    professor.setId(id);
    professor.setMatricula(matricula);
    professor.setNome(nome);
    professor.setEmail(email);
    professor.setTelefone(telefone);

    ProfessorDAO dao =
            new ProfessorDAO();

    dao.atualizar(professor);

    response.sendRedirect("listar.jsp");
%>
