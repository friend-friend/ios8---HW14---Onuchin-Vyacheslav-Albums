//
//  Presenter.swift
//  ios8 - HW14 - Onuchin Vyacheslav
//
//  Created by Вячеслав Онучин on 05.02.2023.
//

import Foundation

protocol PresenterProtocol {
    init(viewController: ViewControllerProtocol?, mockModel: MockModel)

    var albumModel: [[AlbumModel]] { get }
}

class Presenter: PresenterProtocol {
    var albumModel: [[AlbumModel]]
    weak var viewController: ViewControllerProtocol?
    private var mockModel: MockModel

    required init(viewController: ViewControllerProtocol?, mockModel: MockModel) {
        self.viewController = viewController
        self.mockModel = mockModel
        self.albumModel = mockModel.getData()
    }
}
