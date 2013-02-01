SELECT i.typeid,t11.text AS typename,t22.text AS groupname,t33.text AS racename 
FROM invtypes AS i, trntranslationcolumns AS t1, trntranslations AS t11, invgroups AS g, trntranslationcolumns AS t2, 
trntranslations AS t22, chrraces AS c, trntranslationcolumns AS t3, trntranslations AS t33 WHERE t11.keyid=i.typeid 
AND t1.tablename="dbo.invtypes" AND t1.columnName="typename" AND t1.tcid=t11.tcid AND t11.languageid="ZH" AND t22.keyid=g.groupid 
AND t2.tablename="dbo.invgroups" AND t2.columnName="groupname" AND t2.tcid=t22.tcid AND t22.languageid="ZH" AND t33.keyid=c.raceid 
AND t3.tablename="dbo.chrraces" AND t3.columnName="racename" AND t3.tcid=t33.tcid AND t33.languageid="ZH" AND g.categoryid=6 
AND i.groupid=g.groupid AND c.raceid=i.raceid AND i.typeid=16240
ORDER BY c.raceid,g.groupid,i.typeid LIMIT 10 OFFSET 0

SELECT t.text FROM dgmattributetypes d,trntranslationcolumns tt,trntranslations t
 WHERE d.displayname LIKE '%需求%' AND tt.tablename='dbo.dgmattributetypes' AND tt.columnname='displayname'
 AND t.tcid=tt.tcid AND t.keyid=d.attributeid AND t.languageid='zh'
 
SELECT t11.text AS displayname,dt.attributeid, COALESCE(dt.valuefloat,dt.valueint) AS VALUE , d.categoryid 
FROM dgmtypeattributes AS dt, dgmattributetypes AS d, trntranslationcolumns AS t1, trntranslations AS t11 
WHERE dt.typeid='3301' AND d.attributeid=dt.attributeid AND t11.keyid=dt.attributeid 
AND t1.tablename="dbo.dgmattributetypes" AND t1.columnname="displayname" AND t1.tcid=t11.tcid AND t11.languageid="ZH"
AND t11.text LIKE '%技能%'

SELECT * FROM dgmtypeattributes WHERE attributeid=1547

SELECT * FROM invtypes WHERE groupid=255

SELECT * FROM invgroups WHERE categoryid=16
