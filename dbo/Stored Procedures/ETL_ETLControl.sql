Create   procedure ETL_ETLControl
as
Begin
	set nocount on -- supresses output of rows affected

	Exec ETL_LoadCategory_NW
	Exec ETL_LoadCategory_SW
	Exec ETL_LoadCustomer_NW
	Exec ETL_LoadCustomer_SW
	Exec ETL_LoadEmployees_NW
	Exec ETL_LoadEmployees_SW
	Exec ETL_LoadRegion_NW
	Exec ETL_LoadSuppliers_NW
	Exec ETL_LoadSuppliers_SW
	Exec ETL_LoadTerritories_SW
	Exec ETL_LoadProduct_NW
	Exec ETL_LoadProduct_SW --Error
	Exec ETL_LoadOrders_NW --Error
	Exec ETL_LoadOrders_SW
	Exec ETL_LoadOrderDetails_NW
	Exec ETL_LoadOrderDetails_SW
	Exec ETL_LoadEmployeeTerritories



End