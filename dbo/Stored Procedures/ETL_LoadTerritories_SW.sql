Create procedure ETL_LoadTerritories_SW
as
Begin

	
	update Territories
	set TerritoryDescription = stg_t.TerritoryDescription,
	last_update = getDate()
	From dbo.WWT_STG_Territories stg_t
	join Territories tgt_t
	on stg_t.TerritoryDescription= tgt_t.TerritoryDescription
	Where not (isnull(stg_t.TerritoryDescription, '') = isnull(tgt_t.TerritoryDescription, '')
				
	)

	insert into Territories(TerritoryDescription,ODS_region_id,created_date,last_update)
	Select distinct stg_t.TerritoryDescription,ods_r.ODS_region_id,
	getDate() as created_date, null as last_update
	From dbo.WWT_STG_Territories stg_t
	left join Territories tgt_t
	on stg_t.TerritoryDescription = tgt_t.TerritoryDescription
	left join WWT_STG_Region stg_r
	on stg_r.RegionID = stg_t.RegionID
	left join Region ods_r
	on ods_r.RegionDescription = stg_r.RegionDescription
	where tgt_t.ODS_territories_id is null

End

