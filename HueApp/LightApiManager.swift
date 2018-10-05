//
//  LightApiManager.swift
//  HueApp
//
//  Created by Jop on 05/10/2018.
//  Copyright © 2018 Jop. All rights reserved.
//

import Foundation
import Alamofire

class LightApiManager{
    
    let url = Config.API_URL
    
    var delegate : LightApiManagerDelegate?
    
    let headers : [String:String] = [:]
    let params : [String:String] = [:]
    
    func getLights(){
        Alamofire.request(url, method: .get, parameters: params, headers: headers).responseJSON{
            response in
            if let json = response.result.value as? [Any]{
                for i in 0..<json.count {
                    let object = json[i] as! [String:Any]
                    //self.delegate?.didReceiveNewLight(light : light)
                }
            }else{
                print("error JSON")
            }
        }
    }
    
}
