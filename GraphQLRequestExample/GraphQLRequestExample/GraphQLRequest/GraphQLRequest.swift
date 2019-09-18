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
    ///   - param: 入参 (例如 有参数：login(username:"123123", pwd:"123123") 无参数可以不传 )
    ///   - output: 出参 (例如 errorCode status msg )
    ///   - tag: 请求标记
    ///   - retry: 重试次数
    ///   - progress: 进度
    ///   - success: 成功
    ///   - failure: 失败
    class func getRequest(url: String, param: String, output: String, tag: String?, retry: NSInteger, progress: progressBlock?, success: successBlock?, failure: failureBlock?){
        
        RequestBase.getRequest(url: url, param: ["query": GraphQLRequest.handleParam(param: param, output: output)], tag: tag, retry: retry, progress: progress, success: success, failure: failure)
    }
    
    
    /// POST
    ///
    /// - Parameters:
    ///   - url: 地址（xxx/graphql）
    ///   - param: 入参 (例如 有参数：login(username:"123123", pwd:"123123") 无参数可以不传 )
    ///   - output: 出参 (例如 errorCode status msg )
    ///   - tag: 请求标记
    ///   - retry: 重试次数
    ///   - progress: 进度
    ///   - success: 成功
    ///   - failure: 失败
    class func postRequest(url: String, param: String, output: String, tag: String?, retry: NSInteger, progress: progressBlock?, success: successBlock?, failure: failureBlock?){
        
        RequestBase.postRequest(url: url, param: ["query": "mutation" + GraphQLRequest.handleParam(param: param, output: output)], tag: tag, retry: retry, progress: progress, success: success, failure: failure)
    }
    
    //处理参数
    class func handleParam(param: String, output: String) -> String {
        
        if param.count > 0 {
            //有参数
           return "{" + param + "{" + output + "}" + "}"
        }
        return "{" + output + "}"
    }

}
