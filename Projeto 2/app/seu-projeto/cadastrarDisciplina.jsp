<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>

<head>

    <title>Cadastrar Disciplina</title>

    <style>

        body{
            font-family: Arial;
            margin: 40px;
        }

        input{
            padding: 8px;
            width: 300px;
        }

        button{
            padding: 10px;
        }

        a{
            text-decoration: none;
        }

    </style>

</head>

<body>

<a href="index.jsp">
    Início
</a>

<hr>

<h1>Nova Disciplina</h1>

<form action="salvarDisciplina.jsp" method="post">

    Código:

    <br><br>

    <input type="text" name="codigo">

    <br><br>

    Nome:

    <br><br>

    <input type="text" name="nome">

    <br><br>

    Carga Horária:

    <br><br>

    <input type="number" name="cargaHoraria">

    <br><br>

    <button type="submit">
        Salvar
    </button>

</form>

<br>

<a href="listarDisciplinas.jsp">
    Voltar
</a>

</body>
</html>