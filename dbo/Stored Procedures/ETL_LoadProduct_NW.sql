Create procedure ETL_LoadProduct_NW
as
Begin

	
	update Product
	set ProductName = stg_p.UnitPrice,
	UnitPrice = stg_p.UnitPrice,
	WholesalePrice = stg_p.WholesalePrice,
	UnitsInStock = stg_p.UnitsInStock,
	UnitsOnOrder = stg_p.UnitsOnOrder,
	ReorderLevel = stg_p.ReorderLevel,
	Discontinued = stg_p.Discontinued,
	last_update = getDate(),
	SourceID = stg_p.ProductID
	From dbo.WWT_STG_Product stg_p
	join Product tgt_p
	on stg_p.ProductName = tgt_p.ProductName
	Where not (isnull(stg_p.ProductName, '') = isnull(tgt_p.ProductName, '')
				and isnull(stg_p.UnitPrice, 0) = isnull(tgt_p.UnitPrice, 0)
				and isnull(stg_p.WholesalePrice, 0) = isnull(tgt_p.WholesalePrice, 0)
				and isnull(stg_p.UnitsInStock, 0) = isnull(tgt_p.UnitsInStock, 0)
				and isnull(stg_p.UnitsOnOrder, 0) = isnull(tgt_p.UnitsOnOrder, 0)
				and isnull(stg_p.ReorderLevel, 0) = isnull(tgt_p.ReorderLevel, 0)
				and isnull(stg_p.Discontinued, 0) = isnull(tgt_p.Discontinued, 0)
				and isnull(stg_p.ProductID, 0) = isnull(tgt_p.SourceID, 0)
				
	)

	insert into Product(ODS_supplier_id,ProductName,UnitPrice,ODS_category_id,WholesalePrice, UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued,created_date,last_update, SourceID, SourceName)
	Select distinct ods_s.ODS_supplier_id,stg_p.ProductName,
	stg_p.UnitPrice, ods_c.ODS_category_id, stg_p.WholesalePrice,stg_p.UnitsInStock,stg_p.UnitsOnOrder,
	stg_p.ReorderLevel,stg_p.Discontinued,
	getDate() as created_date, null as last_update,
	stg_p.ProductID,
	'NorthWind' as SourceName
	From dbo.WWT_STG_Product stg_p
	left join Product tgt_p
	on stg_p.ProductName = tgt_p.ProductName
	left join WWT_STG_Supplier stg_s
	on stg_s.SupplierID = stg_p.SupplierID
	left join WWT_STG_Category stg_c
	on stg_c.CategoryID = stg_p.CategoryID
	left join Suppliers ods_s
	on ods_s.SourceID = stg_s.SupplierID
	left join Category ods_c
	on ods_c.CategoryName = stg_c.CategoryName
	where tgt_p.ODS_product_id is null

End

