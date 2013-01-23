# -*- coding: utf-8 -*-
#-------------------------------------------------------------------------------
# Name:         Pagination
# Purpose:
#
# Author:      viperasi
#
# Created:     13/07/2012
# Copyright:   (c) xu81.com 2012
# Licence:     <your licence>
#-------------------------------------------------------------------------------
import web
from dbengine import DBEngine

class Pagination:

    def __init__(self, sql, limit, currPage):
        self.sql = sql
        self.limit = limit
        self.currPage = currPage
        self.allPage = 0

    def getInstance(self):
        db = DBEngine().getInstance()
        results = db.query(self.sql)
        count = results[0].count
        mod = int(count) % self.limit
        if mod == 0:
        	self.allPage = int(count) / self.limit
        else:
        	self.allPage = int(count) / self.limit + 1
        return self