//
//  MainCoordinator.swift
//  FormToPdf
//
//  Created by DG on 01/10/2022.
//

import Foundation
import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate  {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var window: UIWindow?
    
    init(navigationController: UINavigationController,windowScene : UIWindowScene?) {
       
        self.navigationController = navigationController
        super.init()
        
        setupWindow(windowScene: windowScene)
    }
    
    private func setupWindow(windowScene : UIWindowScene?)
    {
        if let windowScene = windowScene {
            self.window = UIWindow(windowScene: windowScene)
        }
        else
        {
            self.window = UIWindow(frame: UIScreen.main.bounds)
        }
        
        self.window?.rootViewController = self.navigationController
        self.window?.makeKeyAndVisible()
    }
    
    func start() {
        
        let vc = FormViewController()
        vc.generateQuestionUseCase = GenerateQuestionsUseCase(plistService: PlistService("Questions")!)
        vc.viewModel = FormViewModel(repository: QuestionLocalRepository())
        navigationController = UINavigationController()
        navigationController.delegate = self
        vc.coordinator = self
        self.window?.rootViewController = navigationController
        navigationController.pushViewController(vc, animated: true)
        
    }

}

