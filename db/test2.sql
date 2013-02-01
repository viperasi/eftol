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