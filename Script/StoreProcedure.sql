USE [CardProcessing]
GO

/****** Object:  StoredProcedure [dbo].[sp_ReportMerchant]    Script Date: 6/12/2017 1:57:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ReportMerchant]
@merchantid int = null,
@cardtype int = null,
@fromdate date = null, 
@todate date = null,
@parentid int = null
as
begin
	declare @SaAm money,@SaCo money, @ReAm money, @ReCo money

	select @SaAm = isnull(sale.SaleAmount,0), @SaCo = isnull(sale.SaleCount,0), @ReAm = isnull(re.ReturnAmount,0), @ReCo = isnull(re.ReturnCount,0)
	from 
		(select Sum(td.UnitPrice * td.Quantity) as SaleAmount, Sum(td.Quantity) as SaleCount
		from TransactionDetails td, Card c
		where 
		td.MerchantId = @merchantid and 
		c.CardNumber = td.CardNumber and 
		td.TransactionTypeId = 1 and
		c.CardTypeId = @cardtype and
		td.TransactionTime between @fromdate and @todate) sale, (select Sum(td.UnitPrice * td.Quantity) as ReturnAmount, sum(td.Quantity) as ReturnCount
	from TransactionDetails td, Card c
	where 
		td.MerchantId = @merchantid and 
		c.CardNumber = td.CardNumber and
		td.TransactionTypeId = 2 and
		c.CardTypeId = @cardtype and
		td.TransactionTime between @fromdate and @todate) re

	Insert into Report_Merchant(MerchantId, CardType, SaleAmount, SaleCount, ReturnAmount, ReturnCount, NetAmount, ReportDate, FromDate, ToDate, ParentReportId)
	values (@merchantid, @cardtype, @SaAm, @SaCo, @ReAm, @ReCo, @SaAm - @ReAm, GETDATE(), @fromdate, @todate, @parentid)
end

GO

/****** Object:  StoredProcedure [dbo].[sp_ReportAgent]    Script Date: 6/12/2017 1:57:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


------------------------------------------------------
------------------------------------------------------
------------------------------------------------------



CREATE proc [dbo].[sp_ReportAgent]
@agentid int = null,
@cardtype int = null,
@fromdate date = null, 
@todate date = null,
@parentid int = null
as
begin
	declare @SaAm money,@SaCo money, @ReAm money, @ReCo money

	select @SaAm = isnull(sale.SaleAmount,0), @SaCo = isnull(sale.SaleCount,0), @ReAm = isnull(re.ReturnAmount,0), @ReCo = isnull(re.ReturnCount,0)
	from 
		(select Sum(td.UnitPrice * td.Quantity) as SaleAmount, Sum(td.Quantity) as SaleCount
		from TransactionDetails td, Merchant m, Card c
		where 
		td.MerchantId = m.MerchantId and 
		c.CardNumber = td.CardNumber and
		m.AgentId = @agentid and  
		td.TransactionTypeId = 1 and
		c.CardTypeId = @cardtype and
		td.TransactionTime between @fromdate and @todate) sale, (select Sum(td.UnitPrice * td.Quantity) as ReturnAmount, sum(td.Quantity) as ReturnCount
	from TransactionDetails td, Merchant m, Card c
	where 
		td.MerchantId = m.MerchantId and 
		c.CardNumber = td.CardNumber and
		m.AgentId = @agentid and 
		td.TransactionTypeId = 2 and
		c.CardTypeId = @cardtype and
		td.TransactionTime between @fromdate and @todate) re

	Insert into Report_Agent(AgentId, CardType, SaleAmount, SaleCount, ReturnAmount, ReturnCount, NetAmount, ReportDate, FromDate, ToDate, ParentReportId)
	values (@agentid, @cardtype, @SaAm, @SaCo, @ReAm, @ReCo, @SaAm - @ReAm, GETDATE(), @fromdate, @todate, @parentid)
	------------------------------------------------------
	declare @reportid int
	set @reportid = @@IDENTITY

	declare @merchantid int

	declare cur_Agent cursor for (SELECT MerchantId FROM Merchant WHERE AgentId = @agentid)

	open cur_Agent
	FETCH NEXT FROM cur_Agent INTO @merchantid

	WHILE @@FETCH_STATUS = 0  
	BEGIN
		exec sp_ReportMerchant @merchantid, @cardtype, @fromdate, @todate, @reportid
		FETCH NEXT FROM cur_Agent INTO @merchantid
	END

	close cur_Agent
	DEALLOCATE cur_Agent

end

GO
/****** Object:  StoredProcedure [dbo].[sp_ReportMaster]    Script Date: 6/12/2017 1:57:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


------------------------------------------------------
------------------------------------------------------
------------------------------------------------------


CREATE proc [dbo].[sp_ReportMaster]
@masterid int = null,
@cardtype int = null,
@fromdate date = null, 
@todate date = null
as
begin
	-------------------------------------------------------
	declare @SaAm money,@SaCo money, @ReAm money, @ReCo money

	select @SaAm = isnull(sale.SaleAmount,0), @SaCo = isnull(sale.SaleCount,0), @ReAm = isnull(re.ReturnAmount,0), @ReCo = isnull(re.ReturnCount,0)
	from 
		(select Sum(td.UnitPrice * td.Quantity) as SaleAmount, Sum(td.Quantity) as SaleCount
		from TransactionDetails td, Agent a, Merchant m, Card c
		where 
		td.MerchantId = m.MerchantId and 
		a.AgentId = m.AgentId and 
		c.CardNumber = td.CardNumber and
		a.MasterId = @masterid and 
		td.TransactionTypeId = 1 and
		c.CardTypeId = @cardtype and
		td.TransactionTime between @fromdate and @todate) sale, (select Sum(td.UnitPrice * td.Quantity) as ReturnAmount, sum(td.Quantity) as ReturnCount
	from TransactionDetails td, Agent a, Merchant m, Card c
	where 
		td.MerchantId = m.MerchantId and 
		a.AgentId = m.AgentId and 
		c.CardNumber = td.CardNumber and
		a.MasterId = @masterid 
		and td.TransactionTypeId = 2 and
		c.CardTypeId = @cardtype and
		td.TransactionTime between @fromdate and @todate) re

	Insert into Report_Master(MasterId, CardType, SaleAmount, SaleCount, ReturnAmount, ReturnCount, NetAmount, ReportDate, FromDate, ToDate)
	values(@masterid, @cardtype, @SaAm, @SaCo, @ReAm, @ReCo, @SaAm - @ReAm, GETDATE(), @fromdate, @todate)

	------------------------------------------------------
	declare @reportid int
	set @reportid = @@IDENTITY

	declare @agentid int
	declare cur_Master cursor for (SELECT AgentId FROM Agent WHERE MasterId = @masterid)

	open cur_Master
	FETCH NEXT FROM cur_Master INTO @agentid

	WHILE @@FETCH_STATUS = 0  
	BEGIN
		exec sp_ReportAgent @agentid, @cardtype, @fromdate, @todate, @reportid
		FETCH NEXT FROM cur_Master INTO @agentid
	END

	close cur_Master
	DEALLOCATE cur_Master

end

GO

/****** Object:  StoredProcedure [dbo].[sp_GetReportMaster]    Script Date: 6/12/2017 1:57:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


------------------------------------------------------
------------------------------------------------------
------------------------------------------------------


create proc [dbo].[sp_GetReportMaster]
@masterid int = null,
@fromdate date = null, 
@todate date = null,
@querynew bit = 1
as
begin
	if (@querynew = 0)
	begin
		delete from Report_Master where MasterId = @masterid and FromDate = @fromdate and ToDate = @todate
		declare @cardtype int
		declare cur_typemt cursor for SELECT CardTypeId FROM CardType
		open cur_typemt
		FETCH NEXT FROM cur_typemt INTO @cardtype

		WHILE @@FETCH_STATUS = 0  
		BEGIN
			exec sp_ReportMaster @masterid, @cardtype, @fromdate, @todate
			FETCH NEXT FROM cur_typemt INTO @cardtype
		END

		close cur_typemt
		DEALLOCATE cur_typemt
		
		select * from Report_Master where MasterId = @masterid and FromDate = @fromdate and ToDate = @todate
	end
	else
		begin
			if Exists(select * from Report_Master where MasterId = @masterid and FromDate = @fromdate and ToDate = @todate)
			begin
				select * from Report_Master where MasterId = @masterid and FromDate = @fromdate and ToDate = @todate
			end
			else
				begin
					declare @cardtypeid int
					declare cur_typemt2 cursor for SELECT CardTypeId FROM CardType
					open cur_typemt2
					FETCH NEXT FROM cur_typemt2 INTO @cardtypeid

					WHILE @@FETCH_STATUS = 0  
					BEGIN
						exec sp_ReportMaster @masterid, @cardtypeid, @fromdate, @todate
						FETCH NEXT FROM cur_typemt2 INTO @cardtypeid
					END

					close cur_typemt2
					DEALLOCATE cur_typemt2
		
					select * from Report_Master where MasterId = @masterid and FromDate = @fromdate and ToDate = @todate
				end
		end
end

GO

/****** Object:  StoredProcedure [dbo].[sp_GetReportAgent]    Script Date: 6/12/2017 1:57:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


------------------------------------------------------
------------------------------------------------------
------------------------------------------------------


create proc [dbo].[sp_GetReportAgent]
@agentid int = null,
@fromdate date = null, 
@todate date = null,
@querynew bit = 1
as
begin
	if (@querynew = 0)
	begin
		delete from Report_Agent where AgentId = @agentid and FromDate = @fromdate and ToDate = @todate
		declare @cardtype int
		declare cur_typeag cursor for SELECT CardTypeId FROM CardType
		open cur_typeag
		FETCH NEXT FROM cur_typeag INTO @cardtype

		WHILE @@FETCH_STATUS = 0  
		BEGIN
			exec sp_ReportAgent @agentid, @cardtype, @fromdate, @todate
			FETCH NEXT FROM cur_typeag INTO @cardtype
		END

		close cur_typeag
		DEALLOCATE cur_typeag
		
		select * from Report_Agent where AgentId = @agentid and FromDate = @fromdate and ToDate = @todate
	end
	else
		begin
			if Exists(select * from Report_Agent where AgentId = @agentid and FromDate = @fromdate and ToDate = @todate)
			begin
				select * from Report_Agent where AgentId = @agentid and FromDate = @fromdate and ToDate = @todate
			end
			else
				begin
					declare @cardtypeid int
					declare cur_typeag2 cursor for SELECT CardTypeId FROM CardType
					open cur_typeag2
					FETCH NEXT FROM cur_typeag2 INTO @cardtypeid

					WHILE @@FETCH_STATUS = 0  
					BEGIN
						exec sp_ReportAgent @agentid, @cardtypeid, @fromdate, @todate
						FETCH NEXT FROM cur_typeag2 INTO @cardtypeid
					END

					close cur_typeag2
					DEALLOCATE cur_typeag2
		
					select * from Report_Agent where AgentId = @agentid and FromDate = @fromdate and ToDate = @todate
				end
		end
end

GO

/****** Object:  StoredProcedure [dbo].[sp_GetReportMerchant]    Script Date: 6/12/2017 1:57:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



------------------------------------------------------
------------------------------------------------------
------------------------------------------------------



create proc [dbo].[sp_GetReportMerchant]
@merchantid int = null,
@fromdate date = null, 
@todate date = null,
@querynew bit = 1
as
begin
	if (@querynew = 0)
	begin
		delete from Report_Merchant where MerchantId = @merchantid and FromDate = @fromdate and ToDate = @todate
		declare @cardtype int
		declare cur_typemc cursor for SELECT CardTypeId FROM CardType
		open cur_typemc
		FETCH NEXT FROM cur_typemc INTO @cardtype

		WHILE @@FETCH_STATUS = 0  
		BEGIN
			exec sp_ReportMerchant @merchantid, @cardtype, @fromdate, @todate
			FETCH NEXT FROM cur_typemc INTO @cardtype
		END

		close cur_typemc
		DEALLOCATE cur_typemc
		
		select * from Report_Merchant where MerchantId = @merchantid and FromDate = @fromdate and ToDate = @todate
	end
	else
		begin
			if Exists(select * from Report_Merchant where MerchantId = @merchantid and FromDate = @fromdate and ToDate = @todate)
			begin
				select * from Report_Merchant where MerchantId = @merchantid and FromDate = @fromdate and ToDate = @todate
			end
			else
				begin
					declare @cardtypeid int
					declare cur_typemc2 cursor for SELECT CardTypeId FROM CardType
					open cur_typemc2
					FETCH NEXT FROM cur_typemc2 INTO @cardtypeid

					WHILE @@FETCH_STATUS = 0  
					BEGIN
						exec sp_ReportMerchant @merchantid, @cardtypeid, @fromdate, @todate
						FETCH NEXT FROM cur_typemc2 INTO @cardtypeid
					END

					close cur_typemc2
					DEALLOCATE cur_typemc2
		
					select * from Report_Merchant where MerchantId = @merchantid and FromDate = @fromdate and ToDate = @todate
				end
		end
end

GO