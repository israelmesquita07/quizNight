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
        layer.borderWidth = 1.5
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 5
    }

}
