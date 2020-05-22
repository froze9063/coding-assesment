//
//  CustomLayoutDelegate.swift
//  AIATest
//
//  Created by Laelnaldi Saputra on 22/05/20.
//  Copyright © 2020 AIA. All rights reserved.
//

import Foundation
import UIKit

protocol CustomLayoutDelegate : AnyObject {
func collectionView(_ collectionView: UICollectionView, heightForItemAt indexPath: IndexPath, with width: CGFloat) -> CGFloat
}
