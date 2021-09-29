//
//  AutoSizedCollectionView.swift
//  movieApp
//
//  Created by Can Kurtur on 17.09.2021.
//

import UIKit
class AutoSizedCollectionView: UICollectionView {
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
