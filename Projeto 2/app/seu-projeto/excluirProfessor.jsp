<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="dao.ProfessorDAO" %>

<%
    int id =
            Integer.parseInt(
                    request.getParameter("id")
            );

    ProfessorDAO dao =
            new ProfessorDAO();

    dao.excluir(id);

    response.sendRedirect("listar.jsp");
%>