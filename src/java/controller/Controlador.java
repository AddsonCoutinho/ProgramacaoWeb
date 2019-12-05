package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistencia.ProcessoDAO;
import persistencia.TarefaDAO;

public class Controlador extends HttpServlet {
    ProcessoDAO daoProcesso = new ProcessoDAO();
    TarefaDAO daoTarefa = new TarefaDAO();
    boolean novoProcesso = false;
    
    private void executarComando(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        Command comando = CommandFactory.createCommand(request);
        String view = comando.execute(request, response);
        request.getRequestDispatcher(view).forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try { 
            executarComando(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
                executarComando(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}