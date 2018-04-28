//
//  ChannelCollectionViewCell.swift
//  iRadio
//
//  Created by DavidTran on 4/15/18.
//  Copyright © 2018 DavidTran. All rights reserved.
//

import UIKit

class ChannelCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var thumbImage: UIImageView!
    func configure(name:String, logo:UIImage){
        lbName.text = name
        thumbImage.image = logo
        thumbImage.layer.shadowColor = UIColor.black.cgColor
        thumbImage.layer.shadowOffset = CGSize(width: 3, height: 3)
        thumbImage.layer.shadowOpacity = 0.5
    }
}
