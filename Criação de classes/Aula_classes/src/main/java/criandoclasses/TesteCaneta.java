package criandoclasses;

public class TesteCaneta {
    public static void main(String[] args) {

        Caneta caneta1 = new Caneta();

        caneta1.modelo="esferográfica";
        caneta1.cor="azul";
        caneta1.ponta=0.5f;
        caneta1.carga=90;
        /*caneta1.tampada=true;*/

        //caneta1.destampar();
        //caneta1.tampar();
        //caneta1.estado();
        //caneta1.rabiscar();

        //caneta1.desenhar();

        Caneta caneta2 = new Caneta();
        caneta2.modelo="esferográfica";
        caneta2.cor="verde";
        caneta2.ponta=2.0f;
        caneta2.carga=100;
        caneta2.tampada=false;

        caneta2.estado();
        caneta2.rabiscar();
        caneta2.desenhar();


    }
}
