/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistencia.ProcessoDAO;

/**
 *
 * @author Addson Coutinho <addsoncoutinho@hotmail.com>
 */
public class EditarProcesso implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ProcessoDAO dao = new ProcessoDAO();
        String nome = request.getParameter("nome");
        dao.editarProcesso(nome,Integer.parseInt(request.getParameter("id")));
        request.setAttribute("processos", dao.retornarProcesso());
        return "index.jsp";
    }
}
