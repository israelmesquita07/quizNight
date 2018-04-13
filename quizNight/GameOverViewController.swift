//
//  GameOverViewController.swift
//  quizNight
//
//  Created by Israel3D on 12/04/2018.
//  Copyright © 2018 Israel3D. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {

    @IBOutlet weak var pontos: UILabel!
    var pontuacao:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        pontos.text = String(pontuacao)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
