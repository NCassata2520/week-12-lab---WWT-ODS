
Create procedure ETL_LoadOrderDetails_NW
as
Begin

	
	update OrderDetails
	set Price = stg_o.UnitPrice,
	Quantity = stg_o.Quantity,
	Discount = stg_o.Discount,
	last_update = getDate()
	From dbo.WWT_STG_OrderDetails stg_o
	join OrderDetails tgt_o
	on stg_o.OrderID = tgt_o.SourceOrderDetailID
	Where not (isnull(stg_o.UnitPrice, 0) = isnull(tgt_o.Price, 0)
				and isnull(stg_o.Quantity, 0) = isnull(tgt_o.Quantity, 0)
				and isnull(stg_o.Discount, 0) = isnull(tgt_o.Discount, 0)
				and isnull(stg_o.OrderID, 0) = isnull(tgt_o.SourceOrderDetailID, 0)
				
	)

	insert into OrderDetails(ODS_order_id,ODS_product_id,Price,Quantity,Discount, SourceOrderDetailID,created_date,last_update, SourceName)
	Select distinct ods_or.ODS_order_id,ods_p.ODS_product_id,
	stg_o.UnitPrice, stg_o.Quantity, stg_o.Discount,
	stg_o.OrderID,
	getDate() as created_date, null as last_update,
	'NorthWind' as SourceName
	From dbo.WWT_STG_OrderDetails stg_o
	left join OrderDetails tgt_o
	on stg_o.OrderID = tgt_o.ODS_orderdetails_id
	left join WWT_STG_Order stg_or
	on stg_or.OrderID = stg_o.OrderID
	left join WWT_STG_Product stg_p
	on stg_p.ProductID = stg_o.ProductID
	left join Product ods_p
	on ods_p.SourceID = stg_p.ProductID
	left join Orders ods_or
	on ods_or.SourceOrderID = stg_or.OrderID
	where tgt_o.ODS_orderdetails_id is null

End

