//
//  KindTableViewCell.swift
//  iRadio
//
//  Created by DavidTran on 4/15/18.
//  Copyright © 2018 DavidTran. All rights reserved.
//

import UIKit

class KindTableViewCell: UITableViewCell {

    @IBOutlet weak var channelCollectionView: UICollectionView!
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDelegate & UICollectionViewDataSource>(_ dataSourceDelegate:D, forRow row:Int){
            channelCollectionView.dataSource = dataSourceDelegate
        channelCollectionView.delegate = dataSourceDelegate
        channelCollectionView.tag = row
        channelCollectionView.reloadData()
        
    }

}
