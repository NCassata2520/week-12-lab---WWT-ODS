
Create procedure ETL_LoadEmployees_NW
as
Begin

	
	update Employees
	set FirstName = stg_employees.FirstName,
	JobTitle = stg_employees.JobTitle,
	Title = stg_employees.Title,
	BirthDate = stg_employees.BirthDate,
	HireDate = stg_employees.HireDate,
	TerminationDate = stg_employees.TerminationDate,
	Address = stg_employees.Address,
	City = stg_employees.City,
	State = stg_employees.StateOrRegion,
	PostalCode = stg_employees.PostalCode,
	Country = stg_employees.Country,
	Phone = stg_employees.HomePhone,
	Email = stg_employees.EmailAddress,
	last_update = getDate(),
	SourceID = stg_employees.EmployeeID
	From dbo.WWT_STG_Employees stg_employees
	join Employees tgt_employees
	on stg_employees.LastName = tgt_employees.LastName
	Where not (isnull(stg_employees.FirstName, '') = isnull(tgt_employees.FirstName, '')
				and isnull(stg_employees.JobTitle, '') = isnull(tgt_employees.JobTitle, '')
				and isnull(stg_employees.Title, '') = isnull(tgt_employees.Title, '')
				and isnull(stg_employees.BirthDate, '') = isnull(tgt_employees.BirthDate, '')
				and isnull(stg_employees.HireDate, '') = isnull(tgt_employees.HireDate, '')
				and isnull(stg_employees.TerminationDate, '') = isnull(tgt_employees.TerminationDate, '')
				and isnull(stg_employees.Address, '') = isnull(tgt_employees.Address, '')
				and isnull(stg_employees.City, '') = isnull(tgt_employees.City, '')
				and isnull(stg_employees.StateOrRegion, '') = isnull(tgt_employees.State, '')
				and isnull(stg_employees.PostalCode,'') = isnull(tgt_employees.PostalCode, '')
				and isnull(stg_employees.Country, '') = isnull(tgt_employees.Country, '')
				and isnull(stg_employees.HomePhone, '') = isnull(tgt_employees.Phone, '')
				and isnull(stg_employees.EmailAddress, '') = isnull(tgt_employees.Email, '')
				and isnull(stg_employees.EmployeeID, 0) = isnull(tgt_employees.SourceID, 0)
	)

	insert into Employees(LastName,FirstName,JobTitle,Title,BirthDate,HireDate,TerminationDate,Address,City,State,PostalCode,Country,Phone,Email,created_date,last_update, SourceID, SourceName)
	Select distinct stg_employees.LastName,
	stg_employees.FirstName, stg_employees.JobTitle,
	stg_employees.Title, stg_employees.BirthDate,
	stg_employees.HireDate, stg_employees.TerminationDate,
	stg_employees.Address,stg_employees.City,stg_employees.StateOrRegion,
	stg_employees.PostalCode,stg_employees.Country,
	stg_employees.HomePhone,stg_employees.EmailAddress,
	getDate() as created_date, null as last_update,
	stg_employees.EmployeeID,
	'NorthWind' as SourceName
	From dbo.WWT_STG_Employees stg_employees
	left join Employees tgt_employees
	on stg_employees.LastName = tgt_employees.LastName
	and stg_employees.EmailAddress = tgt_employees.Email
	where tgt_employees.ODS_employee_id is null

End

