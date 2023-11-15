--1
--sqlnet.ora C:\Oracle\DB21\network\admin\sample
--TNSNAMES.ORA C:\Oracle\app\oracle\homes\OraDB21Home1\network\admin
--10
CREATE VIEW VM AS 
    SELECT SEGMENT_NAME,EXTENTS,BLOCKS,BYTES FROM USER_SEGMENTS;
    
SELECT *FROM VM;
DROP VIEW VM;