//
//  NetworkTools.swift
//  AFN-Swift
//
//  Created by Mac on 16/7/23.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

/// HTTP 请求方法枚举
enum RequestMethod: String {
    case GET = "GET"
    case POST = "POST"
}
//MARK: 网络工具
class NetworkTools: AFHTTPSessionManager{
    // 单例
    static let sharedTools: NetworkTools = {
        
        let tools = NetworkTools(baseURL: nil)
        
        // 设置反序列化数据格式 - 系统会自动将 OC 框架中的 NSSet 转换成 Set
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        
        return tools
    }()
}

//MARK: - 封装AFN网络方法
extension NetworkTools{
    
    func request(methond: RequestMethod,URLString: String, parametes: [String: AnyObject]?, finished: (result:AnyObject?,error: NSError?) -> ()) {
        //定义成功回调
        let success = {
            (task:NSURLSessionDataTask, result:AnyObject)-> Void in
            finished(result: result, error: nil)
        }
        
        //定义失败回调
        let failure = {(task: NSURLSessionDataTask, error: NSError) -> Void in
            print(error)
            finished(result: nil, error: error)
        }
        
        if methond == RequestMethod.GET {
            GET(URLString,parameters: parametes,success: success,failure: failure)
        }else{
            POST(URLString, parameters: parametes,success: success,failure: failure)
        }
        
    }
    
}
