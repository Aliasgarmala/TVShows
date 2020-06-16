//
//  ShowViewModel.swift
//  TVShows
//
//  Created by Aliasgar Mala on 2020-06-11.
//  Copyright © 2020 Aliasgar Mala. All rights reserved.
//

import Foundation

import UIKit
class ShowViewModel {
    
    let show: TVShow
    let title: Box<String> = Box("")
    let startTime: Box<String> = Box("")
    let date: Box<String> = Box("")
    let network: Box<String?> = Box(nil)
    let thumbnail: Box<UIImage?> = Box(nil)
    private let imageService: ImageService
    
    fileprivate func downloadThumbnail() {
        let placeHolderImage = UIImage(named: "placeholder")
        thumbnail.value = placeHolderImage
        if var imageURLString = show.show.image?.medium, let url = URL(string: imageURLString.replaceHttpWithHttps()) {
            imageService.fetchImage(url: url) { [weak self] image in
                guard let self = self else {return}
                self.thumbnail.value = image
            }
        }
    }
    
    init(show: TVShow, imageService: ImageService) {
        self.show = show
        self.imageService = imageService
        self.title.value = show.name
        self.date.value = show.airdate.convertToMediumType()
        self.startTime.value = show.airtime.convertToTwelveHour()
        self.network.value = show.show.network?.name != nil ? "Airs on: \(show.show.network!.name)": nil
        
        downloadThumbnail()
        
    }

}
