package model;
// Generated Jun 10, 2017 12:17:09 PM by Hibernate Tools 4.3.1


import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * Agent generated by hbm2java
 */
public class Agent  implements java.io.Serializable {


     private int agentId;
     private Account account;
     private Agent agent;
     private Area area;
     private Master master;
     private Serializable agentName;
     private Boolean activate;
     private Set<Agent> agents = new HashSet<Agent>(0);
     private Set<Merchant> merchants = new HashSet<Merchant>(0);

    public Agent() {
    }

	
    public Agent(int agentId) {
        this.agentId = agentId;
    }
    public Agent(int agentId, Account account, Agent agent, Area area, Master master, Serializable agentName, Boolean activate, Set<Agent> agents, Set<Merchant> merchants) {
       this.agentId = agentId;
       this.account = account;
       this.agent = agent;
       this.area = area;
       this.master = master;
       this.agentName = agentName;
       this.activate = activate;
       this.agents = agents;
       this.merchants = merchants;
    }
   
    public int getAgentId() {
        return this.agentId;
    }
    
    public void setAgentId(int agentId) {
        this.agentId = agentId;
    }
    public Account getAccount() {
        return this.account;
    }
    
    public void setAccount(Account account) {
        this.account = account;
    }
    public Agent getAgent() {
        return this.agent;
    }
    
    public void setAgent(Agent agent) {
        this.agent = agent;
    }
    public Area getArea() {
        return this.area;
    }
    
    public void setArea(Area area) {
        this.area = area;
    }
    public Master getMaster() {
        return this.master;
    }
    
    public void setMaster(Master master) {
        this.master = master;
    }
    public Serializable getAgentName() {
        return this.agentName;
    }
    
    public void setAgentName(Serializable agentName) {
        this.agentName = agentName;
    }
    public Boolean getActivate() {
        return this.activate;
    }
    
    public void setActivate(Boolean activate) {
        this.activate = activate;
    }
    public Set<Agent> getAgents() {
        return this.agents;
    }
    
    public void setAgents(Set<Agent> agents) {
        this.agents = agents;
    }
    public Set<Merchant> getMerchants() {
        return this.merchants;
    }
    
    public void setMerchants(Set<Merchant> merchants) {
        this.merchants = merchants;
    }




}


