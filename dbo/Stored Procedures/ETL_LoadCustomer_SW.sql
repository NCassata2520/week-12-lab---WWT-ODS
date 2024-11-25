
Create procedure ETL_LoadCustomer_SW
as
Begin

	
	update Customer
	set Phone = stg_customer.PhoneNumber,
	AddressLine1 = stg_address.AddressLine1,
	AddressLine2 = stg_address.AddressLine2,
	City = stg_address.City,
	State = stg_address.State,
	ZipCode = stg_address.ZipCode,
	SW_customerID = stg_customer.CustomerId,
	last_update = getDate()
	From dbo.WWT_STG_SW_Customer stg_customer
	join Customer tgt_customer
	on stg_customer.ContactName = tgt_customer.Name
	join dbo.WWT_STG_SW_Address stg_address
	on stg_address.AddressLine1 = tgt_customer.AddressLine1
	Where not (isnull(stg_customer.PhoneNumber, 0) = isnull(tgt_customer.Phone, 0)
				and isnull(stg_address.AddressLine1, '') = isnull(tgt_customer.AddressLine1, '')
				and isnull(stg_address.AddressLine2, '') = isnull(tgt_customer.AddressLine1, '')
				and isnull(stg_address.City, '') = isnull(tgt_customer.City, '')
				and isnull(stg_address.State, '') = isnull(tgt_customer.State, '')
				and isnull(stg_address.ZipCode,'') = isnull(tgt_customer.ZipCode, '')
				and isnull(stg_customer.CustomerId, 0) = isnull(tgt_customer.SW_customerID, 0)
	)

	insert into Customer(Name,Phone,AddressLine1,AddressLine2,City,State,ZipCode,SW_customerID,created_date,last_update, SourceName)
	Select distinct stg_customer.CustomerName,
	stg_customer.PhoneNumber, stg_address.AddressLine1,
	stg_address.AddressLine2, stg_address.City,
	stg_address.State, stg_address.ZipCode,
	stg_customer.CustomerId,
	getDate() as created_date, null as last_update,
	'SouthWind' as SourceName
	From dbo.WWT_STG_SW_Customer stg_customer
	left join Customer tgt_customer
	on stg_customer.CustomerName = tgt_customer.Name
	and stg_customer.PhoneNumber = tgt_customer.Phone
	left join dbo.WWT_STG_SW_Address stg_address
	on stg_address.AddressLine1 = tgt_customer.AddressLine1
	where tgt_customer.ODS_customer_id is null

End

