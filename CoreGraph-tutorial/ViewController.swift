//
//  ViewController.swift
//  CoreGraph-tutorial
//
//  Created by C4Q on 5/6/19.
//  Copyright © 2019 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawView: DrawView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let gestureRec = UITapGestureRecognizer(target: self, action: #selector(drawSquare))
        drawView.addGestureRecognizer(gestureRec)
    }
    
    @objc func drawSquare() {
        
        drawView.drawShape()
    }
}

