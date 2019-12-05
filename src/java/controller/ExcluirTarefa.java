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
public class ExcluirTarefa implements Command{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        TarefaDAO dao = new TarefaDAO();
        dao.excluirTarefa(Integer.parseInt(request.getParameter("id")));
        int id_P = Integer.parseInt(request.getParameter("idProcesso"));
        request.setAttribute("tarefas", dao.retornarTarefas(id_P));
        request.setAttribute("ip", id_P);
        return "tarefa.jsp";
    }
    
    
}
