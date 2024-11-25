Create procedure ETL_LoadCategory_NW
as
Begin
	Insert into Category(CategoryName, Description, created_date)
	Select distinct src_cat.CategoryName, src_cat.Description, getDate() as created_date 
	from dbo.WWT_STG_Category src_cat 
	Left join category tgt_cat 
	on src_cat.CategoryName = tgt_cat.CategoryName
	where tgt_cat.ODS_category_id is null 
End

