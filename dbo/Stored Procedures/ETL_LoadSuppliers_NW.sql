

Create procedure ETL_LoadSuppliers_NW
as
Begin

	
	update Suppliers
	set ContactName = stg_sup.ContactName,
	Phone = stg_sup.Phone,
	CompanyName = stg_sup.CompanyName,
	ContactTitle = stg_sup.ContactTitle,
	Address = stg_sup.Address,
	City = stg_sup.City,
	State = stg_sup.StateOrRegion,
	PostalCode = stg_sup.PostalCode,
	Country = stg_sup.Country,
	Fax = stg_sup.Fax,
	last_update = getDate(),
	SourceID = stg_sup.SupplierID
	From dbo.WWT_STG_Supplier stg_sup
	join Suppliers tgt_sup
	on stg_sup.CompanyName = tgt_sup.CompanyName
	Where not (isnull(stg_sup.CompanyName, '') = isnull(tgt_sup.CompanyName, '')
				and isnull(stg_sup.ContactName, '') = isnull(tgt_sup.ContactName, '')
				and isnull(stg_sup.Phone, '') = isnull(tgt_sup.Phone, '')
				and isnull(stg_sup.ContactTitle, '') = isnull(tgt_sup.ContactTitle, '')
				and isnull(stg_sup.Address, '') = isnull(tgt_sup.Address, '')
				and isnull(stg_sup.City, '') = isnull(tgt_sup.City, '')
				and isnull(stg_sup.StateOrRegion, '') = isnull(tgt_sup.State, '')
				and isnull(stg_sup.PostalCode, '') = isnull(tgt_sup.PostalCode, '')
				and isnull(stg_sup.Country, '') = isnull(tgt_sup.Country, '')
				and isnull(stg_sup.Fax, '') = isnull(tgt_sup.Fax, '')
				and isnull(stg_sup.SupplierID, 0) = isnull(tgt_sup.SourceID, 0)
				
	)

	insert into Suppliers(ContactName,Phone,CompanyName,ContactTitle,Address,City,State,PostalCode,Country,Fax,created_date,last_update, SourceID, SourceName)
	Select distinct 
	stg_sup.ContactName, stg_sup.Phone,
	stg_sup.CompanyName, stg_sup.ContactTitle,
	stg_sup.Address, stg_sup.City,
	stg_sup.StateOrRegion, stg_sup.PostalCode,
	stg_sup.Country, stg_sup.Fax,
	getDate() as created_date, null as last_update,
	stg_sup.SupplierID,
	'NorthWind' as SourceName
	From dbo.WWT_STG_Supplier stg_sup
	left join Suppliers tgt_sup
	on stg_sup.CompanyName = tgt_sup.CompanyName
	and stg_sup.Phone= tgt_sup.Phone
	where tgt_sup.ODS_supplier_id is null

End

