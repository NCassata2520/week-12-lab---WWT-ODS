Create procedure ETL_LoadOrders_SW
as
Begin

	
	update Orders
	set OrderDate = stg_o.OrderDate,
	ShippedDate = stg_o.ShipDate,
	PurchaseOrderNumber = stg_o.CustomerPurchaseOrderNumber,
	SourceOrderID = stg_o.OrderID,
	last_update = getDate()
	From dbo.WWT_STG_SW_OrderHeader stg_o
	join Orders tgt_o
	on stg_o.OrderID = tgt_o.SourceOrderID
	Where not (isnull(stg_o.OrderDate, '') = isnull(tgt_o.OrderDate, '')
				and isnull(stg_o.ShipDate, '') = isnull(tgt_o.ShippedDate, '')
				and isnull(stg_o.CustomerPurchaseOrderNumber, '') = isnull(tgt_o.PurchaseOrderNumber, 0)
				and isnull(stg_o.OrderID, 0) = isnull(tgt_o.SourceOrderID, 0)
				
	)

	insert into Orders(ODS_customer_id,ODS_employee_id,OrderDate,ShippedDate,PurchaseOrderNumber,SourceOrderID,created_date,last_update, SourceName)
	Select distinct ods_c.ODS_customer_id,ods_e.ODS_employee_id,
	stg_o.OrderDate, stg_o.ShipDate,
	stg_o.CustomerPurchaseOrderNumber, stg_o.OrderID,
	getDate() as created_date, null as last_update,
	'SouthWind' as SourceName
	From dbo.WWT_STG_SW_OrderHeader stg_o
	left join Orders tgt_o
	on stg_o.OrderDate = tgt_o.OrderDate
	and stg_o.ShipDate = tgt_o.ShippedDate
	and stg_o.CustomerPurchaseOrderNumber = tgt_o.PurchaseOrderNumber
	left join WWT_STG_SW_SalesPerson stg_e
	on stg_e.SalesPersonId = stg_o.SalesPersonId
	left join WWT_STG_SW_Customer stg_c
	on stg_c.CustomerID = stg_o.CustomerID
	left join Employees ods_e
	on ods_e.SourceID = stg_e.SalesPersonId
	left join Customer ods_c
	on ods_c.SW_customerID = stg_c.CustomerId
	where tgt_o.ODS_order_id is null

End

