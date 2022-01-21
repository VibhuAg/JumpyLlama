//
//  ViewController.swift
//  JumpyLlama
//
//  Created by Student on 3/4/19.
//  Copyright © 2019 Jaron. All rights reserved.
//
import SpriteKit
import GameplayKit
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
        // Do any additional setup after loading the view, typically from a nib.
    }


}

