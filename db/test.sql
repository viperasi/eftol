SELECT * FROM trntranslationcolumns WHERE tablename='dbo.invtypes'

SELECT * FROM trntranslationcolumns WHERE tablename='dbo.chrraces'
SELECT * FROM trntranslations WHERE tcid=7 AND languageid='ZH'

SELECT g.groupid,g.groupname,tt.text FROM invgroups g,trntranslationcolumns t,trntranslations tt
WHERE t.tablename='dbo.invgroups' AND t.columnName='groupname' AND tt.tcid=t.tcid AND tt.languageid='ZH' AND tt.keyid=g.groupid
AND g.categoryid=6

SELECT g.metagroupname,tt.text FROM invmetagroups g,trntranslationcolumns t,trntranslations tt
WHERE t.tablename='dbo.invmetagroups' AND t.columnName='metagroupname' AND tt.tcid=t.tcid AND tt.languageid='ZH' AND tt.keyid=g.metagroupid


SELECT g.groupid,g.groupname,tt.text FROM invgroups g,trntranslationcolumns t,trntranslations tt
WHERE t.tablename='dbo.invgroups' AND t.columnName='groupname' AND tt.tcid=t.tcid AND tt.languageid='ZH' AND tt.keyid=g.groupid
AND g.categoryid=6 AND tt.text LIKE '%巡%'

SELECT i.typeid,tttt.text,tt.text,t11.text
FROM invtypes i,invgroups g,chrraces c,
trntranslationcolumns t,trntranslations tt,trntranslationcolumns ttt,trntranslations tttt,
trntranslationcolumns t1,trntranslations t11
WHERE t.tablename='dbo.invgroups' AND t.columnName='groupname' AND tt.tcid=t.tcid AND tt.languageid='ZH' AND tt.keyid=g.groupid
AND g.categoryid=6 AND ttt.tablename='dbo.invtypes' AND ttt.columnName='typename' AND tttt.tcid=ttt.tcid AND tttt.languageid='ZH' AND tttt.keyid=i.typeid
AND i.groupid=g.groupid 
AND c.raceid=i.raceid AND t1.tablename='dbo.chrraces' AND t1.columnname='racename' AND t11.tcid=t1.tcid AND t11.languageid='ZH' AND t11.keyid=c.raceid


SELECT c.raceid,t11.text
FROM chrraces c ,trntranslationcolumns t1,trntranslations t11
WHERE t1.tablename='dbo.chrraces' AND t1.columnname='racename' AND t11.tcid=t1.tcid AND t11.languageid='ZH' AND t11.keyid=c.raceid


SELECT i.typeid,t11.text AS typename,t22.text AS groupname,t33.text AS racename 
FROM invtypes AS i, trntranslationcolumns AS t1, trntranslations AS t11, 
invgroups AS g, trntranslationcolumns AS t2, trntranslations AS t22, 
chrraces AS c, trntranslationcolumns AS t3, trntranslations AS t33 
WHERE t11.keyid=i.typeid AND t1.tablename="dbo.invtypes" AND t1.columnName="typename" AND t1.tcid=t11.tcid AND t11.languageid="ZH"
AND t22.keyid=g.groupid AND t2.tablename="dbo.invgroups" AND t2.columnName="groupname" AND t2.tcid=t22.tcid AND t22.languageid="ZH"
AND t33.keyid=c.raceid AND t3.tablename="dbo.chrraces" AND t3.columnName="racename" AND t3.tcid=t33.tcid AND t33.languageid="ZH"
AND g.categoryid=6 AND i.groupid=g.groupid AND c.raceid=i.raceid 
ORDER BY c.raceid,g.groupid,i.typeid


SELECT COUNT(1) FROM invtypes AS i, trntranslationcolumns AS t1, trntranslations AS t11, invgroups AS g, trntranslationcolumns AS t2, trntranslations AS t22, chrraces AS c, trntranslationcolumns AS t3, trntranslations AS t33 
WHERE t11.keyid=i.typeid AND t1.tablename="dbo.invtypes" AND t1.columnName="typename" AND t1.tcid=t11.tcid AND t11.languageid="ZH"
AND t22.keyid=g.groupid AND t2.tablename="dbo.invgroups" AND t2.columnName="groupname" AND t2.tcid=t22.tcid AND t22.languageid="ZH"
AND t33.keyid=c.raceid AND t3.tablename="dbo.chrraces" AND t3.columnName="racename" AND t3.tcid=t33.tcid AND t33.languageid="ZH"
AND g.categoryid=6 AND i.groupid=g.groupid AND c.raceid=i.raceid ORDER BY c.raceid,g.groupid,i.typeid

SELECT i.typeid,t11.text AS typename,t22.text AS groupname,t33.text AS racename 
FROM invtypes AS i, trntranslationcolumns AS t1, trntranslations AS t11, 
invgroups AS g, trntranslationcolumns AS t2, trntranslations AS t22, 
chrraces AS c, trntranslationcolumns AS t3, trntranslations AS t33 
WHERE t11.keyid=i.typeid AND t1.tablename="dbo.invtypes" AND t1.columnName="typename" AND t1.tcid=t11.tcid AND t11.languageid="ZH"
AND t22.keyid=g.groupid AND t2.tablename="dbo.invgroups" AND t2.columnName="groupname" AND t2.tcid=t22.tcid AND t22.languageid="ZH"
AND t33.keyid=c.raceid AND t3.tablename="dbo.chrraces" AND t3.columnName="racename" AND t3.tcid=t33.tcid AND t33.languageid="ZH"
AND g.categoryid=6 AND i.groupid=g.groupid AND c.raceid=i.raceid 
ORDER BY c.raceid,g.groupid,i.typeid


