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
    
    func getLights(){
        let headers : [String:String] = [:]
        let params : [String:String] = [:]
        Alamofire.request(url, method: .get, parameters: params, headers: headers).responseJSON{
            response in
            switch response.result {
            case .success:
                //Parsing the json to a String dict with a String:Any dict
                //This is done so the key is the id of the light and the values the variables of the light
                //This makes it easy to parse the data of the lights and get the id for the put requests.
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
    
    func putCall(id : Int, params : Parameters){
        let putUrl = Config.API_URL + "/\(id)/state"
        let headers : [String:String] = ["Content-Type":"application/json"]
        
        //Added JSON encoding to make the PUT call work.
        Alamofire.request(putUrl, method: .put, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON{
            response in
            switch response.result {
            case .success:
                print("\(response.result.value) no error")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func putOn(id : Int, on : Bool){
        //Hard cast to bool otherwise on becomes a 0 or 1 instead of true or false
        let params: [String:Bool] = ["on": on]
        self.putCall(id: id, params: params)
    }
    
    func putHue(id : Int, hue : Int){
        let params = ["hue": hue]
        self.putCall(id: id, params: params)
    }
    
    func putSaturation(id : Int, sat : Int){
        let params = ["sat": sat]
        self.putCall(id: id, params: params)
    }
    
    func putBrightness(id : Int, bri : Int){
        let params = ["bri": bri]
        self.putCall(id: id, params: params)
    }
}
