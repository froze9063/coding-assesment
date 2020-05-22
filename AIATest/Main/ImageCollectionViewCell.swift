//
//  ImageCollectionViewCell.swift
//  AIATest
//
//  Created by Laelnaldi Saputra on 22/05/20.
//  Copyright © 2020 AIA. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var imgRobot: UIImageView!
    
    private var collectionCellListener : CollectionCellListener!
    private var robotStruct : RobotStruct!
    private var position = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgRobot.layer.cornerRadius = 8
    }
    
    @IBAction func btnDetail(_ sender: UIButton) {
        collectionCellListener.onCollectionViewClicked(position: position)
    }
}

extension ImageCollectionViewCell {
    func config(robotStruct : RobotStruct, collectionCellListener : CollectionCellListener, position : Int){
        self.robotStruct = robotStruct
        self.collectionCellListener = collectionCellListener
        self.position = position
        lblID.text = "ID : \(robotStruct.code ?? "")"
        imgRobot.image = UIImage(named: robotStruct.pic ?? "")
    }
}
