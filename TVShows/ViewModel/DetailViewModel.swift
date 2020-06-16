//
//  DetailViewModel.swift
//  TVShows
//
//  Created by Aliasgar Mala on 2020-06-13.
//  Copyright © 2020 Aliasgar Mala. All rights reserved.
//

import Foundation
import UIKit

class DetailViewModel {
    //Box properties are observing on completion handler of the respective calls
    private let imageService: ImageService
    private let showService: ShowService
    let image: Box<UIImage?> = Box(nil)
    var title: NSAttributedString = NSAttributedString()
    var seasonNumber: NSAttributedString = NSAttributedString()
    var episodeNumber: NSAttributedString? = nil
    var cast: Box<NSAttributedString?> = Box(nil)
    var genre: NSAttributedString? = nil
    var duration: NSAttributedString? = nil
    var summary: NSAttributedString? = nil
    
    fileprivate func setImage(_ tvShow: TVShow) {
        let placeHolderImage = UIImage(named: "placeholder")
        image.value = placeHolderImage
        if var imageURLString = tvShow.show.image?.original, let url = URL(string: imageURLString.replaceHttpWithHttps()) {
            imageService.fetchImage(url: url) { [weak self] image in
                guard let self = self else {return}
                self.image.value = image
            }
        }
    }
    
    fileprivate func getCastFor(showId: Int) {
        showService.getCast(showId: showId) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let cast):
                let names = cast.map {$0.name}.joined(separator: ", ")
                self.cast.value = !names.isEmpty ? names.getAttributedTextFor(label: "Cast") : nil
            case .failure(let error):
                print(error)
            }
        }
    }
    
    init(tvShow: TVShow, imageService: ImageService, showService: ShowService) {
        self.imageService = imageService
        self.showService = showService
        
        self.title = tvShow.name.getAttributedTextFor(label: "Title")
        
        let seasonString = String(describing: tvShow.season)
        self.seasonNumber = seasonString.getAttributedTextFor(label: "Season #")
        
        self.episodeNumber = tvShow.number != nil ? String(describing: tvShow.number!).getAttributedTextFor(label: "Episode #") : nil
        
        let genreString = tvShow.show.genres.joined(separator: ", ")
        self.genre = !genreString.isEmpty ? genreString.getAttributedTextFor(label: "Genre") : nil
        
        let durationString = tvShow.runtime != nil ? String(describing: tvShow.runtime!) : ""
        self.duration = tvShow.runtime != nil ? (durationString + " mins").getAttributedTextFor(label: "Duration") : nil
        
        self.summary = tvShow.show.summary != nil ? tvShow.show.summary!.convertToHTMLString() : nil
        
        setImage(tvShow)
        
        getCastFor(showId: tvShow.show.id)
    }
}
