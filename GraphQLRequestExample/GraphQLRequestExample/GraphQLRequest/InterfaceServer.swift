//
//  InterfaceServer.swift
//  GraphQLRequestExample
//
//  Created by 陈胜辉 on 2019/9/19.
//  Copyright © 2019 陈胜辉. All rights reserved.
//

import UIKit
import MJExtension

/// 接口请求
class InterfaceServer: NSObject {
    
    //MARK: -  获取主机地址
    class func getHostUrl() -> String {
        return "http://192.168.50.85:7001/graphql"
    }
    
    //MARK: - 处理请求数据
    public class func handleData(bsaeModel: RequestBaseModel?, error: NSError?, block: RequestBlock?) {
        
        //网络错误
        if error != nil {
            block?(nil,error)
            return
        }
        
        if bsaeModel?.code == "200" {
            //成功
            block?(bsaeModel, nil)
        }else{
            //服务器错误
            block?(bsaeModel,nil)
        }
    }
    
    //MARK: - 处理数据
    //MARK: 处理参数
    class func handleParam(dic: [String: Any]) -> String{
        var param = ""
        //处理参数
        for (key, value) in dic {
            
            param += " " + key + ":"
            
            var temp: String = ""
            if value is String {//字符串参数 特殊处理
                
                temp = value as! String
                param += "\"" + temp + "\""
            }else {//其他参数 直接拼接
                
                if value is Int {
                    temp = String(value as! Int)
                }else if value is Float {
                    temp = String(value as! Float)
                }
                
                 param += temp
            }
        }
        
        return param
    }
    
    //MARK: 处理方法参数
    public class func handleStr(dic: [String: Any]) -> String {
        return "(" + InterfaceServer.handleParam(dic: dic) + ")"
    }
    
    //处理参数
    class func handleParam(paramArr: [ParamRequestModel]) -> String {
        
        //参数
        var param = ""
        
        for obj in paramArr {

            if obj.in_param.count > 0 {
               //有参数
                param += obj.in_param + "{" + obj.out_param + "}"
            }else{
                param += obj.out_param
            }
        }
         return param
    }
    
    //MARK: 获取公共出参
    public class func getPublicParam() -> String {
        return "errorCode status msg "
    }
    
    //MARK: - 接口请求
    //MARK: 登录接口
    class func request(paramArr: [ParamRequestModel], block: RequestBlock?) {
        
        //地址
        let url = InterfaceServer.getHostUrl()
        
        //参数
        let param = InterfaceServer.handleParam(paramArr: paramArr)

        //请求
        GraphQLRequest.getRequest(url: url, param: param, tag: nil, retry: 0, progress: nil, success: { (obj) in
            //转字典 获取 data
            //data 转成 model 返回给界面
            let dic: [String: Any] = (obj as AnyObject).mj_keyValues() as! [String : Any]
            let model: RequestBaseModel = RequestBaseModel.mj_object(withKeyValues: dic["data"])
            
            //处理请求数据
            InterfaceServer.handleData(bsaeModel: model, error: nil, block: block)
        }) { (error) in
            //处理请求数据
            InterfaceServer.handleData(bsaeModel: nil, error: error as NSError?, block: block)
        }
    }
}

