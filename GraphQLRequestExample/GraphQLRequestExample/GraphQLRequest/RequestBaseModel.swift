//
//  RequestBaseModel.swift
//  ConsumptionStaging
//
//  Created by CSH on 2019/7/18.
//  Copyright © 2019 丁言全. All rights reserved.
//

import Foundation

//回调
typealias RequestBlock = (Any?, NSError?) -> Void

/// 网络请求基类
class RequestBaseModel: NSObject {
    // 服务器返回码 JAVA
    var code: String = ""
    // 服务器返回码 PHP
    var status: String = ""
    // 服务器端返回信息
    var msg: String = ""
    // 请求数据
    var data: AnyObject?
}

