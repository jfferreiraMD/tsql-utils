-- Utility query to get the name of tables that contain a column name
-- Usage: Replace 'YourSearchTermHere' with your table name

DECLARE @ColumnSearchTerm NVARCHAR(126) = 'YourSearchTermHere';

DECLARE @ColumnNamePattern NVARCHAR(128) = '%' + @ColumnSearchTerm + '%';

SELECT
    c.name AS 'ColumnName',
    (SCHEMA_NAME(t.schema_id) + '.' + t.name) AS 'TableName'
FROM
    sys.columns c
JOIN
    sys.tables t ON c.object_id = t.object_id
WHERE
    c.name LIKE @ColumnNamePattern
ORDER BY
    TableName,
    ColumnName;