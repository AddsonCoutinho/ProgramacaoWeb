<%-- 
    Document   : tarefa
    Created on : 06/11/2019, 01:13:21
    Author     : Addson Coutinho <addsoncoutinho@hotmail.com>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="estilos.css" type="text/css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap" rel="stylesheet">
                
        <title>GP</title>
    <style>
        
        *{
            padding: 0px;
            margin: 0px;
        }
        body{
            background-color: #EFEFEF;
        }
        #header{
            background-color: #0F3D59;
            display: block;
            height: 150px;
            color: #FFFFFF;
            font-family: 'Dancing Script', cursive;
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
            height:160px;
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
        
        <div id="main"><h3>Tarefas</h3>
            
            <c:set var="task" value="${tarefas}"/>
            <c:if   test="${tarefas.size() > 0}">
                <c:forEach items="${tarefas}" var="item">
                    
                    <div class="container">
                        <div class="containerNome">
                            <h2>${item.nome}</h2>
                        </div>
                        <div class="containerDescricao">
                            <p>${item.descricao}</p>                           
                            
                        </div>
                        <div class="containerStatus">
                            <c:if test="${item.concluida}">
                                <div class="concluida"></div>
                            </c:if>
                            <c:if test="${!item.concluida}">
                                <div class="naoConcluida"></div>
                            </c:if>
                        </div>
                        <div class="containerBotoes">                          
                                                
                            <form action="Servlet" method="post" >
                                <input type="hidden" name="acao" value="MudarEstado"/>
                                <input type="hidden" name="id" value="${item.id}"/>
                                <input type="hidden" name="idProcesso" value="${item.processo_id}">
                                 <input type="hidden" name="status" value="${not item.concluida}"/>
                                <button type ="submit" class="botao">Mudar</button>
                            </form>
                                
                            <a href="#popup2" ><button  class="botao" >Editar</button></a>
                            <div id="popup2" class="overlay">
                                <div class="popup">
                                    <h2>Editar</h2>
                                    <a class="close" href="#">&times;</a>
                                    <div class="content">                                                                        
                                        <form action="Servlet" method="post" >
                                            <input type="hidden" name="acao" value="EditarTarefa"/>
                                            <input type="hidden" name="pagina" value="tarefa"/>
                                            <input type="hidden" name="id" value="${item.id}"/>
                                            <input type="hidden" name="idProcesso" value="${item.processo_id}">
                                            <input type="text" name="nome" value="${item.nome}"/>
                                            <input type="text" name="descricao" value="${item.descricao}">
                                            <button type ="submit" class="botao">Salvar</button>                            
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <form action="Servlet" method="post" >
                                <input type="hidden" name="acao" value="ExcluirTarefa"/>
                                <input type="hidden" name="id" value="${item.id}"/>
                                <input type="hidden" name="idProcesso" value="${item.processo_id}">
                                <button type ="submit" class="botao">Excluir</button>
                            </form>                            
                            
                            
                            
                        </div>
                    </div>
                    
                </c:forEach>
                
                
            </c:if>
            <c:if   test="${tarefas.size() < 1}">
                <p>Você não tem nenhuma tarefa nesse processo</p>
                
            </c:if>
                
                
                    <a href="#popup1"><div id="botaoAdicionar">+ </div></a>
               
                <div id="popup1" class="overlay">
                    <div class="popup">
                            <h2>Criar nova etapa</h2>
                            <a class="close" href="#">&times;</a>
                            <div class="content">                                                                        
                                    <form action="Servlet" method="post" >
                                        <input type="hidden" name="acao" value="CriarTarefa"/>                    
                                        <fieldset class="form-group">                                            
                                            <strong>Nome:</strong>
                                            <input class="form-control caixa" type="text" name="nome" size="32" maxlength="40" /><br>
                                            <strong>Descrição</strong>
                                            <input class="form-control" type="text" name="descricao" size="32" />
                                            <input type="hidden" name="pagina" value="tarefa"/>
                                            <input type="hidden" name="id" value="${ip}"/>
                                            <button type="submit" class="botao">Adicionar</button>
                                        </fieldset>
                                    </form>
                            </div>
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
                <li><a href="novoProcesso.jsp"><button class="botao" name="criaNovo">Criar novo</button></a></li>
            </ul>
            
        </div> 
        <div id="footer"> 
        
        </div>
    </body>
</html>

