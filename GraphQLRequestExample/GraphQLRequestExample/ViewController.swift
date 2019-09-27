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
        
        let inModel: RequestInModel = RequestInModel()
        inModel.vip = 0
        
        let outModel: RequestOutModel = RequestOutModel()
//        outModel.v = 0
        
        let model = ParamRequestModel()
        model.in_param = inModel.param
        model.out_param = outModel.param
        
        let mode2 = ParamRequestModel()
        inModel.vip = 1
        mode2.in_param = inModel.param
        mode2.out_param = outModel.param
        
        InterfaceServer.request(paramArr: [model,mode2]) { (requestObj, error) in
            if error == nil {
                
            }else{
                
            }
        }
        
        RequestBase.getRequest(url: "https://139.198.13.126:10080", param: nil, tag: nil, retry: 0, progress: nil, success: { (obj) in

        }) { (error) in
            
        }
    }


}

