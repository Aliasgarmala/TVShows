//
//  DetailViewController.swift
//  TVShows
//
//  Created by Aliasgar Mala on 2020-06-13.
//  Copyright © 2020 Aliasgar Mala. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let viewModel: DetailViewModel
    
    private var mainView: DetailView {
        return self.view as! DetailView
    }

    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func loadView() {
        self.view = DetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBindings()
    }
    
    private func configureBindings() {
        mainView.bind(viewModel: viewModel)
    }
}
