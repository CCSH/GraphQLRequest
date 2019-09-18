//
//  ViewController.swift
//  GraphQLRequestExample
//
//  Created by 陈胜辉 on 2019/9/18.
//  Copyright © 2019 陈胜辉. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //post
        GraphQLRequest.postRequest(url: "http://192.168.50.85:7001/graphql", param: "createUser(name:\"liuc\", userAvatar:\"http://abc.com/avatar.img\", vip:0)", output: " errorCode status msg", tag: nil, retry: 0, progress: nil, success: { (responseObj) in
            print(responseObj)
        }) { (error) in
            print(error.localizedDescription)
        }
        
        //get 无参数
        GraphQLRequest.getRequest(url: "http://192.168.50.85:7001/graphql", param: "", output: "test", tag: nil, retry: 0, progress: nil, success: { (responseObj) in
            print(responseObj)
        }) { (error) in
            print(error.localizedDescription)
        }
        
        //get 有参数
        GraphQLRequest.getRequest(url: "http://192.168.50.85:7001/graphql", param: "login(username:\"123123\", pwd:\"123123\")", output: "errorCode status msg", tag: nil, retry: 0, progress: nil, success: { (responseObj) in
            print(responseObj)
        }) { (error) in
            print(error.localizedDescription)
        }
    }


}

