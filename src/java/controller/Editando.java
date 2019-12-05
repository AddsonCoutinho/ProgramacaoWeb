/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistencia.ProcessoDAO;
import persistencia.TarefaDAO;

/**
 *
 * @author Addson Coutinho <addsoncoutinho@hotmail.com>
 */
public class Editando implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        TarefaDAO dao = new TarefaDAO();
        ProcessoDAO daoP = new ProcessoDAO();
        request.setAttribute("id_editando", request.getParameter("id"));
        request.setAttribute("editando", true);
        if(request.getParameter("pagina").equals("tarefa")){
            request.setAttribute("tarefas", dao.retornarTarefas(Integer.parseInt(request.getParameter("id"))));
            return "tarefa.jsp";
        }
        request.setAttribute("processos", daoP.retornarProcesso());
        return "index.jsp";
    }
}
