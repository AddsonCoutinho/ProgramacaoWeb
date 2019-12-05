/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Addson Coutinho <addsoncoutinho@hotmail.com>
 */
public class Tarefa {
    int id;
    String nome;
    String descricao;
    int processo_id;
    boolean concluida;

    public Tarefa(int id, String nome, String descricao, int processo_id, boolean concluida){
        this.id=id;
        this.nome=nome;
        this.descricao=descricao;
        this.processo_id=processo_id;
        this.concluida= concluida;
    }
        
    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public int getProcesso_id() {
        return processo_id;
    }

    public boolean isConcluida() {
        return concluida;
    }

    public void setConcluida(boolean concluida) {
        this.concluida = concluida;
    }
}
