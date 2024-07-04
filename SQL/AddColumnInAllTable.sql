-- Define variables
DECLARE @tableName NVARCHAR(128);
DECLARE @sqlCommand NVARCHAR(MAX);
DECLARE @constraintName NVARCHAR(128);

-- Cursor to iterate through table names
DECLARE tableCursor CURSOR FOR
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_SCHEMA = 'dbo' AND TABLE_NAME!='Users'; -- Adjust schema if needed

-- Open the cursor
OPEN tableCursor;

-- Fetch the first table name
FETCH NEXT FROM tableCursor INTO @tableName;

-- Loop through each table
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Check if the table already has CreatedBy column
    IF NOT EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_NAME = @tableName
        AND COLUMN_NAME = 'RevisedBy'
    )
    BEGIN
        SET @sqlCommand = 'ALTER TABLE ' + QUOTENAME(@tableName) + 
                          ' ADD RevisedBy INT NULL;';

        EXEC sp_executesql @sqlCommand;
    END

    -- Check if there's an existing FK constraint and generate a unique name
    SET @constraintName = 'FK_' + @tableName + '_User';
    IF NOT EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
        WHERE CONSTRAINT_NAME = @constraintName
    )
    BEGIN
        SET @sqlCommand = 'ALTER TABLE ' + QUOTENAME(@tableName) + 
                          ' ADD CONSTRAINT ' + @constraintName +
                          ' FOREIGN KEY (RevisedBy) REFERENCES Users(UserID);';

        EXEC sp_executesql @sqlCommand;
    END

    -- Fetch the next table name
    FETCH NEXT FROM tableCursor INTO @tableName;
END

-- Close and deallocate the cursor
CLOSE tableCursor;
DEALLOCATE tableCursor;
