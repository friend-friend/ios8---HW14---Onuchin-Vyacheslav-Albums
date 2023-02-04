//
//  AlbumModel.swift
//  ios8 - HW14 - Onuchin Vyacheslav
//
//  Created by Вячеслав Онучин on 04.02.2023.
//

import Foundation
import UIKit

struct AlbumModel: Hashable {
    var image: UIImage?
    var title: String
    var number: Int
}

extension AlbumModel {
    static let modelArray = [
        [AlbumModel(image: UIImage(named: "family"), title: "Недавние", number: 2126),
         AlbumModel(image: UIImage(named: "arbuz"), title: "WhatsApp", number: 1409),
         AlbumModel(image: UIImage(named: "butterfly"), title: "Timestamp Camera", number: 66),
         AlbumModel(image: UIImage(named: "duck"), title: "Snapchat", number: 13),
         AlbumModel(image: UIImage(named: "ejik"), title: "Instagram", number: 23),
         AlbumModel(image: UIImage(named: "kosmos"), title: "Избранное", number: 10),
         AlbumModel(image: UIImage(named: "lemurs"), title: "С айфона", number: 43),
         AlbumModel(image: UIImage(named: "misterWhite"), title: "Lightroom", number: 1)],

        [AlbumModel(image: UIImage(systemName: "video")?
            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                    title: "Видео",
                    number: 356),
         AlbumModel(image: UIImage(systemName: "person.crop.square")?
            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                    title: "Селфи",
                    number: 95),
         AlbumModel(image: UIImage(systemName: "livephoto")?
            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                    title: "Фото Live Photos",
                    number: 413),
         AlbumModel(image: UIImage(systemName: "camera.viewfinder")?
            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                    title: "Снимки экрана",
                    number: 62),
         AlbumModel(image: UIImage(systemName: "smallcircle.filled.circle")?
            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                    title: "Записи экрана",
                    number: 3)],

        [AlbumModel(image: UIImage(systemName: "square.and.arrow.down")?
            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                    title: "Импортированные",
                    number: 3),
         AlbumModel(image: UIImage(systemName: "eye.slash")?
            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                    title: "Скрытые",
                    number: 117),
         AlbumModel(image: UIImage(systemName: "trash")?
            .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                    title: "Недавно удаленные",
                    number: 0)]
    ]
}
