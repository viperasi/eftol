# -*- coding: utf-8 -*-
#-------------------------------------------------------------------------------
# Name:         Viewer
# Purpose:
#
# Author:      viperasi
#
# Created:     13/07/2012
# Copyright:   (c) xu81.com 2012
# Licence:     <your licence>
#-------------------------------------------------------------------------------
import web
import simplejson
from dbengine import DBEngine
from pagination import Pagination

render = web.template.render('temp/', base='layout')

ATTR_CATEGORY_FITTING = 1
ATTR_CATEGORY_SHIELD = 2
ATTR_CATEGORY_ARMOR = 3
ATTR_CATEGORY_STRUC = 4
ATTR_CATEGORY_CAPACITOR = 5
ATTR_CATEGORY_TARGETING = 6
ATTR_CATEGORY_MISC = 7
ATTR_CATEGORY_SKILLS = 8
ATTR_CATEGORY_DRONES = 10
ATTR_CATEGORY_AI = 12

class index:
    def GET(self):
        return render.index()

class eft:
    def GET(self,currPage):
        data = web.input(gid='-1', rid='-1', tname='')
        web.header('Content-Type','text/html; charset=utf-8', unique=True)
        db = DBEngine().getInstance()
        if currPage == '':
            currPage = '1'
        shipTypes = db.select(
                        ['invgroups', 'trntranslationcolumns', 'trntranslations'],
                        what = 'invgroups.groupid as groupid,trntranslations.text as groupname',
                        where = 'trntranslations.keyid=invgroups.groupid and trntranslationcolumns.tablename="dbo.invgroups" AND trntranslationcolumns.columnName="groupname" AND trntranslations.tcid=trntranslationcolumns.tcid and trntranslations.languageid="ZH" and invgroups.categoryid=6')
        chrraces = db.select(
                        ['chrraces', 'trntranslationcolumns', 'trntranslations'],
                        what='chrraces.raceid as raceid,trntranslations.text as racename',
                        where='trntranslations.keyid=chrraces.raceid and trntranslationcolumns.tablename="dbo.chrraces" AND trntranslationcolumns.columnName="racename" AND trntranslations.tcid=trntranslationcolumns.tcid and trntranslations.languageid="ZH"')
        var = {}
        where = ''
        countWhere = ''
        if data.gid != '-1':
            var['gid'] = data.gid
            where = where + ' and i.groupid=$gid '
        if data.rid != '-1':
            var['rid'] = data.rid
            where = where + ' and i.raceid=$rid'
        if data.tname != '':
            var['tname'] = '%' + data.tname + '%'
            where = where + ' and t11.text like $tname'
        offset = (int(currPage) - 1) * 10
        ships = db.select(
                        ['invtypes as i', 'trntranslationcolumns as t1', 'trntranslations as t11',
                        'invgroups as g', 'trntranslationcolumns as t2', 'trntranslations as t22',
                        'chrraces as c', 'trntranslationcolumns as t3', 'trntranslations as t33'],
                        vars = var,
                        what = 'i.typeid,t11.text as typename,t22.text as groupname,t33.text as racename',
                        where = 't11.keyid=i.typeid and t1.tablename="dbo.invtypes" and t1.columnName="typename" and t1.tcid=t11.tcid and t11.languageid="ZH"'+
                                ' and t22.keyid=g.groupid and t2.tablename="dbo.invgroups" and t2.columnName="groupname" and t2.tcid=t22.tcid and t22.languageid="ZH"'+
                                ' and t33.keyid=c.raceid and t3.tablename="dbo.chrraces" and t3.columnName="racename" and t3.tcid=t33.tcid and t33.languageid="ZH"'+
                                ' and g.categoryid=6 and i.groupid=g.groupid and c.raceid=i.raceid' + where,
                        order = 'c.raceid,g.groupid,i.typeid',
                        limit = 10,
                        offset = offset)
        table = ['invtypes as i', 'invgroups as g', 'chrraces as c', 'trntranslationcolumns as t1', 'trntranslations as t11']
        what = 'count(1) as count'
        where = 't11.keyid=i.typeid and t1.tablename="dbo.invtypes" and t1.columnname="typename" and t1.tcid=t11.tcid and t11.languageid="ZH" and g.categoryid=6 and i.groupid=g.groupid and c.raceid=i.raceid ' + where
        order = 'c.raceid,g.groupid,i.typeid'
        page = Pagination(table, var, what, where, order, 10, currPage).getInstance()
        return render.eft(shipTypes, chrraces, ships, page, data)

