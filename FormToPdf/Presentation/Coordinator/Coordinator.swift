//
//  Coordinator.swift
//  FormToPdf
//
//  Created by DG on 01/10/2022.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
