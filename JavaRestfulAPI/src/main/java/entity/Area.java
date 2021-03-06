package entity;
// Generated Jun 11, 2017 7:33:44 PM by Hibernate Tools 4.3.1


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
 * Area generated by hbm2java
 */
@Entity
@Table(name = "Area"
        , schema = "dbo"
        , catalog = "CardProcessing"
)
public class Area {


    private int areaId;
    private String areaName;
    private Set<Merchant> merchants = new HashSet<Merchant>(0);
    private Set<Agent> agents = new HashSet<Agent>(0);

    public Area() {
    }


    public Area(int areaId) {
        this.areaId = areaId;
    }

    public Area(int areaId, String areaName, Set<Merchant> merchants, Set<Agent> agents) {
        this.areaId = areaId;
        this.areaName = areaName;
        this.merchants = merchants;
        this.agents = agents;
    }

    @Id


    @Column(name = "AreaId", unique = true, nullable = false)
    public int getAreaId() {
        return this.areaId;
    }

    public void setAreaId(int areaId) {
        this.areaId = areaId;
    }


    @Column(name = "AreaName")
    public String getAreaName() {
        return this.areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "area")
    public Set<Merchant> getMerchants() {
        return this.merchants;
    }

    public void setMerchants(Set<Merchant> merchants) {
        this.merchants = merchants;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "area")
    public Set<Agent> getAgents() {
        return this.agents;
    }

    public void setAgents(Set<Agent> agents) {
        this.agents = agents;
    }


}


