-- Create a snapshot 
-- Author: Nolan Regenwether

use master;

DECLARE @snapshotname nvarchar(255) = 'BBInfinity_Snapshot_'





DECLARE @sql nvarchar(max) = 'DROP DATABASE <SNAPSHOTNAME>;'

SET @sql = replace(@sql, '<SNAPSHOTNAME>', @snapshotname); 

EXECUTE sp_executesql @sql; 