//
//  UIViewExtension.swift
//  movieApp
//
//  Created by Can Kurtur on 10.08.2021.
//

import UIKit

extension UIView {
    func nibInstantiate(autoResizingMask: UIView.AutoresizingMask = []) -> UIView {
        let bundle = Bundle(for: Self.self)
        let nib = bundle.loadNibNamed(String(describing: Self.self), owner: self, options: nil)
        if let view = nib?.first as? UIView {
            view.autoresizingMask = autoresizingMask
            return view
        } else {
            return UIView()
        }
    }
}
