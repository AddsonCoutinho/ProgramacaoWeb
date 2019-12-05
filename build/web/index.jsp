<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>GP</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8">
        <!--<link href="estilos.css" type="text/css" rel="stylesheet">-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
                
    <!--    
    <style>
        
        *{
            padding: 0px;
            margin: 0px;
        }
        body{
            background-color: #EFEFEF;
            min-width: 900px;
        }
        #header{
            background-color: #0F3D59;
            display: block;
            height: 150px;
            color: #FFFFFF;
        }
        #logo{
            padding-left: 65px;
            text-align: center;
        }
        #header #logo{
            text-align: center;
            font-size: 70px;
            padding: 30px;
        }
        #header #user{
            display: inline;
            float: right;
            font-size: x-large;
        }
        #header .botao{
            display: inline;
            float: right;
            position: absolute;
            top: 90px;
            right: 30px;
        }
        #main{

            float : right;
            width: 81%;
            margin-top: 10px;
        }
        #main form{
            display: inline;
        }
        .botao {
            background-color:#236E8C;
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            position: relative;
        }

        .botao:hover{
            background-color:#0F3D59;
            
        }
        #main h3{
            font-size: 300%;
            text-align: center;
        }
        #main p{
            color: #000000;
            display: inline-block;
        }

        #nav{
            color: #FFFFFF;
            width: 16.66%;
            height: 500px;
            margin-left: 20px;
        }
        #nav li{
          
            position: relative;
            list-style:none;
        }
        #nav li .botao {
            width: 100%;
            border-radius: 60px;
        }
        .container{
            background-color: #3FA8BF;
            color: white;
            height: 350px;
            width: 23%;
            min-width: 190px;
            position: relative;
            float:left;
            margin: 5px;
            text-align: center;
            overflow: hidden;
            border-radius: 9%;
            text-align: center;
                        
        }
        .containerBotoes .botao{
            width: 30%;
            height: 75px;
            padding: 0px;
            margin: 0px;
        }
        .containerNome{
            background-color:#236E8C;
            height:75px;
            font-size: 150%;
            overflow: overlay;
        }
        .containerNome h2{
            padding-top: 10px;
            
        }
        .containerDescricao{
            height:200px;
            width: 100%;
            overflow: hidden;
        }
        .containerStatus{
            height:40px;
            width: 100%;
            padding-left: 45%;
        }
        .containerDescricao p{
            padding-top: 30px;
            
        }        
        .containerBotoes{
            width: 100%;
            height:75px;
            background-color:#0F3D59;
        }
        .concluida{
            height: 30px;
            width: 30px;
            border-radius: 50%;
            background-color: #19FF88;}
        .naoConcluida{
            height: 30px;
            width: 30px;
            border-radius: 50%;
            background-color: #FF1A00; }
        
        
        .overlay {
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(0, 0, 0, 0.7);
            transition: opacity 500ms;
            visibility: hidden;
            opacity: 0;
          }
          .overlay:target {
            visibility: visible;
            opacity: 1;
          }
          .popup {
            margin: 70px auto;
            padding: 20px;
            background: #fff;
            border-radius: 5px;
            width: 30%;
            position: relative;
            transition: all 2s ease-in-out;
          }
          .popup .close {
            position: absolute;
            top: 20px;
            right: 30px;
            transition: all 200ms;
            font-size: 30px;
            font-weight: bold;
            text-decoration: none;
            color: #333;
          }
          .popup .content {
            max-height: 30%;
            overflow: auto;
          }
          #botaoAdicionar{
              background-color:#236E8C;
              width: 60px;
              height: 60px;
              position: fixed;
              border-radius: 50%;
              text-align: center;
              top: 85%;
              left:90%;
          }
          a #botaoAdicionar{
              font-size: 300%;
              text-decoration: none;
              color: #FFF;
          }          
    
    </style>
       
    </head>

    <body>
        
        <div id="header">
        <h1 id ="logo">GP</h1>
        </div>
        
        <div id="main"><h3>Processos</h3>
            <c:if   test="${processos.size() > 0}">
                <c:forEach items="${processos}" var="cont" varStatus="contStatus">
                    <div class="container">
                        <div class="containerNome">
                            <h2>${cont.nome}</h2>
                        </div>
                        <div class="containerDescricao">
                            
                        </div>
                        <div class="containerBotoes">
                            
                            <form action="Servlet" method="post" >
                                <input type="hidden" name="acao" value="AbrirTarefa"/>
                                <input type="hidden" name="acao" value="abrirTarefa"/>
                                <input type="hidden" name="id" value="${cont.id}"/>

                                <button type ="submit" class="botao">Abrir</button>
                            </form>
                                                        
                            <form action="Servlet" method="post" >
                                <input type="hidden" name="acao" value="Editando"/>
                                <input type="hidden" name="id" value="${cont.id}"/>
                                <input type="hidden" name="pagina" value="processo"/>
                                <c:if test="${not editando}">
                                    <button type="submit" class="botao">Editar</button>
                                </c:if>
                            </form>

                            <c:if test="${editando}">
                                <c:if test="${id_editando < contStatus}">
                                <form action="Servlet" method="post" >
                                    <input type="hidden" name="acao" value="EditarProcesso"/>
                                    <input type="hidden" name="id" value="${cont.id}"/>
                                    <input type="text" name="nome" value="${cont.nome}"/>
                                    <button type ="submit" class="botao">Salvar</button>
                                </form>
                                </c:if>
                            </c:if>
                            
                            <form action="Servlet" method="post" >
                                <input type="hidden" name="acao" value="ExcluirProcesso"/>
                                <input type="hidden" name="id" value="${cont.id}"/>

                                <button type ="submit" class="botao">Excluir</button>
                            </form>

                        </div>
                </div>
                </c:forEach>
            </c:if>
            <c:if   test="${processos.size() < 1}">
                <p>Você não tem nenhum processo salvo</p>
            </c:if> 
             
            
                <a href="#popup1"><div id="botaoAdicionar">+</div></a>
           
            <div id="popup1" class="overlay">
                <div class="popup">
                        <h2>Novo Processo</h2>
                        <a class="close" href="#">&times;</a>
                        <div class="content">                                                                        
                                <form action="Servlet" method="post" >
                                    <input type="hidden" name="acao" value="CriarProcesso"/>                    
                                    <fieldset class="form-group">                                            
                                        <strong>Nome:</strong>
                                        <input class="form-control caixa" type="text" name="nome" size="32" maxlength="40" /><br>                                        
                                        <input type="hidden" name="pagina" value="processo"/>
                                        <button type="submit" class="botao">Adicionar</button>
                                    </fieldset>
                                </form>
                        </div>
                </div>
            </div>    
                
        </div>   
        <div id="nav">
            <ul>
                <li><form action="Servlet" method="post" >
                    <input type="hidden" name="acao" value="ListarProcessos"/>
                    <button type ="submit" class="botao">Home</button>
                    </form>
                </li>
                <li><a href="#popup1"><button class="botao" name="criaNovo">Criar Nova</button></a></li>
            </ul>
        </div>
        <div id="footer"> 
        
        </div>
    </body>
