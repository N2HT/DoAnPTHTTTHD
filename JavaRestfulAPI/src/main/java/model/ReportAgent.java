package model;
// Generated Jun 10, 2017 12:17:09 PM by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.Date;

/**
 * ReportAgent generated by hbm2java
 */
public class ReportAgent  implements java.io.Serializable {


     private int reportId;
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

    public ReportAgent() {
    }

	
    public ReportAgent(int reportId) {
        this.reportId = reportId;
    }
    public ReportAgent(int reportId, ReportType reportType, Integer agentId, Integer transactionType, Integer merchant, Integer area, Integer cardType, Integer merchantType, BigDecimal saleAmount, BigDecimal returnAmount, BigDecimal saleCount, BigDecimal returnCount, BigDecimal netAmount, Date reportDate, Date fromDate, Date toDate) {
       this.reportId = reportId;
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
    public Integer getAgentId() {
        return this.agentId;
    }
    
    public void setAgentId(Integer agentId) {
        this.agentId = agentId;
    }
    public Integer getTransactionType() {
        return this.transactionType;
    }
    
    public void setTransactionType(Integer transactionType) {
        this.transactionType = transactionType;
    }
    public Integer getMerchant() {
        return this.merchant;
    }
    
    public void setMerchant(Integer merchant) {
        this.merchant = merchant;
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
    public BigDecimal getReturnAmount() {
        return this.returnAmount;
    }
    
    public void setReturnAmount(BigDecimal returnAmount) {
        this.returnAmount = returnAmount;
    }
    public BigDecimal getSaleCount() {
        return this.saleCount;
    }
    
    public void setSaleCount(BigDecimal saleCount) {
        this.saleCount = saleCount;
    }
    public BigDecimal getReturnCount() {
        return this.returnCount;
    }
    
    public void setReturnCount(BigDecimal returnCount) {
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


