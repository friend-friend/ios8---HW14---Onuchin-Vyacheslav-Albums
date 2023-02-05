//
//  Assambly.swift
//  ios8 - HW14 - Onuchin Vyacheslav
//
//  Created by Вячеслав Онучин on 05.02.2023.
//

import UIKit

protocol AssamblyProtocol {
    func createViewController() -> UIViewController
}

class Assambly: AssamblyProtocol {
    func createViewController() -> UIViewController {
        let viewController = ViewController()
        let model = MockModel()
        let presenter = Presenter(viewController: viewController, mockModel: model)
        viewController.presenter = presenter
        return viewController
    }
}
