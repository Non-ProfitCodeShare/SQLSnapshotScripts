-- This creates a snapshot in the folder that it is specified. 
-- Author: Nolan Regenwether

Use master;
Go
DECLARE @DBNAME nvarchar(255) = 'BBInfinity'
DECLARE @FOLDER nvarchar(512) = 'C:\SnapshotDirectory\'
DECLARE @SNAPSHOTNAME nvarchar(255) = 'BBInfinity_Snapshot_beforenotes'



--- This Section Creates the path that will be used to store this database. 
DECLARE @DIRTREE TABLE (SUBDIRECTORY NVARCHAR(255), DEPTH INT)
SET @FOLDER = @FOLDER + @SNAPSHOTNAME + '\'
INSERT INTO @DIRTREE(SUBDIRECTORY, DEPTH)
EXEC MASTER.SYS.XP_DIRTREE @FOLDER
IF NOT EXISTS (SELECT 1 FROM @DIRTREE WHERE SUBDIRECTORY = @DBNAME)
EXEC MASTER.DBO.XP_CREATE_SUBDIR @FOLDER
DELETE FROM @DIRTREE
--- End creating the folder the snapshot will reside in






Execute dbo.SNAPSHOTTHEDB @DBNAME , @FOLDER , @SNAPSHOTNAME 