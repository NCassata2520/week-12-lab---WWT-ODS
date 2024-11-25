
Create procedure ETL_LoadOrders_NW
as
Begin

	
	update Orders
	set OrderDate = stg_o.OrderDate,
	RequiredDate = stg_o.RequiredDate,
	ShippedDate = stg_o.ShippedDate,
	Freight = stg_o.Freight,
	ShipName = stg_o.ShipName,
	ShipAddress = stg_o.ShipAddress,
	ShipCity = stg_o.ShipCity,
	ShipState = stg_o.ShipStateOrRegion,
	ShipPostalCode = stg_o.ShipPostalCode,
	ShipCountry = stg_o.ShipCountry,
	SourceOrderID = stg_o.OrderID,
	last_update = getDate()
	From dbo.WWT_STG_Order stg_o
	join Orders tgt_o
	on stg_o.OrderID = tgt_o.SourceOrderID
	Where not (isnull(stg_o.OrderDate, '') = isnull(tgt_o.OrderDate, '')
				and isnull(stg_o.RequiredDate, '') = isnull(tgt_o.RequiredDate, '')
				and isnull(stg_o.ShippedDate, '') = isnull(tgt_o.ShippedDate, '')
				and isnull(stg_o.Freight, 0) = isnull(tgt_o.Freight, 0)
				and isnull(stg_o.ShipName, '') = isnull(tgt_o.ShipName, '')
				and isnull(stg_o.ShipAddress, '') = isnull(tgt_o.ShipAddress, '')
				and isnull(stg_o.ShipCity, '') = isnull(tgt_o.ShipCity, '')
				and isnull(stg_o.ShipStateOrRegion, '') = isnull(tgt_o.ShipState, '')
				and isnull(stg_o.ShipPostalCode, '') = isnull(tgt_o.ShipPostalCode, '')
				and isnull(stg_o.ShipCountry, '') = isnull(tgt_o.ShipCountry, '')
				and isnull(stg_o.OrderID, 0) = isnull(tgt_o.SourceOrderID, 0)
				
	)

	insert into Orders(ODS_customer_id,ODS_employee_id,OrderDate,RequiredDate,ShippedDate,Freight,ShipName,ShipAddress,ShipCity,ShipState,ShipPostalCode,ShipCountry,SourceOrderID,created_date,last_update, SourceName)
	Select distinct ods_c.ODS_customer_id,ods_e.ODS_employee_id,
	stg_o.OrderDate, stg_o.RequiredDate, stg_o.ShippedDate,
	stg_o.Freight, stg_o.ShipName,
	stg_o.ShipAddress, stg_o.ShipCity,
	stg_o.ShipStateOrRegion,stg_o.ShipPostalCode,
	stg_o.ShipCountry,stg_o.OrderID,
	getDate() as created_date, null as last_update,
	'NorthWind' as SourceName
	From dbo.WWT_STG_Order stg_o
	left join Orders tgt_o
	on stg_o.OrderDate = tgt_o.OrderDate
	and stg_o.ShipAddress = tgt_o.ShipAddress
	and stg_o.ShipName = tgt_o.ShipName
	left join WWT_STG_Employees stg_e
	on stg_e.EmployeeID = stg_o.EmployeeID
	left join WWT_STG_Customer stg_c
	on stg_c.CustomerID = stg_o.CustomerID
	left join Customer ods_c
	on stg_c.CustomerID = ods_c.NW_customerID
	left join Employees ods_e
	on stg_e.EmployeeID = ods_e.SourceID
	where tgt_o.ODS_order_id is null

End

