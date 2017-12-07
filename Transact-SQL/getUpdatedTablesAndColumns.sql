SELECT sys.dm_db_index_usage_stats.last_user_update, sys.objects.name as table_name, sys.indexes.name as column_name, sys.dm_db_index_usage_stats.object_id,sys.dm_db_index_usage_stats.index_id, INFORMATION_SCHEMA.COLUMNS.COLUMN_NAME
FROM sys.dm_db_index_usage_stats join sys.objects on sys.dm_db_index_usage_stats.object_id = sys.objects.object_id
join sys.indexes on sys.dm_db_index_usage_stats.index_id = sys.indexes.index_id and sys.dm_db_index_usage_stats.object_id = sys.indexes.object_id
join INFORMATION_SCHEMA.COLUMNS on sys.objects.name = INFORMATION_SCHEMA.COLUMNS.TABLE_NAME
WHERE sys.dm_db_index_usage_stats.last_user_update IS NOT NULL;
