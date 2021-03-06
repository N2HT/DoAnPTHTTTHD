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
 * ReportType generated by hbm2java
 */
@Entity
@Table(name="ReportType"
    ,schema="dbo"
    ,catalog="CardProcessing"
)
public class ReportType {


     private int reportTypeId;
     private String reportTypeName;
     private Set<ReportMaster> reportMasters = new HashSet<ReportMaster>(0);
     private Set<ReportMerchant> reportMerchants = new HashSet<ReportMerchant>(0);
     private Set<ReportAgent> reportAgents = new HashSet<ReportAgent>(0);

    public ReportType() {
    }

	
    public ReportType(int reportTypeId) {
        this.reportTypeId = reportTypeId;
    }
    public ReportType(int reportTypeId, String reportTypeName, Set<ReportMaster> reportMasters, Set<ReportMerchant> reportMerchants, Set<ReportAgent> reportAgents) {
       this.reportTypeId = reportTypeId;
       this.reportTypeName = reportTypeName;
       this.reportMasters = reportMasters;
       this.reportMerchants = reportMerchants;
       this.reportAgents = reportAgents;
    }
   
     @Id 

    
    @Column(name="ReportTypeId", unique=true, nullable=false)
    public int getReportTypeId() {
        return this.reportTypeId;
    }
    
    public void setReportTypeId(int reportTypeId) {
        this.reportTypeId = reportTypeId;
    }

    
    @Column(name="ReportTypeName")
    public String getReportTypeName() {
        return this.reportTypeName;
    }
    
    public void setReportTypeName(String reportTypeName) {
        this.reportTypeName = reportTypeName;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="reportType")
    public Set<ReportMaster> getReportMasters() {
        return this.reportMasters;
    }
    
    public void setReportMasters(Set<ReportMaster> reportMasters) {
        this.reportMasters = reportMasters;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="reportType")
    public Set<ReportMerchant> getReportMerchants() {
        return this.reportMerchants;
    }
    
    public void setReportMerchants(Set<ReportMerchant> reportMerchants) {
        this.reportMerchants = reportMerchants;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="reportType")
    public Set<ReportAgent> getReportAgents() {
        return this.reportAgents;
    }
    
    public void setReportAgents(Set<ReportAgent> reportAgents) {
        this.reportAgents = reportAgents;
    }




}


