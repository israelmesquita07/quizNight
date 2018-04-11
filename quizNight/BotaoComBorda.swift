//
//  BotaoComBorda.swift
//  quizNight
//
//  Created by Israel3D on 11/04/2018.
//  Copyright © 2018 Israel3D. All rights reserved.
//

import UIKit

class BotaoComBorda: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 3.0
        layer.borderColor = UIColor.red.cgColor
    }

}
