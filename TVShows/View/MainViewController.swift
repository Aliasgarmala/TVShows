//
//  ViewController.swift
//  TVShows
//
//  Created by Aliasgar Mala on 2020-06-11.
//  Copyright © 2020 Aliasgar Mala. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    private let viewModel: MainViewModel
    private let viewControllerFactory: ViewControllerFactory
    private var rows: [ShowViewModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    init(viewModel: MainViewModel, viewControllerFactory: ViewControllerFactory) {
        self.viewModel = viewModel
        self.viewControllerFactory = viewControllerFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureBindings()
    }
    
    private func configureView() {
        navigationController?.title = viewModel.navigationTitle
        navigationItem.title = viewModel.navigationTitle
        tableView.register(MainViewCell.self, forCellReuseIdentifier: MainViewCell.defaultReuseIdentifier)
        //since the height is not changing dynamically we're hard coding it
        tableView.rowHeight = 120
        viewModel.navigationDelegate = self
    }
    
    private func configureBindings() {
        
        viewModel.isLoading.bind { [weak self] isLoading in
            isLoading ? self?.view.showActivityIndicator() : self?.view.hideActivityIndicator()
        }
        
        viewModel.rows.bind { [weak self] in
            self?.rows = $0
        }
    }
}

//MARK: DATASOURCE & DELEGATE
extension MainViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: MainViewCell.defaultReuseIdentifier) as? MainViewCell else {
           preconditionFailure("This should never be nil")
        }
        
        tableViewCell.bind(viewModel: rows[indexPath.row])
        return tableViewCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.selectedRowIndex.value = indexPath.row
    }
}


//MARK: Navigate to detail view
extension MainViewController: ShowNavigationDelegate {
    
    func navigateToDetail(_ tvShow: TVShow) {
        let detailViewController = viewControllerFactory.detailViewController(tvShow: tvShow)
        splitViewController?.showDetailViewController(detailViewController, sender: nil)
    }
}
