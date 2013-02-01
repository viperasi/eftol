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

    def __init__(self, table, var, what, where, order, limit, currPage):
        self.table = table
        self.var = var
        self.what = what
        self.where = where
        self.limit = limit
        self.order = order
        self.currPage = currPage
        self.allPage = 0

    def getInstance(self):
        db = DBEngine().getInstance()
        results = db.select(self.table, vars=self.var, what=self.what,where=self.where,order=self.order)
        count = results[0].count
        mod = int(count) % self.limit
        if mod == 0:
        	self.allPage = int(count) / self.limit
        else:
        	self.allPage = int(count) / self.limit + 1
        return self