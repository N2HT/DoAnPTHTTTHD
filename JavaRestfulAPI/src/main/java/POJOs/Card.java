package POJOs;
// Generated Jun 7, 2017 1:31:19 AM by Hibernate Tools 4.3.1


import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * Card generated by hbm2java
 */
public class Card  implements java.io.Serializable {


     private int cardId;
     private CardType cardType;
     private Master master;
     private Serializable cardNumber;
     private Set transactionDetailses = new HashSet(0);

    public Card() {
    }

	
    public Card(int cardId) {
        this.cardId = cardId;
    }
    public Card(int cardId, CardType cardType, Master master, Serializable cardNumber, Set transactionDetailses) {
       this.cardId = cardId;
       this.cardType = cardType;
       this.master = master;
       this.cardNumber = cardNumber;
       this.transactionDetailses = transactionDetailses;
    }
   
    public int getCardId() {
        return this.cardId;
    }
    
    public void setCardId(int cardId) {
        this.cardId = cardId;
    }
    public CardType getCardType() {
        return this.cardType;
    }
    
    public void setCardType(CardType cardType) {
        this.cardType = cardType;
    }
    public Master getMaster() {
        return this.master;
    }
    
    public void setMaster(Master master) {
        this.master = master;
    }
    public Serializable getCardNumber() {
        return this.cardNumber;
    }
    
    public void setCardNumber(Serializable cardNumber) {
        this.cardNumber = cardNumber;
    }
    public Set getTransactionDetailses() {
        return this.transactionDetailses;
    }
    
    public void setTransactionDetailses(Set transactionDetailses) {
        this.transactionDetailses = transactionDetailses;
    }




}


