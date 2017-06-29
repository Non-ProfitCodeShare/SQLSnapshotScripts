-- Revert to a Snapshot 
-- Author: Nolan Regenwether

USE master;

DECLARE  @DBNAME nvarchar(255) = 'BBInfinity'
DECLARE @SNAPSHOTNAME nvarchar(255) = ''
SET @SNAPSHOTNAME = replace(replace(@snapshotname, '[', ''), ']', '')

exec REVERTTOSNAPSHOTTHEDB @DBNAME , @SNAPSHOTNAME 