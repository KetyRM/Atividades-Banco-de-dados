package criandoclasses;

public class Caneta {

   /* ---- Definição dos atributos ---- */

    String modelo;
    String cor;
    float ponta;
    int carga;
    boolean tampada;



    /* ---- Definição dos métodos ---- */

    /*-- Metodo 1 --*/
    void rabiscar(){
        if(this.tampada == true || this.carga == 0){
            System.out.println("ERRO! você não pode rabiscar com a caneta tampada.");
        }else{
            System.out.println("Pode rabiscar à vontade! :) ");
        }
    }

    /*-- Metodo 2 -- */
    void tampar(){
        this.tampada = true;
    }

    void destampar(){
        this.tampada = false;
    }


    void desenhar(){
        if(this.tampada == true || this.carga == 0){
            System.out.println("ERRO! Você não pode desenhar.");
        }else{
            System.out.println("Você pode desenhar à vontade! ");
        }


    }





    /*---- Definição do estado atual ---- */

    void estado(){
        System.out.println("Está caneta é do modelo: " + this.modelo);
        System.out.println("Está caneta tem a cor: " + this.cor);
        System.out.println("Está caneta tem a ponta: " + this.ponta);
        System.out.println("Está caneta está com a carga em: " + this.carga +"%");
        System.out.println("Está caneta está tampada? " + this.tampada);


    }





}
