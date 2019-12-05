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
public class CriarProcesso implements Command {
    
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        TarefaDAO daoTarefa = new TarefaDAO();
        ProcessoDAO daoProcesso = new ProcessoDAO();        
        request.setAttribute("tarefa", daoTarefa.tamanhoTarefa(daoProcesso.cadastrarNovoProcesso(request, daoProcesso)));
        //request.setAttribute("novoProcesso", "true");
        //return "novoProcesso.jsp";
        request.setAttribute("ip", daoProcesso.retornarId());
        return "tarefa.jsp";
    }
}
