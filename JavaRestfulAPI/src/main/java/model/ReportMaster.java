package model;
// Generated Jun 10, 2017 12:17:09 PM by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.Date;

/**
 * ReportMaster generated by hbm2java
 */
public class ReportMaster  implements java.io.Serializable {


     private int reportId;
     private ReportType reportType;
     private Integer masterId;
     private Integer agent;
     private Integer merchant;
     private Integer transactionType;
     private Integer area;
     private Integer cardType;
     private Integer merchantType;
     private BigDecimal saleAmount;
     private BigDecimal returmAmount;
     private Integer saleCount;
     private Integer returnCount;
     private BigDecimal netAmount;
     private Date reportDate;
     private Date fromDate;
     private Date toDate;

    public ReportMaster() {
    }

	
    public ReportMaster(int reportId) {
        this.reportId = reportId;
    }
    public ReportMaster(int reportId, ReportType reportType, Integer masterId, Integer agent, Integer merchant, Integer transactionType, Integer area, Integer cardType, Integer merchantType, BigDecimal saleAmount, BigDecimal returmAmount, Integer saleCount, Integer returnCount, BigDecimal netAmount, Date reportDate, Date fromDate, Date toDate) {
       this.reportId = reportId;
       this.reportType = reportType;
       this.masterId = masterId;
       this.agent = agent;
       this.merchant = merchant;
       this.transactionType = transactionType;
       this.area = area;
       this.cardType = cardType;
       this.merchantType = merchantType;
       this.saleAmount = saleAmount;
       this.returmAmount = returmAmount;
       this.saleCount = saleCount;
       this.returnCount = returnCount;
       this.netAmount = netAmount;
       this.reportDate = reportDate;
       this.fromDate = fromDate;
       this.toDate = toDate;
    }
   
    public int getReportId() {
        return this.reportId;
    }
    
    public void setReportId(int reportId) {
        this.reportId = reportId;
    }
    public ReportType getReportType() {
        return this.reportType;
    }
    
    public void setReportType(ReportType reportType) {
        this.reportType = reportType;
    }
    public Integer getMasterId() {
        return this.masterId;
    }
    
    public void setMasterId(Integer masterId) {
        this.masterId = masterId;
    }
    public Integer getAgent() {
        return this.agent;
    }
    
    public void setAgent(Integer agent) {
        this.agent = agent;
    }
    public Integer getMerchant() {
        return this.merchant;
    }
    
    public void setMerchant(Integer merchant) {
        this.merchant = merchant;
    }
    public Integer getTransactionType() {
        return this.transactionType;
    }
    
    public void setTransactionType(Integer transactionType) {
        this.transactionType = transactionType;
    }
    public Integer getArea() {
        return this.area;
    }
    
    public void setArea(Integer area) {
        this.area = area;
    }
    public Integer getCardType() {
        return this.cardType;
    }
    
    public void setCardType(Integer cardType) {
        this.cardType = cardType;
    }
    public Integer getMerchantType() {
        return this.merchantType;
    }
    
    public void setMerchantType(Integer merchantType) {
        this.merchantType = merchantType;
    }
    public BigDecimal getSaleAmount() {
        return this.saleAmount;
    }
    
    public void setSaleAmount(BigDecimal saleAmount) {
        this.saleAmount = saleAmount;
    }
    public BigDecimal getReturmAmount() {
        return this.returmAmount;
    }
    
    public void setReturmAmount(BigDecimal returmAmount) {
        this.returmAmount = returmAmount;
    }
    public Integer getSaleCount() {
        return this.saleCount;
    }
    
    public void setSaleCount(Integer saleCount) {
        this.saleCount = saleCount;
    }
    public Integer getReturnCount() {
        return this.returnCount;
    }
    
    public void setReturnCount(Integer returnCount) {
        this.returnCount = returnCount;
    }
    public BigDecimal getNetAmount() {
        return this.netAmount;
    }
    
    public void setNetAmount(BigDecimal netAmount) {
        this.netAmount = netAmount;
    }
    public Date getReportDate() {
        return this.reportDate;
    }
    
    public void setReportDate(Date reportDate) {
        this.reportDate = reportDate;
    }
    public Date getFromDate() {
        return this.fromDate;
    }
    
    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }
    public Date getToDate() {
        return this.toDate;
    }
    
    public void setToDate(Date toDate) {
        this.toDate = toDate;
    }




}


