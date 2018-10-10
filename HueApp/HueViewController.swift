//
//  HueViewController.swift
//  HueApp
//
//  Created by Justin van den Boomen on 10/10/2018.
//  Copyright © 2018 Jop. All rights reserved.
//

import UIKit

class HueViewController: UIViewController {
    @IBOutlet weak var onSwitch: UISwitch!
    
    @IBOutlet weak var hueSlider: UISlider!
    @IBOutlet weak var hueLabel: UILabel!
    
    @IBOutlet weak var satSlider: UISlider!
    @IBOutlet weak var satLabel: UILabel!
    
    @IBOutlet weak var briSlider: UISlider!
    @IBOutlet weak var briLabel: UILabel!
    
    var light : Light!
    
    let manager = LightApiManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let light = light {
            onSwitch.setOn(light.on!, animated: true)
            hueSlider.setValue(Float(light.hue!), animated: true)
            hueLabel.text = "Hue: \(light.hue!)"
            satSlider.setValue(Float(light.saturation!), animated: true)
            satLabel.text = "Saturation: \(light.saturation!)"
            briSlider.setValue(Float(light.brightness!), animated: true)
            briLabel.text = "Brighness: \(light.brightness!)"
        }
    }
    
    @IBAction func turnedOn(_ sender: UISwitch) {
        let currentValue = sender.isOn
        light.on! = currentValue
        manager.putOn(id: light.id!, on: light.on!)
    }
    
    @IBAction func hueSliderChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        hueLabel.text = "Hue: \(currentValue)"
        light.hue! = currentValue
        manager.putHue(id: light.id!, hue: light.hue!)
    }
    
    @IBAction func satSliderChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        satLabel.text = "Saturation: \(currentValue)"
        light.saturation! = currentValue
        manager.putSaturation(id: light.id!, sat: light.saturation!)
    }
    
    @IBAction func briSliderChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        briLabel.text = "Brightness: \(currentValue)"
        light.brightness! = currentValue
        manager.putBrightness(id: light.id!, bri: light.brightness!)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
