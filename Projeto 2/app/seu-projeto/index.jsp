<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>

<head>

    <title>Sistema Universidade</title>

    <style>

        body{
            font-family: Arial;
            margin: 40px;
        }

        h1{
            color: #333;
        }

        ul{
            list-style: none;
            padding: 0;
        }

        li{
            margin-bottom: 10px;
        }

        a{
            text-decoration: none;
            font-size: 18px;
        }

        hr{
            margin-top: 20px;
            margin-bottom: 20px;
        }

    </style>

</head>

<body>

<h1>Sistema Universidade</h1>

<hr>

<h2>Professores</h2>

<ul>

    <li>
        <a href="cadastrarProfessor.jsp">
            Cadastrar Professor
        </a>
    </li>

    <li>
        <a href="listar.jsp">
            Listar Professores
        </a>
    </li>

</ul>

<hr>

<h2>Disciplinas</h2>

<ul>

    <li>
        <a href="cadastrarDisciplina.jsp">
            Cadastrar Disciplina
        </a>
    </li>

    <li>
        <a href="listarDisciplinas.jsp">
            Listar Disciplinas
        </a>
    </li>

</ul>

<hr>

<h2>Turmas</h2>

<ul>

    <li>
        <a href="cadastrarTurma.jsp">
            Cadastrar Turma
        </a>
    </li>

</ul>

<hr>

<h2>Consultas</h2>

<ul>

    <li>
        <a href="consultaProfessores.jsp">
            Professores Aptos por Disciplina
        </a>
    </li>

    <li>
        <a href="relatorioProfessor.jsp">
            Relatório Professor
        </a>
    </li>

</ul>

</body>
</html>