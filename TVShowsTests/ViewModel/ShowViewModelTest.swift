//
//  ShowViewModelTest.swift
//  TVShowsTests
//
//  Created by Aliasgar Mala on 2020-06-15.
//  Copyright © 2020 Aliasgar Mala. All rights reserved.
//

import XCTest
@testable import TVShows

class ShowViewModelTest: XCTestCase {
    
    private var viewModel: ShowViewModel!
    let allDetailTVShow = TVShow(name: "Friends", season: 5, number: 16, airdate: "2020-06-15", airtime: "21.00", runtime: 30, show: Show(id: 1, genres: ["comedy"], network: Network(id: 1, name: "Plex"), image: nil, summary: "Best show ever"))
    
    override func setUp() {
        
        viewModel = ShowViewModel(show: allDetailTVShow, imageService: ImageServiceMock())
    }
    
    func testProperSetUp() {
        XCTAssertEqual(viewModel.title.value, "Friends")
        XCTAssertEqual(viewModel.startTime.value, "9:00 PM")
        XCTAssertEqual(viewModel.network.value, "Airs on: Plex")
        XCTAssertEqual(viewModel.date.value, "2020-06-15")
    }
    
    func testDefaultPlaceHolderIsSet() {
        let bundle = Bundle.init(for: ShowViewModel.self)
        let image = UIImage(named: "placeholder", in: bundle, compatibleWith: nil)
        XCTAssertEqual(viewModel.thumbnail.value, image)
    }
    
}
