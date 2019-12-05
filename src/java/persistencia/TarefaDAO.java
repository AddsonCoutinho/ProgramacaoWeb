/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import model.Processo;
import model.Tarefa;

/**
 *
 * @author Addson Coutinho <addsoncoutinho@hotmail.com>
 */
public class TarefaDAO {
    private PreparedStatement criaStatement(String sql) throws Exception{
        String url="jdbc:mysql://localhost:3306/aula";
        String user="root";
        String pass= "";
        
        Class.forName("com.mysql.jdbc.Driver");
        
        Connection con = DriverManager.getConnection(url, user, pass);
        
        return con.prepareStatement(sql);
    }
    public void editarTarefa(String nome, String descricao, int id) throws Exception{
        String sql= "UPDATE tarefa SET nome=?, descricao=? WHERE id=?";
        PreparedStatement st = criaStatement(sql);
        
        st.setString(1, nome);
        st.setString(2,descricao);
        st.setInt(3, id);
        
        st.execute();
        
        st.getConnection().close();
        st.close();        
    }
    public int cadastrarNovaTarefa(HttpServletRequest request, ProcessoDAO dao) throws Exception{
        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        int processo_id = Integer.parseInt(request.getParameter ("id"));
        request.setAttribute("processo",new Processo(processo_id,dao.retornarProcesso(processo_id)) );
        cadastrarNovaTarefa(nome, descricao, processo_id);
        return processo_id;
    }
    public Collection<Tarefa> retornarTarefas(int id) throws Exception{
        String sql ="SELECT id, nome, descricao,concluida FROM tarefa WHERE processo_id=?";
        PreparedStatement st = criaStatement(sql);
        st.setInt(1, id);
        st.execute();
        Collection<Tarefa> tarefas = new ArrayList();
        ResultSet rs = st.executeQuery();
        while(rs.next()){
            tarefas.add(new Tarefa(rs.getInt("id"), rs.getString("nome"), rs.getString("descricao"),id, rs.getBoolean("concluida")));
        }
        return tarefas;
    }
    public void excluirTarefa(int id) throws Exception{
        String sql="DELETE FROM tarefa WHERE id=?" ;
        
        PreparedStatement st = criaStatement(sql);
        st.setInt(1, id);
        
        st.execute();
        
        st.getConnection().close();
        st.close();
    }
    
    public int procurarId(String nome) throws Exception{
        String sql = "SELECT * FROM tarefa WHERE nome=?";
        int id = 0;
        PreparedStatement st = criaStatement(sql);
        st.setString(1, nome);
        st.execute();
        ResultSet rs = st.executeQuery();
        while(rs.next()){
            id = rs.getInt("id");
        }
        
        st.getConnection().close();
        st.close();       
        return id;
    }
    public void cadastrarNovaTarefa(String nome, String descricao,int processo_id) throws Exception {
        String sql="INSERT into tarefa (nome, descricao,processo_id,concluida) VALUES  (?,?,?,0)" ;
        
        PreparedStatement st = criaStatement(sql);
        st.setString(1, nome);
        st.setString(2, descricao);
        st.setInt(3, processo_id);
        st.execute();
        
        st.getConnection().close();
        st.close();
    }
     public int procurarIdTarefa(String nome) throws Exception{
        String sql = "SELECT * FROM tarefa WHERE nome=?";
        int id = 0;
        PreparedStatement st = criaStatement(sql);
        st.setString(1, nome);
        st.execute();
        ResultSet rs = st.executeQuery();
        while(rs.next()){
            id = rs.getInt("id");
        }
        
        st.getConnection().close();
        st.close();       
        return id;
    }
     public int tamanhoTarefa(int id) throws Exception{
        String sql = "SELECT count(*) as contador FROM tarefa WHERE processo_id=?";
        PreparedStatement st = criaStatement(sql);
        st.setInt(1, id);
        st.execute();
        ResultSet rs = st.executeQuery();
        int contador = 0;
        while(rs.next()){
            contador = rs.getInt("contador");
        }
        st.getConnection().close();
        st.close();       
        return contador;
    }
    
    public void mudarStatus(int id, boolean concluida) throws Exception{
        String sql= "UPDATE tarefa SET concluida=? WHERE id=?";
        PreparedStatement st = criaStatement(sql);
        st.setBoolean(1, concluida);
        st.setInt(2, id);
        
        st.execute();
        
        st.getConnection().close();
        st.close();       
    }

}
