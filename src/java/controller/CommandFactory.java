/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Addson Coutinho <addsoncoutinho@hotmail.com>
 */
public class CommandFactory {
    public static Command createCommand(HttpServletRequest request) throws Exception{
        String acao = request.getParameter("acao");
        
        if(acao == null){
            acao = "ListarProcessos";
        }
        
        acao = "controller."+acao;
        
        Class<?> clazz = Class.forName(acao);
      
        return (Command)clazz.newInstance();

    }
}
