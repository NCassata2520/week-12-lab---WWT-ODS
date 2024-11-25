Create procedure ETL_LoadSuppliers_SW
as
Begin

	
	update Suppliers
	set ContactName = stg_sup.ContactName,
	PhoneNumber = stg_sup.PhoneNumber,
	Address = stg_address.AddressLine1,
	State = stg_address.State,
	PostalCode = stg_address.ZipCode,
	City = stg_address.City,
	last_update = getDate(),
	SourceID = stg_sup.SupplierId
	From dbo.WWT_STG_SW_Supplier stg_sup
	join Suppliers tgt_sup
	on stg_sup.SupplierName= tgt_sup.SupplierName
	join dbo.WWT_STG_SW_Address stg_address
	on stg_address.AddressLine1 = tgt_sup.Address
	Where not (isnull(stg_sup.ContactName, '') = isnull(tgt_sup.ContactName, '')
				and isnull(stg_sup.PhoneNumber, '') = isnull(tgt_sup.PhoneNumber, '')
				and isnull(stg_address.AddressLine1, '') = isnull(tgt_sup.Address, '')
				and isnull(stg_address.State, '') = isnull(tgt_sup.State, '')
				and isnull(stg_address.ZipCode, '') = isnull(tgt_sup.PostalCode, '')
				and isnull(stg_address.City, '') = isnull(tgt_sup.City, '')
				and isnull(stg_sup.SupplierId, 0) = isnull(tgt_sup.SourceID, 0)
				
	)

	insert into Suppliers(SupplierName,ContactName,PhoneNumber,Address,State,PostalCode,City,created_date,last_update, SourceID, SourceName)
	Select distinct 
	stg_sup.SupplierName, stg_sup.ContactName, stg_sup.PhoneNumber,
	stg_address.AddressLine1, stg_address.State,
	stg_address.ZipCode, stg_address.City,
	getDate() as created_date, null as last_update,
	stg_sup.SupplierId,
	'SouthWind' as SourceName
	From dbo.WWT_STG_SW_Supplier stg_sup
	left join Suppliers tgt_sup
	on stg_sup.SupplierName = tgt_sup.SupplierName
	and stg_sup.PhoneNumber= tgt_sup.PhoneNumber
	left join dbo.WWT_STG_SW_Address stg_address
	on stg_address.AddressLine1 = tgt_sup.Address
	where tgt_sup.ODS_supplier_id is null

End

