package entity;
// Generated Jun 11, 2017 7:33:44 PM by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * ReportAgent generated by hbm2java
 */
@Entity
@Table(name="Report_Agent"
    ,schema="dbo"
    ,catalog="CardProcessing"
)
public class ReportAgent {


     private int reportId;
     private ReportMaster reportMaster;
     private ReportType reportType;
     private Integer agentId;
     private Integer transactionType;
     private Integer merchant;
     private Integer area;
     private Integer cardType;
     private Integer merchantType;
     private BigDecimal saleAmount;
     private BigDecimal returnAmount;
     private BigDecimal saleCount;
     private BigDecimal returnCount;
     private BigDecimal netAmount;
     private Date reportDate;
     private Date fromDate;
     private Date toDate;
     private Set<ReportMerchant> reportMerchants = new HashSet<ReportMerchant>(0);

    public ReportAgent() {
    }

	
    public ReportAgent(int reportId) {
        this.reportId = reportId;
    }
    public ReportAgent(int reportId, ReportMaster reportMaster, ReportType reportType, Integer agentId, Integer transactionType, Integer merchant, Integer area, Integer cardType, Integer merchantType, BigDecimal saleAmount, BigDecimal returnAmount, BigDecimal saleCount, BigDecimal returnCount, BigDecimal netAmount, Date reportDate, Date fromDate, Date toDate, Set<ReportMerchant> reportMerchants) {
       this.reportId = reportId;
       this.reportMaster = reportMaster;
       this.reportType = reportType;
       this.agentId = agentId;
       this.transactionType = transactionType;
       this.merchant = merchant;
       this.area = area;
       this.cardType = cardType;
       this.merchantType = merchantType;
       this.saleAmount = saleAmount;
       this.returnAmount = returnAmount;
       this.saleCount = saleCount;
       this.returnCount = returnCount;
       this.netAmount = netAmount;
       this.reportDate = reportDate;
       this.fromDate = fromDate;
       this.toDate = toDate;
       this.reportMerchants = reportMerchants;
    }
   
     @Id 

    
    @Column(name="ReportId", unique=true, nullable=false)
    public int getReportId() {
        return this.reportId;
    }
    
    public void setReportId(int reportId) {
        this.reportId = reportId;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="ParentReportId")
    public ReportMaster getReportMaster() {
        return this.reportMaster;
    }
    
    public void setReportMaster(ReportMaster reportMaster) {
        this.reportMaster = reportMaster;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="ReportTypeId")
    public ReportType getReportType() {
        return this.reportType;
    }
    
    public void setReportType(ReportType reportType) {
        this.reportType = reportType;
    }

    
    @Column(name="AgentId")
    public Integer getAgentId() {
        return this.agentId;
    }
    
    public void setAgentId(Integer agentId) {
        this.agentId = agentId;
    }

    
    @Column(name="TransactionType")
    public Integer getTransactionType() {
        return this.transactionType;
    }
    
    public void setTransactionType(Integer transactionType) {
        this.transactionType = transactionType;
    }

    
    @Column(name="Merchant")
    public Integer getMerchant() {
        return this.merchant;
    }
    
    public void setMerchant(Integer merchant) {
        this.merchant = merchant;
    }

    
    @Column(name="Area")
    public Integer getArea() {
        return this.area;
    }
    
    public void setArea(Integer area) {
        this.area = area;
    }

    
    @Column(name="CardType")
    public Integer getCardType() {
        return this.cardType;
    }
    
    public void setCardType(Integer cardType) {
        this.cardType = cardType;
    }

    
    @Column(name="MerchantType")
    public Integer getMerchantType() {
        return this.merchantType;
    }
    
    public void setMerchantType(Integer merchantType) {
        this.merchantType = merchantType;
    }

    
    @Column(name="SaleAmount", scale=4)
    public BigDecimal getSaleAmount() {
        return this.saleAmount;
    }
    
    public void setSaleAmount(BigDecimal saleAmount) {
        this.saleAmount = saleAmount;
    }

    
    @Column(name="ReturnAmount", scale=4)
    public BigDecimal getReturnAmount() {
        return this.returnAmount;
    }
    
    public void setReturnAmount(BigDecimal returnAmount) {
        this.returnAmount = returnAmount;
    }

    
    @Column(name="SaleCount", scale=4)
    public BigDecimal getSaleCount() {
        return this.saleCount;
    }
    
    public void setSaleCount(BigDecimal saleCount) {
        this.saleCount = saleCount;
    }

    
    @Column(name="ReturnCount", scale=4)
    public BigDecimal getReturnCount() {
        return this.returnCount;
    }
    
    public void setReturnCount(BigDecimal returnCount) {
        this.returnCount = returnCount;
    }

    
    @Column(name="NetAmount", scale=4)
    public BigDecimal getNetAmount() {
        return this.netAmount;
    }
    
    public void setNetAmount(BigDecimal netAmount) {
        this.netAmount = netAmount;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="ReportDate", length=10)
    public Date getReportDate() {
        return this.reportDate;
    }
    
    public void setReportDate(Date reportDate) {
        this.reportDate = reportDate;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="FromDate", length=10)
    public Date getFromDate() {
        return this.fromDate;
    }
    
    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="ToDate", length=10)
    public Date getToDate() {
        return this.toDate;
    }
    
    public void setToDate(Date toDate) {
        this.toDate = toDate;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="reportAgent")
    public Set<ReportMerchant> getReportMerchants() {
        return this.reportMerchants;
    }
    
    public void setReportMerchants(Set<ReportMerchant> reportMerchants) {
        this.reportMerchants = reportMerchants;
    }




}