class ship:
    def GET(self,shipId):
        db =DBEngine().getInstance()
        web.header('Content-Type','application/json; charset=utf-8', unique=True)
        ship = db.select(
                        ['invtypes as i', 'trntranslationcolumns as t1', 'trntranslations as t11',
                        'invgroups as g', 'trntranslationcolumns as t2', 'trntranslations as t22',
                        'chrraces as c', 'trntranslationcolumns as t3', 'trntranslations as t33',
                        'trntranslationcolumns as t4', 'trntranslations as t44'],
                        vars = {'sid' : shipId},
                        what = 'i.typeid, t11.text as name, t22.text as `group`, t33.text as race, t44.text as `desc`, i.radius, i.mass, i.volume, i.capacity ',
                        where = 't11.keyid=i.typeid and t1.tablename="dbo.invtypes" and t1.columnName="typename" and t1.tcid=t11.tcid and t11.languageid="ZH"'+
                                ' and t22.keyid=g.groupid and t2.tablename="dbo.invgroups" and t2.columnName="groupname" and t2.tcid=t22.tcid and t22.languageid="ZH"'+
                                ' and t33.keyid=c.raceid and t3.tablename="dbo.chrraces" and t3.columnName="racename" and t3.tcid=t33.tcid and t33.languageid="ZH"'+
                                ' and t44.keyid=i.typeid and t4.tablename="dbo.invtypes" and t4.columnName="description" and t4.tcid=t44.tcid and t44.languageid="ZH"'+
                                ' and i.typeid=$sid and i.groupid=g.groupid and c.raceid=i.raceid')
        attr = db.select(
                        ['dgmtypeattributes AS dt', 'dgmattributetypes as d',
                        'trntranslationcolumns AS t1', 'trntranslations AS t11'],
                        vars = {'sid' : shipId},
                        what = 't11.text AS displayname,dt.attributeid, coalesce(dt.valuefloat,dt.valueint) as value , d.categoryid',
                        where = 'dt.typeid=$sid AND d.attributeid=dt.attributeid'+
                                ' AND t11.keyid=dt.attributeid AND t1.tablename="dbo.dgmattributetypes" AND t1.columnname="displayname" AND t1.tcid=t11.tcid AND t11.languageid="ZH"')
        shipJson = simplejson.dumps(ship[0])
        attrJson = simplejson.dumps(attr.list())
        shipJson = simplejson.loads(shipJson)
        shipJson['prop'] = simplejson.loads(attrJson)
        return simplejson.dumps(shipJson)

class createEFT:
    def GET(self, shipId):
        db =DBEngine().getInstance()
        ship = db.select(
                        ['invtypes as i', 'trntranslationcolumns as t1', 'trntranslations as t11',
                        'invgroups as g', 'trntranslationcolumns as t2', 'trntranslations as t22',
                        'chrraces as c', 'trntranslationcolumns as t3', 'trntranslations as t33',
                        'trntranslationcolumns as t4', 'trntranslations as t44'],
                        vars = {'sid' : shipId},
                        what = 'i.typeid, t11.text as name, t22.text as `group`, t33.text as race, t44.text as `desc`',
                        where = 't11.keyid=i.typeid and t1.tablename="dbo.invtypes" and t1.columnName="typename" and t1.tcid=t11.tcid and t11.languageid="ZH"'+
                                ' and t22.keyid=g.groupid and t2.tablename="dbo.invgroups" and t2.columnName="groupname" and t2.tcid=t22.tcid and t22.languageid="ZH"'+
                                ' and t33.keyid=c.raceid and t3.tablename="dbo.chrraces" and t3.columnName="racename" and t3.tcid=t33.tcid and t33.languageid="ZH"'+
                                ' and t44.keyid=i.typeid and t4.tablename="dbo.invtypes" and t4.columnName="description" and t4.tcid=t44.tcid and t44.languageid="ZH"'+
                                ' and i.typeid=$sid and i.groupid=g.groupid and c.raceid=i.raceid')
        return render.ceft(ship[0])

class getShips:
    def GET(self):
        db = DBEngine().getInstance()
        shipTypes = db.select(['invgroups','trntranslations'],where='trntranslations.keyid=invgroups.groupid and trntranslations.tcid=7 and trntranslations.languageid="ZH" and invgroups.categoryid=6')
        web.header('Content-Type', 'application/json')
        stJSON = '['
        for st in shipTypes:
            stJSON = stJSON + '{id:' + str(st.groupID) + ', name:"' + st.text + '"},'
        stJSON = stJSON[:len(stJSON)-1]
        stJSON = stJSON + ']'
        stJSON = '{succ:true, type:\'group\',options:' + stJSON + '}'
        return simplejson.dumps(stJSON) 

class getItemData:
    def POST(self):
        data = web.input(id=None,type=None)
        db = DBEngine().getInstance()
        lists = db.select(['invtypes as t','trntranslations as tt','trntranslations as ttt'],vars={'gid':data.id},what='t.typeid,t.capacity,tt.text AS typename,ttt.text AS racename',where='tt.keyid=t.typeid and tt.tcid=8 and tt.languageid="ZH" AND ttt.keyid=t.raceid AND ttt.tcid=9 AND ttt.languageid="ZH" and t.groupid=$gid',order='t.raceid,t.typeid')
        stJSON = '['
        for st in lists:
            stJSON = stJSON + '{id:' + str(st.typeid) + ',capacity:' + str(st.capacity) + ',name:"' + st.typename + '",race:"' + st.racename + '"},'
        stJSON = stJSON[:len(stJSON)-1]
        stJSON = stJSON + ']'
        stJSON = '{succ:true,type:\'' + data.type +'\',options:' + stJSON +'}'
        return simplejson.dumps(stJSON)

class login:
    def POST(self):
        data =web.input(email=None, passwd=None, auto=False)
        if data.email and data.passwd:
            db = DBEngine().getInstance()
            user = db.select(
                ['users as u'], 
                vars={'email':data.email}, 
                what='u.id, u.name, u.passwd', 
                where='u.email=$email'
                )
            if user == None :
                return simplejson.dumps('{succ:false, msg:"邮箱地址不存在"}')
            else:
                currUser = user[0]
                if data.passwd == currUser.passwd:
                    if data.auto:
                        web.setcookie("email", data.email)
                    return simplejson.dumps('{succ:true, user:{id:' + str(currUser.id) + ',name:"' + currUser.name + '"}}')
                else:
                    return simplejson.dumps('{succ:false, msg:"邮箱与密码不匹配，请重新输入"}')
        else:
            return simplejson.dumps('{succ:false, msg:"请输入完整后登录"}')
        if data.auto:
            print 'auto'
        else:
            print 'no auto'