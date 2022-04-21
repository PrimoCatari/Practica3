
package com.emergentes.modelo;

import java.util.ArrayList;
import java.util.Iterator;


public class Controlcategoria {
        private ArrayList<categorias> lista;

    public Controlcategoria() {
        lista = new ArrayList<categorias>();
    }

    public ArrayList<categorias> getLista() {
        return lista;
    }

    public void setLista(ArrayList<categorias> lista) {
        this.lista = lista;
    }
    
    public void insertarcategoria (categorias item){
        lista.add(item);
    }
    public void modificarcategoria (int pos, categorias item){
        lista.set(pos,item);
    }
    public void eliminarcategoria (int pos){
        lista.remove(pos);
    }
    public int obtieneIdcategoria() {
        int idaux =0;
        for (categorias item : lista) {
            idaux = item.getId();
        }
        return idaux+1;
    }
    public int ubicarcategoria(int id) {
        int pos =-1;
        Iterator<categorias> it = lista.iterator();
        while(it.hasNext()){
            ++pos;
            categorias aux = it.next();
            if(aux.getId()==id){
                break;
            }
        }
        return pos;
    }
    
}
