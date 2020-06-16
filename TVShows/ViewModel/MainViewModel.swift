//
//  MainViewModel.swift
//  TVShows
//
//  Created by Aliasgar Mala on 2020-06-11.
//  Copyright © 2020 Aliasgar Mala. All rights reserved.
//

import Foundation

protocol ShowNavigationDelegate: class {
    func navigateToDetail(_ tvShow: TVShow)
}

class MainViewModel {
    weak var navigationDelegate: ShowNavigationDelegate?
    
    let navigationTitle: String
    let showService: ShowService
    let imageService: ImageService
    var rows: Box<[ShowViewModel]> = Box([])
    let selectedRowIndex: Box<Int?> = Box(nil)
    var isLoading: Box<Bool> = Box(false)
    let day: Day
    
    init(showService: ShowService, imageService: ImageService, day: Day) {
        self.showService = showService
        self.imageService = imageService
        self.day = day
        self.navigationTitle = day.rawValue
        postInit()
        configureBindings()
    }
    
    private func postInit() {
        isLoading.value = true
        let date = ScheduleDate.shared.getDateOf(day: day)
        showService.fetchShows(date: date)  { [weak self] result in
            guard let self = self else { return }
            
            self.isLoading.value = false
            switch result {
                
            case .success(let shows):
                self.rows.value = shows.map { ShowViewModel(show: $0, imageService: self.imageService) }
            case .failure(let error):
                // can show error pop up here
                print(error)
            }
        }
    }
    
    private func configureBindings() {
        selectedRowIndex.bind { [weak self] (rowNumberSelected) in
            guard let self = self, let index = rowNumberSelected else {return}
            let tvShow = self.rows.value[index].show
            self.navigateToDetailScreen(tvShow)
        }
    }
    
    private func navigateToDetailScreen(_ tvShow: TVShow) {
         navigationDelegate?.navigateToDetail(tvShow)
    }
}
