<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<%@ page import="model.Turma" %>
<%@ page import="dao.TurmaDAO" %>

<%

    String codigoTurma =
            request.getParameter("codigoTurma");

    int professorId =
            Integer.parseInt(
                    request.getParameter("professorId")
            );

    int disciplinaId =
            Integer.parseInt(
                    request.getParameter("disciplinaId")
            );

    String semestre =
            request.getParameter("semestre");

    int numeroAlunos =
            Integer.parseInt(
                    request.getParameter("numeroAlunos")
            );

    String horario =
            request.getParameter("horario");

    Turma turma =
            new Turma();

    turma.setCodigoTurma(codigoTurma);

    turma.setProfessorId(professorId);

    turma.setDisciplinaId(disciplinaId);

    turma.setSemestre(semestre);

    turma.setNumeroAlunos(numeroAlunos);

    turma.setHorario(horario);

    TurmaDAO dao =
            new TurmaDAO();

    dao.salvar(turma);

    response.sendRedirect(
            "cadastrarTurma.jsp"
    );
%>
