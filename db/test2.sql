<<<<<<< HEAD
SELECT t11.text AS displayname, dt.valueint, dt.valuefloat ,d.attributeid,d.categoryid
FROM invtypes AS i, dgmtypeattributes AS dt, dgmattributetypes d, 
trntranslationcolumns AS t1, trntranslations AS t11 
WHERE i.typeid=23773 AND dt.typeid=i.typeid AND d.attributeid=dt.attributeid AND t11.keyid=dt.attributeid 
AND t1.tablename="dbo.dgmattributetypes" AND t1.columnname="displayname" AND t1.tcid=t11.tcid AND t11.languageid="ZH"
AND d.categoryid=4

SELECT t.text AS attrname,dt.attributeid FROM dgmattributetypes dt,trntranslationcolumns td,trntranslations t, dgmattributecategories dc
WHERE dc.categoryid=4 AND dt.categoryid = dc.categoryid AND td.tablename='dbo.dgmattributetypes' AND td.columnname='displayname'
AND t.tcid=td.tcid AND t.keyid=dt.attributeid AND t.languageid='ZH'

SELECT * FROM invtypes WHERE typeid=23773
SELECT * FROM dgmattributecategories

SELECT it.typeid,t.text FROM invtypes it,trntranslations t
WHERE t.text = '神使级' AND t.keyid=it.typeid

SELECT t11.text AS displayname, COALESCE(dt.valueint, dt.valuefloat) AS VALUE
FROM invtypes AS i, dgmtypeattributes AS dt, dgmattributetypes d, trntranslationcolumns AS t1, trntranslations AS t11 
WHERE i.typeid=629 AND dt.typeid=i.typeid AND d.attributeid=dt.attributeid AND t11.keyid=dt.attributeid 
AND t1.tablename="dbo.dgmattributetypes" AND t1.columnname="displayname" AND t1.tcid=t11.tcid AND t11.languageid="ZH"
=======
SELECT t11.text AS displayname, dt.valueint, dt.valuefloat ,dc.categoryid
FROM invtypes AS i, dgmtypeattributes AS dt, dgmattributetypes d, trntranslationcolumns AS t1, trntranslations AS t11 ,dgmattributecategories dc
WHERE i.typeid=16238 AND dt.typeid=i.typeid AND d.attributeid=dt.attributeid AND t11.keyid=dt.attributeid 
AND t1.tablename="dbo.dgmattributetypes" AND t1.columnname="displayname" AND t1.tcid=t11.tcid AND t11.languageid="ZH"
AND d.categoryid=7 AND dc.categoryid=d.categoryid

SELECT * FROM dgmattributecategories

SELECT * FROM trntranslations AS tt,trntranslationcolumns AS t WHERE tt.text = '校准值' AND t.tcid=tt.tcid

SELECT * FROM dgmattributetypes WHERE attributeid=37 OR attributeid=1132

SELECT tt.text FROM dgmattributetypes AS t,trntranslationcolumns tc, trntranslations tt 
WHERE t.categoryid=8 AND tc.tablename='dbo.dgmattributetypes' AND tc.columnname='displayname' 
AND tc.tcid=tt.tcid AND tt.keyid=t.attributeid AND tt.languageid='zh'

SELECT t.typename,tt.text FROM invtypes t,trntranslationcolumns tc,trntranslations tt 
WHERE t.typeid=12097 AND tc.tablename='dbo.invtypes' AND tc.columnname='typename' AND tt.tcid=tc.tcid
AND tt.keyid=t.typeid AND tt.languageid='zh'
>>>>>>> aa3cca922e7b20f39c4f9c5f3194be6eddf81d3d
