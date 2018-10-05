//
//  Light.swift
//  HueApp
//
//  Created by Jop on 05/10/2018.
//  Copyright © 2018 Jop. All rights reserved.
//

import Foundation

class Light{
    var id : Int?
    var modelId : String?
    var name : String?
    var on : Bool?
    var hue : Int?
    var saturation : Int?
    var brightness : Int?
    
    required init(id: Int, modelId: String, name: String, on: Bool,
                  hue: Int, saturation: Int, brightness: Int){
        self.id = id;
        self.modelId = modelId;
        self.name = name;
        self.on = on;
        self.hue = hue;
        self.saturation = saturation;
        self.brightness = brightness;
    }
}
