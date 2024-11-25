
Create procedure ETL_LoadEmployees_SW
as
Begin

	
	update Employees
	set FirstName = stg_employees.FirstName,
	Phone = stg_employees.PhoneNumber,
	Email = stg_employees.Email,
	last_update = getDate(),
	SourceID = stg_employees.SalesPersonId
	From dbo.WWT_STG_SW_SalesPerson stg_employees
	join Employees tgt_employees
	on stg_employees.LastName = tgt_employees.LastName
	Where not (isnull(stg_employees.FirstName, '') = isnull(tgt_employees.FirstName, '')
				and isnull(stg_employees.PhoneNumber, 0) = isnull(tgt_employees.Phone, 0)
				and isnull(stg_employees.Email, '') = isnull(tgt_employees.Email, '')
				and isnull(stg_employees.SalesPersonId, 0) = isnull(tgt_employees.SourceID, 0)
	)

	insert into Employees(LastName,FirstName,Phone,Email,created_date,last_update, SourceID, SourceName)
	Select distinct stg_employees.LastName,
	stg_employees.FirstName, stg_employees.PhoneNumber,
	stg_employees.Email,
	getDate() as created_date, null as last_update,
	stg_employees.SalesPersonId,
	'SouthWind' as SourceName
	From dbo.WWT_STG_SW_SalesPerson stg_employees
	left join Employees tgt_employees
	on stg_employees.LastName = tgt_employees.LastName
	and stg_employees.Email= tgt_employees.Email
	where tgt_employees.ODS_employee_id is null

End

