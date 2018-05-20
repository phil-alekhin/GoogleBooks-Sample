//
//  UIViewController + Swizzle.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import ObjectiveC
import UIKit

typealias SegueBlock = (UIStoryboardSegue) -> Void

private func swizzle(viewController: UIViewController.Type) {
    let originalSelector = #selector(viewController.prepare(for:sender:))
    let swizzledSelector = #selector(viewController.swizzledPrepare(for:sender:))

    guard
        let originalMethod = class_getInstanceMethod(viewController, originalSelector),
        let swizzledMethod = class_getInstanceMethod(viewController, swizzledSelector)
    else {
        return
    }

    let didAddMethod = class_addMethod(
        viewController,
        originalSelector,
        method_getImplementation(swizzledMethod),
        method_getTypeEncoding(swizzledMethod)
    )

    if didAddMethod {
        class_replaceMethod(
            viewController,
            swizzledSelector,
            method_getImplementation(originalMethod),
            method_getTypeEncoding(originalMethod)
        )
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
}

private var hasSwizzled = false

extension UIViewController {
    private struct AssociatedKeys {
        static var segueBlockKey = "segueBlock"
    }

    private class SegueBlockHolder {
        let value: SegueBlock?

        init(_ value: SegueBlock?) {
            self.value = value
        }
    }

    private var segueBlock: SegueBlock? {
        get {
            let value = objc_getAssociatedObject(self, &AssociatedKeys.segueBlockKey) as? SegueBlockHolder
            return value?.value
        }
        set {
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.segueBlockKey,
                SegueBlockHolder(newValue),
                objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }

    class func swizzlePerformSegue() {
        guard !hasSwizzled else {
            return
        }

        hasSwizzled = true
        swizzle(viewController: self)
    }

    func performSegue(withIdentifier identifier: String, sender: Any?, segueBlock: @escaping SegueBlock) {
        self.segueBlock = segueBlock
        performSegue(withIdentifier: identifier, sender: sender)
    }

    @objc func swizzledPrepare(for segue: UIStoryboardSegue, sender: Any?) {
        segueBlock?(segue)
        swizzledPrepare(for: segue, sender: sender)
        segueBlock = nil
    }
}
