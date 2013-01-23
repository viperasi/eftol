# -*- coding: utf-8 -*-
#-------------------------------------------------------------------------------
# Name:         DBEngine
# Purpose:
#
# Author:      viperasi
#
# Created:     13/07/2012
# Copyright:   (c) xu81.com 2012
# Licence:     <your licence>
#-------------------------------------------------------------------------------
import web

class DBEngine:

    _show_SQL_ = True
    def __init__(self):
        self.dbn = 'mysql'
        self.user = 'eft'
        self.pw = 'eft'
        self.database = 'eftol_db'

    def getInstance(self):
        self.db = web.database(dbn=self.dbn,user=self.user,pw=self.pw,db=self.database)
        return self.db