</html>
    
 -->
 
     </head>

    <body>
        
        <div class="jumbotron jumbotron-fluid">
            <div class="container">
              <h1 class="display-4">Gerenciador de Processo</h1>
              <p class="lead">Esse é um sistema para gerenciar seu progresso em atividades</p>
            </div>
        </div>         
            
        
        <div class="col-10 order-2 card-deck">
            <c:if   test="${processos.size() > 0}">
                <c:forEach items="${processos}" var="cont" varStatus="contStatus">
                    
                    <div class="card bg-light" style="max-width: 18rem;">
                         
                        <div class="card-header card-title">${cont.nome}</div>
                        
                        <div class="card-body"> 
                                                
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        
                          <div class="btn-toolbar justify-content-between">
                        <div class="btn-group d-flex justify-content-center">
                            
                            <form action="Servlet" method="post" >
                                <input type="hidden" name="acao" value="AbrirTarefa"/>
                                <input type="hidden" name="acao" value="abrirTarefa"/>
                                <input type="hidden" name="id" value="${cont.id}"/>

                                <button type ="submit" class="btn btn-secondary ">Abrir</button>
                            </form>
                                                        
                            <form action="Servlet" method="post" >
                                <input type="hidden" name="acao" value="Editando"/>
                                <input type="hidden" name="id" value="${cont.id}"/>
                                <input type="hidden" name="pagina" value="processo"/>
                                <c:if test="${not editando}">
                                    <button type="submit" class="btn btn-secondary">Editar</button>
                                </c:if>
                            </form>

                            <c:if test="${editando}">
                                <c:if test="${id_editando < contStatus}">
                                <form action="Servlet" method="post" >
                                    <input type="hidden" name="acao" value="EditarProcesso"/>
                                    <input type="hidden" name="id" value="${cont.id}"/>
                                    <input type="text" name="nome" value="${cont.nome}"/>
                                    <button type ="submit" class="btn btn-secondary">Salvar</button>
                                </form>
                                </c:if>
                            </c:if>
                            
                            <form action="Servlet" method="post" >
                                <input type="hidden" name="acao" value="ExcluirProcesso"/>
                                <input type="hidden" name="id" value="${cont.id}"/>

                                <button type ="submit" class="btn btn-secondary">Excluir</button>
                            </form>

                        </div>
                          </div>
                    </div>
                </div>
                </c:forEach>
            </c:if>
            <c:if   test="${processos.size() < 1}">
                <p>Você não tem nenhum processo salvo</p>
            </c:if>           
                            
        </div>   
        <nav>
            <ul class="navbar fixed-top navbar-expand-lg navbar-dark pink scrolling-navbar nav-pills">
                <li class="nav nav-item active"><form action="Servlet" method="post" >
                    <input type="hidden" name="acao" value="ListarProcessos"/>
                    <button type="submit" class="nav-link">Home</button>
                    </form>
                </li>
                <li class="nav nav-item">
                    <button type="submit" href="#popup1" class="nav-link">Criar Nova</button>
            </ul>
        </nav>
       </div>
        <div id="footer"> 
        
        </div>
    </body>
</html>
