//
//  CircleImage.swift
//  Smack
//
//  Created by Hazem Mohamed Magdy on 11/27/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import UIKit

class CircleImage: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
}
