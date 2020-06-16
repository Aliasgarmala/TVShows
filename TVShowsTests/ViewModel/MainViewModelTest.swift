//
//  TVShowsTests.swift
//  TVShowsTests
//
//  Created by Aliasgar Mala on 2020-06-11.
//  Copyright © 2020 Aliasgar Mala. All rights reserved.
//

import XCTest
@testable import TVShows

class MainViewModelTest: XCTestCase {
    private var viewModel: MainViewModel!
    private var navigateToDetailScreenCalled = false

    override func setUp() {
        viewModel = MainViewModel(showService: ShowServiceMock(), imageService: ImageServiceMock(), day: Day.friday)
        viewModel.navigationDelegate = self
    }
    
    override func tearDown() {
        navigateToDetailScreenCalled = false
    }
    
    func testTitleIsSetAsDayOnTheScreen() {
        XCTAssertEqual(viewModel.navigationTitle, "Friday")
    }
    
    func testResultState() {
        XCTAssertFalse(viewModel.isLoading.value)
        XCTAssertEqual(viewModel.rows.value.count, 1)
    }
    
    func testFirstRow() {
        
        if let firstRow = viewModel.rows.value.first {
            XCTAssertEqual(firstRow.date.value, "2020-06-15")
        }
    }
    
    func testSettingSelectedRowCallsNavigationToDetail() {
        viewModel.selectedRowIndex.value = 0
        XCTAssertTrue(navigateToDetailScreenCalled)
    }
}

extension MainViewModelTest: ShowNavigationDelegate {
    func navigateToDetail(_ tvShow: TVShow) {
        navigateToDetailScreenCalled = true
    }
}
