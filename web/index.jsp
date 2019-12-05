<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="estilos.css" type="text/css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap" rel="stylesheet">
                
        <title>Sua Rotina</title>
    <style>
        *{
            padding: 5px;
        }
        body{
            background-color: #ffffff;
        }
        #header{
            background-color: #A4D59C;
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
            background-color: #A1D399;
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
            float: right;
        }

        .botao:hover{
            background-color: #8AD37D;
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }
        #main h3{
            margin: 0px;
            background-color: #bdecb6;
            color: #FFFFFF;
        }
        #main p{
            color: #000000;
            display: inline-block;
        }

        #nav{
            color: #FFFFFF;
            width: 16%;
            height: 500px;
            margin-top: 10px;
        }
        #nav li{
          
            position: relative;
            margin-bottom: 45px;
            list-style:none;
        }
        #nav li .botao {
            width: 100%;
            position: absolute;
        }
        
    </style>
        
    </head>

    <body>
        <div id="header">
        <h1 id ="logo">Sua Rotina</h1>
        </div>
        
        <div id="main"><h3>Suas Atividades</h3>
            <c:if   test="${processos.size() > 0}">
                <c:forEach items="${processos}" var="cont" varStatus="contStatus">
                    <div class="processo"><p>${cont.nome}</p>
                        <form action="Servlet" method="post" >
                            <input type="hidden" name="acao" value="ExcluirProcesso"/>
                            <input type="hidden" name="id" value="${cont.id}"/>
                            
                            <button type ="submit" class="botao">Excluir</button>
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
                        <input type="hidden" name="acao" value="AbrirTarefa"/>
                            <input type="hidden" name="acao" value="abrirTarefa"/>
                            <input type="hidden" name="id" value="${cont.id}"/>
                            
                            <button type ="submit" class="botao">Abrir</button>
                        </form>
                    </div>
                </c:forEach>
            </c:if>
            <c:if   test="${processos.size() < 1}">
                <p>Você não tem nenhum processo salvo</p>
            </c:if>  
        </div>   
        <div id="nav">
            <ul>
                <li><form action="Servlet" method="post" >
                    <input type="hidden" name="acao" value="ListarProcessos"/>
                    <button type ="submit" class="botao">Home</button>
                    </form>
                </li>
                <li><a href="novoProcesso.jsp"><button class="botao" name="criaNovo">Criar Nova</button></a></li>
            </ul>
        </div>
        <div id="footer"> 
        
        </div>
    </body>
</html>
