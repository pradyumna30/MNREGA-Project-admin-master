/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package smsclient1;

/**
 *
 * @author Ruchir
 */
public class SMSClient1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        SMSClient s = new SMSClient(13);
        int check = s.sendMessage("+919407427269","Hello World");
        
    }
}
