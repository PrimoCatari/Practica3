
package com.emergentes.modelo;

import java.util.ArrayList;
import java.util.Iterator;

public class Controllibro {
    
    private ArrayList<libros> lista;

    public Controllibro() {
        lista = new ArrayList<libros>();
    }

    public ArrayList<libros> getLista() {
        return lista;
    }

    public void setLista(ArrayList<libros> lista) {
        this.lista = lista;
    }
    
    public void insertarlibro (libros item){
        lista.add(item);
    }
    public void modificarlibro (int pos, libros item){
        lista.set(pos,item);
    }
    public void eliminarlibro (int pos){
        lista.remove(pos);
    }
    public int obtieneId() {
        int idaux =0;
        for (libros item : lista) {
            idaux = item.getId();
        }
        return idaux+1;
    }
    public int ubicarlibro(int id) {
        int pos =-1;
        Iterator<libros> it = lista.iterator();
        while(it.hasNext()){
            ++pos;
            libros aux = it.next();
            if(aux.getId()==id){
                break;
            }
        }
        return pos;
    }
    
}
