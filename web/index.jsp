<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

          
        <title>Sua Rotina</title>
        
    </head>

    <body>
        <nav class="nav nav-pills nav-fill">
             <a class="nav-item nav-link active" href="acao=ListarProcessos">Home</a>
            <a class="nav-item nav-link" href="#">Criar Novo</a>
            <a class="nav-item nav-link disabled" href="#">Login</a>
        </nav>   
        <header>
            <div class="jumbotron">
                <h1 class="display-4">Gerenciador de Projeto</h1>
                <p class="lead">Gerencie por aqui suas rotina de processo</p>
                <hr class="my-4">

            </div>
        </header>
        <div class="p-5">
            <c:if   test="${processos.size() > 0}">
            <div class="container">
              <div class="row hidden-md-up">
                <c:forEach items="${processos}" var="item">
                    <div class="col-md-4">
                      <div class="card m-2 my-4 p-3">
                        <div class="card-block">
                          <h4 class="card-title">${item.nome}</h4>
                          <h6 class="card-subtitle text-muted">Support card subtitle</h6>
                          <p class="card-text p-y-1">Some quick example text to build on the card title .</p>
                          <a href="tarefa?id=${item.id}&acao=AbrirTarefa" class="card-link">Abrir</a>
                          <a href="tarefa?id=${item.id}&acao=ExcluirProcesso" class="card-link">Excluir</a>
                        </div>
                      </div>
                    </div>
                </c:forEach>                      
              </div>
            </div>
            </c:if>
             <c:if   test="${processos.size() < 0}">
                <span>Nenhum processo</span>
             </c:if>
        </div>   

        <div id="footer"> 

        </div>
    
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
</html>
