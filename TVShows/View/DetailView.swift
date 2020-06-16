//
//  DetailView.swift
//  TVShows
//
//  Created by Aliasgar Mala on 2020-06-13.
//  Copyright © 2020 Aliasgar Mala. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    private let scrollView = UIScrollView()
    private let verticalStackView = UIStackView()
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let seasonNumber = UILabel()
    private let episodeNumberLabel = UILabel()
    private let cast = UILabel()
    private let summaryLabel = UILabel()
    private let genreLabel = UILabel()
    private let durationLabel = UILabel()
    
    init() {
        super.init(frame: CGRect.zero)
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
        
        tintColor = .black
        backgroundColor = .white
        layoutMargins = UIEdgeInsets.zero
        accessibilityViewIsModal = true
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)
        
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .fill
        verticalStackView.spacing = 10
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(verticalStackView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.addArrangedSubview(imageView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.backgroundColor = .systemGray5
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        verticalStackView.addArrangedSubview(titleLabel)
        
        seasonNumber.translatesAutoresizingMaskIntoConstraints = false
        seasonNumber.backgroundColor = .systemGray5
        verticalStackView.addArrangedSubview(seasonNumber)
        
        episodeNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        episodeNumberLabel.backgroundColor = .systemGray5
        episodeNumberLabel.isHidden = true
        verticalStackView.addArrangedSubview(episodeNumberLabel)
        
        cast.translatesAutoresizingMaskIntoConstraints = false
        cast.backgroundColor = .systemGray5
        cast.lineBreakMode = .byWordWrapping
        cast.numberOfLines = 0
        cast.isHidden = true
        verticalStackView.addArrangedSubview(cast)

        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.backgroundColor = .systemGray5
        genreLabel.isHidden = true
        verticalStackView.addArrangedSubview(genreLabel)

        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        durationLabel.backgroundColor = .systemGray5
        durationLabel.isHidden = true
        verticalStackView.addArrangedSubview(durationLabel)
        
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        summaryLabel.font = UIFont.systemFont(ofSize: 18)
        summaryLabel.lineBreakMode = .byWordWrapping
        summaryLabel.numberOfLines = 0
        verticalStackView.addArrangedSubview(summaryLabel)
    }
    
    private func setupConstraints() {
        
        scrollView.pinToEdges(of: self)
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 9/16),
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor),
        ])
        
        verticalStackView.pinToEdges(of: scrollView)
        verticalStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    func bind(viewModel: DetailViewModel) {
        
        // showing default image when the image is loading
        imageView.image = nil
        viewModel.image.bind { [weak self] in
            self?.imageView.image = $0
        }
        
        titleLabel.attributedText = viewModel.title

        seasonNumber.attributedText = viewModel.seasonNumber
                
        if let episodeNumber = viewModel.episodeNumber {
            episodeNumberLabel.isHidden = false
            episodeNumberLabel.attributedText = episodeNumber
        }
        
        viewModel.cast.bind { [weak self] in
            if let names = $0 {
                self?.cast.isHidden = false
                self?.cast.attributedText = names
            }
        }
        
        if let genre = viewModel.genre {
            genreLabel.isHidden = false
            genreLabel.attributedText = genre
        }
        
        if let duration = viewModel.duration {
            durationLabel.isHidden = false
            durationLabel.attributedText = duration
        }
        
        if let summary = viewModel.summary {
            summaryLabel.attributedText = summary
        }
    }
}
