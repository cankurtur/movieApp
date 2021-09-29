//
//  AutoSizedTableView.swift
//  movieApp
//
//  Created by Can Kurtur on 10.09.2021.
//

import UIKit
class AutoSizedTableView: UITableView {
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
