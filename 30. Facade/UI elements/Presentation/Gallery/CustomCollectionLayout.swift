//
//  CustomCollectionLayout.swift
//  UI elements
//
//  Created by Алексей Олудин on 05.09.2024.
//

import UIKit

final class CustomCollectionLayout: UICollectionViewLayout {
    enum Constant {
        static let columnsCount = 2
        static let cellHeight: CGFloat = 200
    }
    
    private var cacheAttributes = [IndexPath: UICollectionViewLayoutAttributes]()
    private var totalCellHeight: CGFloat = 0
    
    override func prepare() {
        cacheAttributes = [:]
        guard let collectionView = collectionView else { return }
        
        let itemsCount = collectionView.numberOfItems(inSection: 0)
        guard itemsCount > 0 else { return }
        let bigCellWidth = collectionView.frame.width
        let smallCellWidth = collectionView.frame.width / CGFloat(Constant.columnsCount)
        
        var lastY: CGFloat = 0
        var lastX: CGFloat = 0
        var counter = 0
        var isBigCell = false
        var isLastColumn = false
        
        for index in 0..<itemsCount {
            let indexPath = IndexPath(item: index, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            counter += 1
            if counter <= 2 {
                isBigCell = true
                isLastColumn = false
            } else if counter == 4{
                isBigCell = false
                counter = 0
                isLastColumn = true
            } else {
                isBigCell = false
            }
            
            if isBigCell {
                attributes.frame = CGRect(
                    x: 0,
                    y: lastY,
                    width: bigCellWidth,
                    height: Constant.cellHeight
                )
                
                lastY += Constant.cellHeight
            } else {
                attributes.frame = CGRect(
                    x: lastX,
                    y: lastY,
                    width: smallCellWidth,
                    height: Constant.cellHeight
                )
                
                if isLastColumn {
                    lastX = 0
                    lastY += Constant.cellHeight
                } else {
                    lastX += smallCellWidth
                }
            }
            cacheAttributes[indexPath] = attributes
        }
        totalCellHeight = lastY
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cacheAttributes.values.filter { attributes in
            return rect.intersects(attributes.frame)
        }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cacheAttributes[indexPath]
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: collectionView?.frame.width ?? 0, height: totalCellHeight)
    }
}
