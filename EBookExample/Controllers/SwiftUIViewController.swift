//
//  SwiftUIViewController.swift
//  EBookExample
//
//  Created by ChangTingWei on 2020/11/22.
//

import UIKit
import SwiftUI

class SwiftUIViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBSegueAction func showSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: SwiftUIView())
    }
}

