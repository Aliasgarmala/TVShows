//
//  DetailViewModelTest.swift
//  TVShowsTests
//
//  Created by Aliasgar Mala on 2020-06-15.
//  Copyright © 2020 Aliasgar Mala. All rights reserved.
//

import XCTest
@testable import TVShows

class DetailViewModelTest: XCTestCase {
    
    var viewModel: DetailViewModel!
    
     let allDetailTVShow = TVShow(name: "Friends", season: 5, number: 16, airdate: "2020-06-15", airtime: "21.00", runtime: 30, show: Show(id: 1, genres: ["comedy", "funny"], network: Network(id: 1, name: "Plex"), image: nil, summary: "Best show ever"))
    
    override func setUp() {
        viewModel = DetailViewModel(tvShow: allDetailTVShow, imageService: ImageServiceMock(), showService: ShowServiceMock())
    }

    func testExpectedValues() {
        
        XCTAssertEqual(viewModel.title.string, NSAttributedString(string: "Title: Friends").string)
        XCTAssertEqual(viewModel.seasonNumber.string, NSAttributedString(string: "Season #: 5").string)
        XCTAssertEqual(viewModel.genre?.string, NSAttributedString(string: "Genre: comedy, funny").string)
        XCTAssertEqual(viewModel.episodeNumber?.string, NSAttributedString(string: "Episode #: 16").string)
        XCTAssertEqual(viewModel.duration?.string, NSAttributedString(string: "Duration: 30 mins").string)
        XCTAssertEqual(viewModel.summary?.string, NSAttributedString(string: "Best show ever").string)
        XCTAssertEqual(viewModel.cast.value?.string, NSAttributedString(string: "Cast: Racheal, Ross").string)
    }
}
