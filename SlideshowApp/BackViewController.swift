//
//  BackViewController.swift
//  SlideshowApp
//
//  Created by 魚住宏登 on 2019/07/11.
//  Copyright © 2019 hiroto.uozumi. All rights reserved.
//

import UIKit

class BackViewController: UIViewController {
    
    @IBOutlet weak var SlideBack: UIImageView!
    var image: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        SlideBack.image = self.image
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
