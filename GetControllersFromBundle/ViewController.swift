//
//  ViewController.swift
//  GetControllersFromBundle
//
//  Created by Mukul Bakshi on 20/06/19.
//  Copyright © 2019 Coder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let myBundle = Bundle.main
        let allVc = myBundle.retrieveAllControllers()
        print("allConntroller is",allVc)
     }
}

extension Bundle {
    
     func retrieveAllControllers() -> [String] {
        
        guard let bundlePath = self.executablePath else {return []}
        var viewControllers = [String]()
        var size:UInt32 = 0
         let classes = objc_copyClassNamesForImage(bundlePath, &size)
         for indx in 0..<size {
            if let className = classes?[Int(indx)],
                let name = NSString.init(utf8String: className) as String?,
                NSClassFromString(name) is UIViewController.Type {
                viewControllers.append(name)
            }
        }
        return viewControllers
    }
}
