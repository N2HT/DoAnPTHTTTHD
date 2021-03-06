package entity;
// Generated Jun 11, 2017 7:33:44 PM by Hibernate Tools 4.3.1


import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * ReportMerchant generated by hbm2java
 */
@Entity
@Table(name = "Report_Merchant"
        , schema = "dbo"
        , catalog = "CardProcessing"
)
public class ReportMerchant {


    private int reportId;
    private ReportAgent reportAgent;
    private ReportType reportType;
    private Integer merchantId;
    private Integer transactionType;
    private String cardType;
    private BigDecimal saleAmount;
    private BigDecimal returnAmount;
    private Integer saleCount;
    private Integer returnCount;
    private BigDecimal netAmount;
    private Date reportDate;
    private Date fromDate;
    private Date toDate;

    public ReportMerchant() {
    }


    public ReportMerchant(int reportId) {
        this.reportId = reportId;
    }

    public ReportMerchant(int reportId, ReportAgent reportAgent, ReportType reportType, Integer merchantId, Integer transactionType, String cardType, BigDecimal saleAmount, BigDecimal returnAmount, Integer saleCount, Integer returnCount, BigDecimal netAmount, Date reportDate, Date fromDate, Date toDate) {
        this.reportId = reportId;
        this.reportAgent = reportAgent;
        this.reportType = reportType;
        this.merchantId = merchantId;
        this.transactionType = transactionType;
        this.cardType = cardType;
        this.saleAmount = saleAmount;
        this.returnAmount = returnAmount;
        this.saleCount = saleCount;
        this.returnCount = returnCount;
        this.netAmount = netAmount;
        this.reportDate = reportDate;
        this.fromDate = fromDate;
        this.toDate = toDate;
    }

    @Id
    @Column(name = "ReportId", unique = true, nullable = false)
    public int getReportId() {
        return this.reportId;
    }

    public void setReportId(int reportId) {
        this.reportId = reportId;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ParentReportId")
    @JsonIgnore
    public ReportAgent getReportAgent() {
        return this.reportAgent;
    }

    public void setReportAgent(ReportAgent reportAgent) {
        this.reportAgent = reportAgent;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ReportTypeId")
    @JsonIgnore
    public ReportType getReportType() {
        return this.reportType;
    }

    public void setReportType(ReportType reportType) {
        this.reportType = reportType;
    }


    @Column(name = "MerchantId")
    public Integer getMerchantId() {
        return this.merchantId;
    }

    public void setMerchantId(Integer merchantId) {
        this.merchantId = merchantId;
    }


    @Column(name = "TransactionType")
    public Integer getTransactionType() {
        return this.transactionType;
    }

    public void setTransactionType(Integer transactionType) {
        this.transactionType = transactionType;
    }


    @Column(name = "CardType")
    public String getCardType() {
        return this.cardType;
    }

    public void setCardType(String cardType) {
        this.cardType = cardType;
    }


    @Column(name = "SaleAmount", scale = 4)
    public BigDecimal getSaleAmount() {
        return this.saleAmount;
    }

    public void setSaleAmount(BigDecimal saleAmount) {
        this.saleAmount = saleAmount;
    }


    @Column(name = "ReturnAmount", scale = 4)
    public BigDecimal getReturnAmount() {
        return this.returnAmount;
    }

    public void setReturnAmount(BigDecimal returnAmount) {
        this.returnAmount = returnAmount;
    }


    @Column(name = "SaleCount")
    public Integer getSaleCount() {
        return this.saleCount;
    }

    public void setSaleCount(Integer saleCount) {
        this.saleCount = saleCount;
    }


    @Column(name = "ReturnCount")
    public Integer getReturnCount() {
        return this.returnCount;
    }

    public void setReturnCount(Integer returnCount) {
        this.returnCount = returnCount;
    }


    @Column(name = "NetAmount", scale = 4)
    public BigDecimal getNetAmount() {
        return this.netAmount;
    }

    public void setNetAmount(BigDecimal netAmount) {
        this.netAmount = netAmount;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "ReportDate", length = 10)
    public Date getReportDate() {
        return this.reportDate;
    }

    public void setReportDate(Date reportDate) {
        this.reportDate = reportDate;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "FromDate", length = 10)
    public Date getFromDate() {
        return this.fromDate;
    }

    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "ToDate", length = 10)
    public Date getToDate() {
        return this.toDate;
    }

    public void setToDate(Date toDate) {
        this.toDate = toDate;
    }


}


