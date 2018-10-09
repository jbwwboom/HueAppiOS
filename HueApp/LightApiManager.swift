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
            switch response.result {
            case .success:
                let json = response.result.value as! [String:[String:Any]]
                for (key, value) in json{
                    let name = value["name"] as! String
                    let modelId = value["modelid"] as! String
                    let state = value["state"] as! [String:Any]
                    let on = state["on"] as! Bool
                    let hue = state["hue"] as! Int
                    let sat = state["sat"] as! Int
                    let bri = state["bri"] as! Int
                    let light = Light(id: Int(key)!, modelId: modelId, name: name, on: on, hue: hue, saturation: sat, brightness: bri)
                    self.delegate?.didReceiveNewLight(light: light)
                }
                print("no error")
            case .failure(let error):
                print(error)
            }
        }
    }
}
