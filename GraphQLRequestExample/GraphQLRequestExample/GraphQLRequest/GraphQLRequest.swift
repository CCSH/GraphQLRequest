//
//  GraphQLRequest.swift
//  GraphQLRequestExample
//
//  Created by 陈胜辉 on 2019/9/18.
//  Copyright © 2019 陈胜辉. All rights reserved.
//

import UIKit

class GraphQLRequest: NSObject {
    
    /// GET
    ///
    /// - Parameters:
    ///   - url: 地址（xxx/graphql）
    ///   - param: 参数
    ///   - tag: 请求标记
    ///   - retry: 重试次数
    ///   - progress: 进度
    ///   - success: 成功
    ///   - failure: 失败
    class func getRequest(url: String, param: String, tag: String?, retry: NSInteger, progress: progressBlock?, success: successBlock?, failure: failureBlock?){
        
        RequestBase.getRequest(url: url, param: ["query": "{" + param + "}"], tag: tag, retry: retry, progress: progress, success: success, failure: failure)
    }
    
    
    /// POST
    ///
    /// - Parameters:
    ///   - url: 地址（xxx/graphql）
    ///   - param: 参数
    ///   - tag: 请求标记
    ///   - retry: 重试次数
    ///   - progress: 进度
    ///   - success: 成功
    ///   - failure: 失败
    class func postRequest(url: String, param: String, tag: String?, retry: NSInteger, progress: progressBlock?, success: successBlock?, failure: failureBlock?){
        
        RequestBase.postRequest(url: url, param: ["query": "mutation" + "{" + param + "}"], tag: tag, retry: retry, progress: progress, success: success, failure: failure)
    }


}
