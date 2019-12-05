/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistencia.TarefaDAO;

/**
 *
 * @author Addson Coutinho <addsoncoutinho@hotmail.com>
 */
public class AbrirTarefa implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        TarefaDAO dao = new TarefaDAO();
        request.setAttribute("tarefas", dao.retornarTarefas(Integer.parseInt(request.getParameter("id"))));
        request.setAttribute("ip", Integer.parseInt(request.getParameter("id")));
        return "tarefa.jsp";
    }
    
}
