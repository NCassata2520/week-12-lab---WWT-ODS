
Create procedure ETL_LoadProduct_SW
as
Begin

	
	update Product
	set ProductName = stg_p.StockItemName,
	UnitPrice = stg_p.RetailPrice,
	Color = stg_p.Color,
	Size = stg_p.Size,
	Discontinued = stg_p.IsActive,
	last_update = getDate(),
	SourceID = stg_p.StockItemId
	From dbo.WWT_STG_SW_StockItem stg_p
	join Product tgt_p
	on stg_p.StockItemName= tgt_p.ProductName
	Where not (isnull(stg_p.StockItemName, '') = isnull(tgt_p.ProductName, '')
				and isnull(stg_p.RetailPrice, 0) = isnull(tgt_p.UnitPrice, 0)
				and isnull(stg_p.Color, '') = isnull(tgt_p.Color, '')
				and isnull(stg_p.Size, '') = isnull(tgt_p.Size, '')
				and isnull(stg_p.IsActive, 0) = isnull(tgt_p.Discontinued, 0)
				and isnull(stg_p.StockItemId, 0) = isnull(tgt_p.SourceID, 0)
				
	)

	insert into Product(ODS_supplier_id,ProductName,UnitPrice,ODS_category_id,Color, Size,Discontinued,created_date,last_update, SourceID, SourceName)
	Select distinct ods_s.ODS_supplier_id,stg_p.StockItemName,
	stg_p.RetailPrice, ods_c.ODS_category_id, stg_p.Color,stg_p.Size,stg_p.IsActive,
	getDate() as created_date, null as last_update,
	stg_p.StockItemId, 'SouthWind' as SourceName
	From dbo.WWT_STG_SW_StockItem stg_p
	left join Product tgt_p
	on stg_p.StockItemName = tgt_p.ProductName
	left join WWT_STG_SW_Supplier stg_s
	on stg_s.SupplierId = stg_p.SupplierId
	left join WWT_STG_SW_ItemCategory stg_c
	on stg_c.CategoryId = stg_p.ItemCategoryId
	left join Suppliers ods_s
	on ods_s.SourceID = stg_s.SupplierId
	left join Category ods_c
	on ods_c.CategoryName = stg_c.Category
	where tgt_p.ODS_product_id is null

End

