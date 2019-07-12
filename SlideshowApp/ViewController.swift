//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 魚住宏登 on 2019/07/11.
//  Copyright © 2019 hiroto.uozumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer: Timer!
    
    var timer_sec: Float = 0
    
    @objc func updateTimer(_ timer: Timer) {
        dispImageNo += 1
        displayImage()
    }
    
    
    
    @IBOutlet weak var Prev: UIButton!
    
    @IBOutlet weak var Next: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var Button: UIButton!
    
    @IBAction func onPrev(_ sender: Any) {
        dispImageNo -= 1
        displayImage()
    }
    
    @IBAction func onNext(_ sender: Any) {
        dispImageNo += 1
        displayImage()
    }
    var dispImageNo = 0
    
    func displayImage() {
        let imageNameArray = ["fruit_grape_gorby.png","fruit_melon_hitokuchi_green.png","fruit_slice10_orange.png"]
        
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        let name = imageNameArray[dispImageNo]
        let image = UIImage(named: name)
        imageView.image = image
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backViewController:BackViewController = segue.destination as! BackViewController
        
//        let image = ["fruit_grape_gorby.png","fruit_melon_hitokuchi_green.png","fruit_slice10_orange.png"]
        if dispImageNo == 0 {
            backViewController.image = UIImage(named: "fruit_grape_gorby.png")
        } else if dispImageNo == 1 {
            backViewController.image = UIImage(named: "fruit_melon_hitokuchi_green.png")
        } else if dispImageNo == 2 {
            backViewController.image = UIImage(named: "fruit_slice10_orange.png")
        }
    }
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let image = UIImage(named: "fruit_grape_gorby.png")
        imageView.image = image
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func startstop(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            Button.setTitle("停止", for: .normal)
            Prev.isEnabled = false
            Next.isEnabled = false
        } else if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            Button.setTitle("再生", for: .normal)
            Prev.isEnabled = true
            Next.isEnabled = true
        }
        
    }
    @IBAction func imageTap(_ sender: Any) {
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            Button.setTitle("再生", for: .normal)
            Prev.isEnabled = true
            Next.isEnabled = true
        }
        
    }
}

