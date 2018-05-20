//
//  UIViewController + TransitionHandler.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//
import UIKit

extension UIViewController: TransitionHandler {
    func performSegue(with segueIdentifier: String) {
        performSegue(withIdentifier: segueIdentifier, sender: nil)
    }

    func openModule<M>(with segueIdentifier: String, configurationBlock: @escaping ConfigrationBlock<M>) {
        performSegue(withIdentifier: segueIdentifier, sender: nil) { segue in
            var destination = segue.destination
            if let navigationController = destination as? UINavigationController {
                destination = navigationController.topViewController ?? destination
            }

            guard
                let moduleInputProvider = destination as? ModuleInputProvider,
                let moduleInput = moduleInputProvider.moduleInput as? M
            else {
                fatalError()
            }

            configurationBlock(moduleInput)
        }
    }

    func closeCurrentModule() {
        if let parentViewController = self.parent {
            if let navigationVc = parentViewController as? UINavigationController {
                if navigationVc.viewControllers.count > 1 {
                    navigationVc.popViewController(animated: true)
                } else {
                    navigationVc.dismiss(animated: true, completion: nil)
                }
                return
            }
        }

        guard presentingViewController != nil else {
            fatalError("Cannot dismiss this vc")
        }

        return dismiss(animated: true, completion: nil)
    }
}
