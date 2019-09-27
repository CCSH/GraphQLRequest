//
//  RequestLoginModel.swift
//  GraphQLRequestExample
//
//  Created by 陈胜辉 on 2019/9/20.
//  Copyright © 2019 陈胜辉. All rights reserved.
//

import UIKit

/// 入参数Model
class RequestInModel: NSObject {
    
    var vip: Int = 0
}

/// 出参Model
class RequestOutModel: NSObject {
    
    var id: String = ""
    var name: String = ""
    var userAvatar: String = ""
    var v: Int = -1
    var fans: [RequestOut2Model] = [RequestOut2Model()]
}

class RequestOut2Model: NSObject {
    
    var id: String = ""
    var name: String = ""
    var userAvatar: String = ""
}

/// 拓展
extension RequestInModel {
    
    var param: String {
        set {
            
        }
        get {
            var str = ((vip == 0) ? "nor_users:" : "vip_users:") + "queryUsers"
            //拼接参数
            if vip >= 0 {
                str += InterfaceServer.handleStr(dic:  ["vip": vip])
            }
            
            return str
        }
    }
}

extension RequestOutModel {
    
    var param: String {
        set {
            
        }
        get {
            var str = "id name userAvatar token fans{ id name userAvatar }"
            //拼接参数
            str += " showVip"
            if v >= 0 {
                str += InterfaceServer.handleStr(dic:  ["v": v])
            }
            
            return str
        }
    }
}
