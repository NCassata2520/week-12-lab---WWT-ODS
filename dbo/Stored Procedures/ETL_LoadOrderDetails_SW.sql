
Create procedure ETL_LoadOrderDetails_SW
as
Begin

	
	update OrderDetails
	set Price = stg_o.UnitPrice,
	Quantity = stg_o.Quantity,
	TaxRate = stg_o.TaxRate,
	last_update = getDate()
	From dbo.WWT_STG_SW_OrderLine stg_o
	join OrderDetails tgt_o
	on stg_o.OrderID = tgt_o.SourceOrderDetailID
	Where not (isnull(stg_o.UnitPrice, 0) = isnull(tgt_o.Price, 0)
				and isnull(stg_o.Quantity, 0) = isnull(tgt_o.Quantity, 0)
				and isnull(stg_o.TaxRate, 0) = isnull(tgt_o.TaxRate, 0)
				and isnull(stg_o.OrderID, 0) = isnull(tgt_o.SourceOrderDetailID, 0)
				
	)

	insert into OrderDetails(ODS_order_id,ODS_product_id,Price,Quantity,TaxRate, SourceOrderDetailID,created_date,last_update, SourceName)
	Select distinct ods_or.ODS_order_id,ods_p.ODS_product_id,
	stg_o.UnitPrice, stg_o.Quantity, stg_o.TaxRate,stg_o.OrderLineId,
	getDate() as created_date, null as last_update,
	'SouthWind' as SourceName
	From dbo.WWT_STG_SW_OrderLine stg_o
	left join OrderDetails tgt_o
	on stg_o.OrderId = tgt_o.ODS_orderdetails_id
	left join WWT_STG_SW_OrderHeader stg_or
	on stg_or.OrderId = stg_o.OrderId
	left join WWT_STG_SW_StockItem stg_p
	on stg_p.StockItemId = stg_o.StockItemId
	left join Product ods_p
	on ods_p.SourceID = stg_p.StockItemId
	left join Orders ods_or
	on ods_or.SourceOrderID = stg_or.OrderId
	where tgt_o.ODS_orderdetails_id is null

End

