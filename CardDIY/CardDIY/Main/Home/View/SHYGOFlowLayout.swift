//
//  SHYGOFlowLayout.swift
//  CardDIY
//
//  Created by shvier on 06/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

class SHYGOFlowLayout: UICollectionViewFlowLayout {
    
    let lineSpacing: CGFloat = 40
    let zoomScale: CGFloat = 1.45
    let minZoomScale: CGFloat = 0.45
    
    weak var delegate: SHYGOFlowLayoutDelegate?
    
    var index: NSInteger = 0
    
    override func prepare() {
        super.prepare()
    }
    
    override var collectionViewContentSize: CGSize {
        get {
            return super.collectionViewContentSize
        }
        set {
            
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let visibleRect = CGRect(x: collectionView!.contentOffset.x, y: collectionView!.contentOffset.y, width: collectionView!.bounds.size.width, height: collectionView!.bounds.size.height)
        let visibleItems = super.layoutAttributesForElements(in: visibleRect)
        for attributes in visibleItems! {
            let leftMargin: CGFloat = attributes.center.x - collectionView!.contentOffset.x
            let halfCenterX: CGFloat = collectionView!.bounds.size.width/2
            let absOffset: CGFloat = fabs(halfCenterX - leftMargin)
            let scale: CGFloat = 1 - absOffset/halfCenterX
            attributes.transform3D = CATransform3DMakeScale(1 + scale*minZoomScale, 1 + scale*minZoomScale, 1)
            
        }
        return visibleItems
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        let pInView = collectionView!.superview?.convert(collectionView!.center, to: collectionView!)
        let indexPathRow = collectionView!.indexPathForItem(at: pInView!)
        if indexPathRow == nil {
            return false
        }
        if indexPathRow?.row == 0 {
            if newBounds.origin.x < kScreenWidth/2 {
                if index != indexPathRow?.row {
                    index = 0
                    delegate?.flowLayoutMovedTo(index: index)
                }
            }
        } else {
            if index != indexPathRow?.row {
                index = indexPathRow!.row
                delegate?.flowLayoutMovedTo(index: index)
            }
        }
        super.shouldInvalidateLayout(forBoundsChange: newBounds)
        return true
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        var minOffset = CGFloat.greatestFiniteMagnitude
        let horizontalCenter = proposedContentOffset.x + collectionView!.bounds.size.width/2
        let visibleRect = CGRect(x: proposedContentOffset.x, y: 0, width: collectionView!.bounds.size.width, height: collectionView!.bounds.size.height)
        let visibleAttributes = super.layoutAttributesForElements(in: visibleRect)
        for attr in visibleAttributes! {
            let itemCenterX = attr.center.x
            if fabs(itemCenterX - horizontalCenter) <= fabs(minOffset) {
                minOffset = itemCenterX - horizontalCenter
            }
        }
        
        var centerOffsetX = proposedContentOffset.x + minOffset
        if centerOffsetX < 0 {
            centerOffsetX = 0
        }
        if centerOffsetX > collectionView!.contentSize.width - (sectionInset.left + sectionInset.right + itemSize.width) {
            centerOffsetX = floor(centerOffsetX)
        }
        return CGPoint(x: centerOffsetX, y: proposedContentOffset.y)
    }

}
