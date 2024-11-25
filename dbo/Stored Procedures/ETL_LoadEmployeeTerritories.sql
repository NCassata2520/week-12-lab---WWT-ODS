Create procedure ETL_LoadEmployeeTerritories
as
Begin
	


	insert into EmployeeTerritories(ODS_employee_id, ODS_territories_id)
	Select distinct
	ods_e.ODS_employee_id,
	ods_ter.ODS_territories_id
	from dbo.WWT_STG_EmployeeTerritories stg_et
	left join dbo.WWT_STG_Employees stg_e 
	on stg_e.EmployeeID = stg_et.EmployeeID
	left join Employees ods_e
	on stg_e.LastName = ods_e.LastName
	and stg_e.JobTitle = ods_e.JobTitle
	left Join dbo.WWT_STG_Territories stg_t
	on stg_et.TerritoryID = stg_t.TerritoryID
	left Join Territories ods_ter 
	on stg_t.TerritoryDescription = ods_ter.TerritoryDescription
	left join EmployeeTerritories ods_et
	on ods_e.ODS_employee_id = ods_et.ODS_employee_id
	and ods_ter.ODS_territories_id = ods_et.ODS_territories_id
	where ods_et.ODS_employee_id is null

	Delete from EmployeeTerritories
	From EmployeeTerritories et
	Left join (
		Select distinct
		ods_e.ODS_employee_id,
		ods_t.ODS_territories_id
		from dbo.WWT_STG_EmployeeTerritories stg_et
		join dbo.WWT_STG_Employees stg_e
		on stg_et.EmployeeID = stg_e.EmployeeID
		join Employees ods_e
		on stg_e.LastName = ods_e.LastName
		and stg_e.JobTitle = ods_e.JobTitle
		Join dbo.WWT_STG_Territories stg_t
		on stg_et.TerritoryID = stg_t.TerritoryID
		Join Territories ods_t
		on stg_t.TerritoryDescription = ods_t.TerritoryDescription ) stg
	on et.ODS_territories_id = stg.ODS_territories_id
	and et.ODS_employee_id = stg.ODS_employee_id
	where stg.ODS_employee_id is null

End

