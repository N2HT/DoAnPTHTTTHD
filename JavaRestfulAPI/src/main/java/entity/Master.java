package entity;
// Generated Jun 12, 2017 12:53:24 PM by Hibernate Tools 4.3.1


import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Master generated by hbm2java
 */
@Entity
@Table(name="Master"
    ,schema="dbo"
    ,catalog="CardProcessing"
)
public class Master  implements java.io.Serializable {


     private int masterId;
     private String masterName;
     private Set<Card> cards = new HashSet<Card>(0);
     private Set<AccountStatement> accountStatements = new HashSet<AccountStatement>(0);
     private Set<Agent> agents = new HashSet<Agent>(0);
     private Set<Account> accounts = new HashSet<Account>(0);

    public Master() {
    }

	
    public Master(int masterId) {
        this.masterId = masterId;
    }
    public Master(int masterId, String masterName, Set<Card> cards, Set<AccountStatement> accountStatements, Set<Agent> agents, Set<Account> accounts) {
       this.masterId = masterId;
       this.masterName = masterName;
       this.cards = cards;
       this.accountStatements = accountStatements;
       this.agents = agents;
       this.accounts = accounts;
    }
   
     @Id 

    
    @Column(name="MasterId", unique=true, nullable=false)
    public int getMasterId() {
        return this.masterId;
    }
    
    public void setMasterId(int masterId) {
        this.masterId = masterId;
    }

    
    @Column(name="MasterName")
    public String getMasterName() {
        return this.masterName;
    }
    
    public void setMasterName(String masterName) {
        this.masterName = masterName;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="master")
    public Set<Card> getCards() {
        return this.cards;
    }
    
    public void setCards(Set<Card> cards) {
        this.cards = cards;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="master")
    public Set<AccountStatement> getAccountStatements() {
        return this.accountStatements;
    }
    
    public void setAccountStatements(Set<AccountStatement> accountStatements) {
        this.accountStatements = accountStatements;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="master")
    public Set<Agent> getAgents() {
        return this.agents;
    }
    
    public void setAgents(Set<Agent> agents) {
        this.agents = agents;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="master")
    public Set<Account> getAccounts() {
        return this.accounts;
    }
    
    public void setAccounts(Set<Account> accounts) {
        this.accounts = accounts;
    }




}


