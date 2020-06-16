//
//  MainView.swift
//  TVShows
//
//  Created by Aliasgar Mala on 2020-06-12.
//  Copyright © 2020 Aliasgar Mala. All rights reserved.
//

import UIKit

class MainViewCell: UITableViewCell {
    
    private let verticalStackView = UIStackView()
    private let thumbnailView = UIImageView()
    private let name = UILabel()
    private let startTime = UILabel()
    private let date = UILabel()
    private let network = UILabel()
    
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
       postInit()
   }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func postInit() {
       configureView()
       setupConstraints()
    }
    
    private func configureView() {
        
        thumbnailView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(thumbnailView)
        
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .leading
        verticalStackView.spacing = 3
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(verticalStackView)
        
        name.translatesAutoresizingMaskIntoConstraints = false
        name.setContentHuggingPriority(.required, for: .vertical)
        name.setContentCompressionResistancePriority(.required, for: .vertical)
        name.font = UIFont.boldSystemFont(ofSize: 20)
        verticalStackView.addArrangedSubview(name)
        
        
        date.translatesAutoresizingMaskIntoConstraints = false
        date.setContentHuggingPriority(.required, for: .vertical)
        date.setContentCompressionResistancePriority(.required, for: .vertical)
        date.font = UIFont.systemFont(ofSize: 18)
        verticalStackView.addArrangedSubview(date)
        
        startTime.translatesAutoresizingMaskIntoConstraints = false
        startTime.setContentHuggingPriority(.required, for: .vertical)
        startTime.setContentCompressionResistancePriority(.required, for: .vertical)
        startTime.font = UIFont.systemFont(ofSize: 18)
        verticalStackView.addArrangedSubview(startTime)
        
        network.translatesAutoresizingMaskIntoConstraints = false
        network.font = UIFont.systemFont(ofSize: 18)
        verticalStackView.addArrangedSubview(network)
    }
    
    private func setupConstraints() {
        
        //maintaining the aspect ratio of portrait image
        NSLayoutConstraint.activate([
            thumbnailView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            thumbnailView.heightAnchor.constraint(equalToConstant: 100),
            thumbnailView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            thumbnailView.widthAnchor.constraint(equalTo: thumbnailView.heightAnchor, multiplier: 2/3),
        ])
        
        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: thumbnailView.trailingAnchor, constant: 15),
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func bind(viewModel: ShowViewModel) {
        
        // showing default image when the image is loading
        thumbnailView.image = nil
        viewModel.thumbnail.bind { [weak self] in
            self?.thumbnailView.image = $0
        }
    
        viewModel.title.bind { [weak self] in
            self?.name.text = $0
        }
        
        viewModel.date.bind { [weak self] in
            self?.date.text = $0
        }
        
        viewModel.startTime.bind { [weak self] in
           self?.startTime.text = $0
        }

        viewModel.network.bind { [weak self] in
           self?.network.text = $0
        }
    }
}