SELECT i.typeid, t11.text AS NAME, t22.text AS `group`, t33.text AS race 
FROM invtypes AS i, trntranslationcolumns AS t1, trntranslations AS t11, 
invgroups AS g, trntranslationcolumns AS t2, trntranslations AS t22, 
chrraces AS c, trntranslationcolumns AS t3, trntranslations AS t33 
WHERE t11.keyid=i.typeid AND t1.tablename="dbo.invtypes" AND t1.columnName="typename" AND t1.tcid=t11.tcid AND t11.languageid="ZH" 
AND t22.keyid=g.groupid AND t2.tablename="dbo.invgroups" AND t2.columnName="groupname" AND t2.tcid=t22.tcid AND t22.languageid="ZH" 
AND t33.keyid=c.raceid AND t3.tablename="dbo.chrraces" AND t3.columnName="racename" AND t3.tcid=t33.tcid AND t33.languageid="ZH" 
AND i.typeid='582' AND i.groupid=g.groupid AND c.raceid=i.raceid


SELECT i.typeid, t11.text AS NAME, t22.text AS `group`, t33.text AS race, t44.text AS `desc` 
FROM invtypes AS i, trntranslationcolumns AS t1, trntranslations AS t11, 
invgroups AS g, trntranslationcolumns AS t2, trntranslations AS t22, 
chrraces AS c, trntranslationcolumns AS t3, trntranslations AS t33, 
trntranslationcolumns AS t4, trntranslations AS t44 
WHERE t11.keyid=i.typeid AND t1.tablename="dbo.invtypes" AND t1.columnName="typename" AND t1.tcid=t11.tcid AND t11.languageid="ZH" 
AND t22.keyid=g.groupid AND t2.tablename="dbo.invgroups" AND t2.columnName="groupname" AND t2.tcid=t22.tcid AND t22.languageid="ZH" 
AND t33.keyid=c.raceid AND t3.tablename="dbo.chrraces" AND t3.columnName="racename" AND t3.tcid=t33.tcid AND t33.languageid="ZH" 
AND t44.keyid=i.typeid AND t4.tablename="dbo.invtypes" AND t4.columnName="description" AND t4.tcid=t44.tcid AND t44.languageid="ZH" 
AND i.typeid='629' AND i.groupid=g.groupid AND c.raceid=i.raceid

SELECT i.typeid,d.attributeid,d.categoryid,t22.text AS typename,t11.text AS displayname,dt.valueint,dt.valuefloat FROM invtypes AS i,dgmtypeattributes AS dt, dgmattributetypes d,
trntranslationcolumns AS t1, trntranslations AS t11,
trntranslationcolumns AS t2, trntranslations AS t22
WHERE i.typeid=629 
AND dt.typeid=i.typeid AND d.attributeid=dt.attributeid
AND t11.keyid=dt.attributeid AND t1.tablename='dbo.dgmattributetypes' AND t1.columnname='displayname' AND t1.tcid=t11.tcid AND t11.languageid='ZH'
AND t22.keyid=i.typeid AND t2.tablename='dbo.invtypes' AND t2.columnname='typename' AND t2.tcid=t22.tcid AND t22.languageid='ZH'
AND d.categoryid=8


SELECT d.categoryname,t22.text FROM dgmattributecategories AS d,trntranslationcolumns AS t2, trntranslations AS t22
WHERE t22.keyid=d.categoryid AND t2.tablename='dbo.dgmattributecategories' AND t2.columnname='categoryname' AND t2.tcid=t22.tcid AND t22.languageid='ZH'

SELECT * FROM trntranslationcolumns WHERE tablename='dbo.crtcategories'

SELECT * FROM dgmtypeeffects WHERE typeid=629
SELECT * FROM dgmeffects WHERE effectid=1171

SELECT t11.text FROM crtcategories c,trntranslationcolumns AS t1, trntranslations AS t11
WHERE t1.tablename='dbo.crtcategories' AND t11.keyid=c.categoryid AND t1.columnname='categoryname' AND t11.languageid='ZH' AND t1.tcid=t11.tcid


SELECT
Skills.typeid,
Ships.typeName AS ShipName,
Grouping.groupName AS ShipType,
Skills.typeName AS RequiredSkill,
SkillLevel.valueInt AS RequiredLevel
FROM dgmTypeAttributes AS SkillName

INNER JOIN invTypes AS Ships ON Ships.typeID = SkillName.typeID

INNER JOIN invGroups AS Grouping ON Grouping.groupID = Ships.groupID

INNER JOIN invTypes AS Skills ON Skills.typeID = SkillName.valueInt AND (SkillName.attributeID = 182 OR SkillName.attributeID = 183 OR SkillName.attributeID = 184 OR SkillName.attributeID = 1285 OR SkillName.attributeID = 1289 OR SkillName.attributeID = 1290)

INNER JOIN dgmTypeAttributes AS SkillLevel ON SkillLevel.typeID = SkillName.typeID AND (SkillLevel.attributeID = 277 OR SkillLevel.attributeID = 278 OR SkillLevel.attributeID = 279 OR SkillLevel.attributeID = 1286 OR SkillLevel.attributeID = 1287 OR SkillLevel.attributeID = 1288)

WHERE
Ships.typeId=622 AND
Grouping.categoryID = 6 AND
Ships.published = 1 AND
((SkillName.attributeID = 182 AND SkillLevel.attributeID = 277) OR
(SkillName.attributeID = 183 AND SkillLevel.attributeID = 278) OR
(SkillName.attributeID = 184 AND SkillLevel.attributeID = 279) OR
(SkillName.attributeID = 1285 AND SkillLevel.attributeID = 1286) OR
(SkillName.attributeID = 1289 AND SkillLevel.attributeID = 1287) OR
(SkillName.attributeID = 1290 AND SkillLevel.attributeID = 1288))