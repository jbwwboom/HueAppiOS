//
//  LightApiManagerDelegate.swift
//  HueApp
//
//  Created by Jop on 05/10/2018.
//  Copyright © 2018 Jop. All rights reserved.
//

import Foundation

protocol LightApiManagerDelegate{
    func didReceiveNewLight(light : Light)
}
