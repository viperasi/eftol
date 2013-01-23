# -*- coding: utf-8 -*-
#-------------------------------------------------------------------------------
# Name:         Main
# Purpose:
#
# Author:      viperasi
#
# Created:     13/07/2012
# Copyright:   (c) xu81.com 2012
# Licence:     <your licence>
#-------------------------------------------------------------------------------
import web
from view import index, eft, ship, createEFT, login, getShips, getItemData

urls = (
    '/', 'index',
    '/eft/(\d+)', 'eft',
    '/ship/(\d+)', 'ship',
    '/ceft/(\d+)', 'createEFT',
    '/login', 'login',
    '/getShips', 'getShips',
    '/getItemData', 'getItemData'
)

if __name__ == "__main__":
    app = web.application(urls, globals())
    app.run()