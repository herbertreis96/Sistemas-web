<%@ page import="dao.DisciplinaDAO" %>

<%

    int id =
            Integer.parseInt(
                    request.getParameter("id")
            );

    DisciplinaDAO dao =
            new DisciplinaDAO();

    dao.excluir(id);

    response.sendRedirect("listarDisciplinas.jsp");
%>
