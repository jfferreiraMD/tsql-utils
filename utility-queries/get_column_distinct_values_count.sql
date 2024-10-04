-- Count Distinct Values in Any Table and Column
-- Usage: Replace @TableName and @ColumnName with your desired values

DECLARE @TableName NVARCHAR(128) = 'YourTableName';
DECLARE @ColumnName NVARCHAR(128) = 'YourColumnName';
DECLARE @Schema NVARCHAR(128) = 'dbo';

DECLARE @SQL NVARCHAR(MAX);

SET @SQL = N'
SELECT COUNT(DISTINCT ' + QUOTENAME(@ColumnName) + N') AS DistinctCount
FROM ' + QUOTENAME(@Schema) + N'.' + QUOTENAME(@TableName) + N';';

PRINT @SQL;

EXEC sp_executesql @SQL;