//
//  CustomCollectionViewLayout.swift
//  AIATest
//
//  Created by Laelnaldi Saputra on 22/05/20.
//  Copyright © 2020 AIA. All rights reserved.
//

import Foundation
import UIKit

class CustomCollectionViewLayout : UICollectionViewLayout{
    
       public var delegate: CustomLayoutDelegate!
       
       public var numberOfColumns = 2
       public var cellPadding: CGFloat = 2.0
       
       private var cache = [UICollectionViewLayoutAttributes]()
       
       private var contentHeight: CGFloat = 0.0
    
       private var contentWidth: CGFloat {
           let insets = collectionView!.contentInset
           return collectionView!.bounds.width - (insets.left + insets.right)
       }
       
    func reloadData(){
        self.cache = [UICollectionViewLayoutAttributes]()
    }
    
       override public var collectionViewContentSize: CGSize {
           return CGSize(width: contentWidth, height: contentHeight)
       }
       
    override func prepare() {
         if cache.isEmpty {
                   collectionView?.contentInset = UIEdgeInsets(top: 0, left: cellPadding, bottom: cellPadding, right: cellPadding)
                   let columnWidth = contentWidth / CGFloat(numberOfColumns)
                   var xOffset = [CGFloat]()
            
                   for column in 0 ..< numberOfColumns {
                       xOffset.append(CGFloat(column) * columnWidth )
                   }
            
                   let height: CGFloat = 0
            
                   var yOffset = [CGFloat](repeating: height, count: numberOfColumns)
                   var col = 0
            
                   for item in 0 ..< collectionView!.numberOfItems(inSection: 0) {
                       let indexPath = IndexPath(item: item, section: 0)
                       
                       let width = columnWidth - cellPadding * 2
                       
                       let Height = delegate.collectionView(collectionView!, heightForItemAt: indexPath, with: width)
                     
                       let height = cellPadding +  Height + cellPadding
                       let frame = CGRect(x: xOffset[col], y: yOffset[col], width: columnWidth, height: height)
                       let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
                       
                       let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                       attributes.frame = insetFrame
                       cache.append(attributes)
                       
                       contentHeight = max(contentHeight, frame.maxY)
                       yOffset[col] = yOffset[col] + height
                       
                       col = col >= (numberOfColumns - 1) ? 0 : col+1
                   }
               }
    }
    
    override public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }
}


