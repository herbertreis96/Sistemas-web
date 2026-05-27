<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<%@ page import="model.ProfessorDisciplina" %>
<%@ page import="dao.ProfessorDisciplinaDAO" %>

<%

    int professorId =
            Integer.parseInt(
                    request.getParameter("professorId")
            );

    int disciplinaId =
            Integer.parseInt(
                    request.getParameter("disciplinaId")
            );

    ProfessorDisciplina pd =
            new ProfessorDisciplina();

    pd.setProfessorId(professorId);

    pd.setDisciplinaId(disciplinaId);

    ProfessorDisciplinaDAO dao =
            new ProfessorDisciplinaDAO();

    dao.salvar(pd);

    response.sendRedirect(
            "relacionarProfessorDisciplina.jsp"
    );
%>
