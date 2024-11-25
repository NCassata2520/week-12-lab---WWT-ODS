
Create procedure ETL_LoadRegion_NW
as
Begin


	insert into Region(RegionDescription,created_date,last_update)
	Select  stg_region.RegionDescription,
	getDate() as created_date, null as last_update
	From dbo.WWT_STG_Region stg_region
	left join Region tgt_region
	on stg_region.RegionID = tgt_region.ODS_region_id
	where tgt_region.ODS_region_id is null
	

End

