/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Collection;
import java.util.List;

/**
 *
 * @author Addson Coutinho <addsoncoutinho@hotmail.com>
 */
public class Processo {
    
    private final int id;
    private String nome;
    private Collection<Tarefa> tarefas;

    public Processo(int id, String nome){
        this.id = id;
        this.nome = nome;
    }
    public String getNome(){
        return nome;
    }
    void setNome(String nome){
        this.nome = nome;
    }
    public int getId(){
        return id;
    }
    
}
