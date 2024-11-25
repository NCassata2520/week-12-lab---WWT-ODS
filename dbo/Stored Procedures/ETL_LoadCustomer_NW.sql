Create procedure ETL_LoadCustomer_NW
as
Begin

	
	update Customer
	set Phone = stg_customer.Phone,
	AddressLine1 = stg_customer.Address,
	CompanyName = stg_customer.CompanyName,
	ContactTitle = stg_customer.ContactTitle,
	City = stg_customer.City,
	State = stg_customer.Region,
	ZipCode = stg_customer.PostalCode,
	NW_customerID = stg_customer.CustomerID,
	last_update = getDate()
	From dbo.WWT_STG_Customer stg_customer
	join Customer tgt_customer
	on stg_customer.ContactName = tgt_customer.Name
	Where not (isnull(stg_customer.Phone, '') = isnull(tgt_customer.Phone, '')
				and isnull(stg_customer.Address, '') = isnull(tgt_customer.AddressLine1, '')
				and isnull(stg_customer.CompanyName, '') = isnull(tgt_customer.CompanyName, '')
				and isnull(stg_customer.ContactTitle, '') = isnull(tgt_customer.ContactTitle, '')
				and isnull(stg_customer.City, '') = isnull(tgt_customer.City, '')
				and isnull(stg_customer.Region,'') = isnull(tgt_customer.State, '')
				and isnull(stg_customer.PostalCode,'') = isnull(tgt_customer.ZipCode,'')
				and isnull(stg_customer.CustomerID, 0) = isnull(tgt_customer.NW_customerID, 0)
	)

	insert into Customer(Name,Phone,AddressLine1,CompanyName,ContactTitle
		  ,City,State,ZipCode,NW_customerID,created_date,last_update, SourceName)
	Select distinct stg_customer.ContactName,
	stg_customer.Phone, stg_customer.Address,
	stg_customer.CompanyName, stg_customer.ContactTitle,
	stg_customer.City, stg_customer.Region,
	stg_customer.PostalCode, stg_customer.CustomerID,
	getDate() as created_date, null as last_update,
	'NorthWind' as SourceName
	From dbo.WWT_STG_Customer stg_customer
	left join Customer tgt_customer
	on stg_customer.ContactName = tgt_customer.Name
	and stg_customer.Phone = tgt_customer.Phone
	where tgt_customer.ODS_customer_id is null

End

