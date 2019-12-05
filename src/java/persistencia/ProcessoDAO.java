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
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.Processo;

/**
 *
 * @author Addson Coutinho <addsoncoutinho@hotmail.com>
 */

public class ProcessoDAO {    
     private PreparedStatement criaStatement(String sql) throws Exception{
        String url="jdbc:mysql://localhost:3306/aula";
        String user="root";
        String pass= "";
        
        Class.forName("com.mysql.jdbc.Driver");
        
        Connection con = DriverManager.getConnection(url, user, pass);
        
        return con.prepareStatement(sql);
    }

    public int cadastrarNovoProcesso(HttpServletRequest request, ProcessoDAO dao) throws Exception{
        String nome = request.getParameter("nome");
        dao.cadastrarNovoProcesso(nome);
        request.setAttribute("processo",new Processo(retornarId(),nome));
        return dao.retornarId();
    } 
     
    public void cadastrarNovoProcesso(String nome) throws Exception {
        String sql="INSERT into processo (nome) VALUES  (?)" ;
        
        PreparedStatement st = criaStatement(sql);
        st.setString(1, nome);
        
        st.execute();
        
        
        st.getConnection().close();
        st.close();
    }

    public void editarProcesso(String nome, int id) throws Exception{
        String sql= "UPDATE processo SET nome=? WHERE id=?";
        PreparedStatement st = criaStatement(sql);
        
        st.setString(1, nome);
        st.setInt(2, id);
        
        st.execute();
        
        st.getConnection().close();
        st.close();        
    }

    public void excluirProcesso(int id) throws Exception{
        String sql="DELETE FROM processo WHERE id=?" ;
        
        PreparedStatement st = criaStatement(sql);
        st.setInt(1, id);
        
        st.execute();
        
        st.getConnection().close();
        st.close();
    }

    public String retornarProcesso(int id) throws Exception{
        String sql= "SELECT nome FROM processo WHERE id=?";
        
        PreparedStatement st = criaStatement(sql);
        st.setInt(1, id);
        st.execute();
        ResultSet rs = st.executeQuery();
        String nome = "";
        while(rs.next()){
            nome = rs.getString("nome");
        }        
        st.getConnection().close();
        st.close();       
        
        return nome;
    }

    public int retornarId() throws Exception{
        int id = 0;
        String sql= "SELECT MAX(id) as id FROM processo";
        
        PreparedStatement st = criaStatement(sql);
        st.execute();
         ResultSet rs = st.executeQuery();
        while(rs.next()){
            id = rs.getInt("id");
        }        
        st.getConnection().close();
        st.close();       
        
        return id;
    }

    public Collection<Processo> retornarProcesso() throws Exception{
        String sql ="SELECT id, nome FROM processo";
        
        PreparedStatement st = criaStatement(sql);
        st.execute();
        Collection<Processo> processos = new ArrayList();
        ResultSet rs = st.executeQuery();
        while(rs.next()){
            processos.add(new Processo(rs.getInt("id"), rs.getString("nome")));
        }
        return processos;
    }

    public List<Processo> getProcesso() throws Exception {
        return getProcesso(null);
    }

    private List<Processo> getProcesso(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
