Create procedure ETL_LoadCategory_SW
as
Begin
	Insert into Category(CategoryName, created_date)
	Select distinct src_cat.Category, getDate() as created_date 
	from dbo.WWT_STG_SW_ItemCategory src_cat 
	Left join category tgt_cat 
	on src_cat.Category = tgt_cat.CategoryName
	where tgt_cat.ODS_category_id is null 
End

