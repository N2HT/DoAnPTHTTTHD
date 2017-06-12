package entity;
// Generated Jun 12, 2017 12:53:24 PM by Hibernate Tools 4.3.1


import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Agent generated by hbm2java
 */
@Entity
@Table(name = "Agent"
        , schema = "dbo"
        , catalog = "CardProcessing"
)
public class Agent implements java.io.Serializable {


    private int agentId;
    private Agent agent;
    private Area area;
    private Master master;
    private String agentName;
    private Boolean activate;
    private Set<Agent> agents = new HashSet<Agent>(0);
    private Set<Account> accounts = new HashSet<Account>(0);
    private Set<Merchant> merchants = new HashSet<Merchant>(0);

    public Agent() {
    }


    public Agent(int agentId) {
        this.agentId = agentId;
    }

    public Agent(int agentId, Agent agent, Area area, Master master, String agentName, Boolean activate, Set<Agent> agents, Set<Account> accounts, Set<Merchant> merchants) {
        this.agentId = agentId;
        this.agent = agent;
        this.area = area;
        this.master = master;
        this.agentName = agentName;
        this.activate = activate;
        this.agents = agents;
        this.accounts = accounts;
        this.merchants = merchants;
    }

    @Id


    @Column(name = "AgentId", unique = true, nullable = false)
    public int getAgentId() {
        return this.agentId;
    }

    public void setAgentId(int agentId) {
        this.agentId = agentId;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ParentAgentId")
    public Agent getAgent() {
        return this.agent;
    }

    public void setAgent(Agent agent) {
        this.agent = agent;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "AreaId")
    public Area getArea() {
        return this.area;
    }

    public void setArea(Area area) {
        this.area = area;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MasterId")
    public Master getMaster() {
        return this.master;
    }

    public void setMaster(Master master) {
        this.master = master;
    }


    @Column(name = "AgentName")
    public String getAgentName() {
        return this.agentName;
    }

    public void setAgentName(String agentName) {
        this.agentName = agentName;
    }


    @Column(name = "Activate")
    public Boolean getActivate() {
        return this.activate;
    }

    public void setActivate(Boolean activate) {
        this.activate = activate;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "agent")
    public Set<Agent> getAgents() {
        return this.agents;
    }

    public void setAgents(Set<Agent> agents) {
        this.agents = agents;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "agent")
    public Set<Account> getAccounts() {
        return this.accounts;
    }

    public void setAccounts(Set<Account> accounts) {
        this.accounts = accounts;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "agent")
    public Set<Merchant> getMerchants() {
        return this.merchants;
    }

    public void setMerchants(Set<Merchant> merchants) {
        this.merchants = merchants;
    }


}


