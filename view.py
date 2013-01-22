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

render = web.template.render('temp')

class index:
    def GET(self):
        raise web.seeother('static/index.html')

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