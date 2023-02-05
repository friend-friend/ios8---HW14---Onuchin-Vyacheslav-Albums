//
//  AlbumModel.swift
//  ios8 - HW14 - Onuchin Vyacheslav
//
//  Created by Вячеслав Онучин on 04.02.2023.
//

import Foundation

struct AlbumModel: Hashable {
    var image: String
    var title: String
    var number: Int
}

class MockModel {
    private let modelArray = [
        [AlbumModel(image: "family", title: "Недавние", number: 2126),
         AlbumModel(image: "arbuz", title: "WhatsApp", number: 1409),
         AlbumModel(image: "butterfly", title: "Timestamp Camera", number: 66),
         AlbumModel(image: "duck", title: "Snapchat", number: 13),
         AlbumModel(image: "ejik", title: "Instagram", number: 23),
         AlbumModel(image: "kosmos", title: "Избранное", number: 10),
         AlbumModel(image: "lemurs", title: "С айфона", number: 43),
         AlbumModel(image: "misterWhite", title: "Lightroom", number: 1)],

        [AlbumModel(image: "prazdnik", title: "Люди", number: 13),
        AlbumModel(image: "moto", title: "Места", number: 30)],

        [AlbumModel(image: "video",
                    title: "Видео",
                    number: 356),
         AlbumModel(image: "person.crop.square",
                    title: "Селфи",
                    number: 95),
         AlbumModel(image: "livephoto",
                    title: "Фото Live Photos",
                    number: 413),
         AlbumModel(image: "camera.viewfinder",
                    title: "Снимки экрана",
                    number: 62),
         AlbumModel(image: "smallcircle.filled.circle",
                    title: "Записи экрана",
                    number: 3)],

        [AlbumModel(image: "square.and.arrow.down",
                    title: "Импортированные",
                    number: 3),
         AlbumModel(image: "eye.slash",
                    title: "Скрытые",
                    number: 117),
         AlbumModel(image: "trash",
                    title: "Недавно удаленные",
                    number: 0)]
    ]

    func getData() -> [[AlbumModel]] {
        return modelArray
    }
}
