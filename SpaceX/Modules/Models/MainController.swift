//
//  ViewController.swift
//  SpaceX
//
//  Created by Paul Matar on 02/11/2022.
//

import UIKit

final class MainController: UIViewController {
    
    private let viewModel: MainViewModelProtocol

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let titleLabel = UILabel()
        titleLabel.text = "Launches"
        titleLabel.font = UIFont(name: C.Fonts.latoBold, size: 25)

        let leftSpacer = UIBarButtonItem(customView:
                .init(frame: .init(x: 0, y: 0, width: 7, height: 0))
        )
        
        navigationItem.leftBarButtonItems = [
            leftSpacer,
            .init(customView: titleLabel),
        ]
        
        let searchButton = UIButton(type: .custom)
        let searchImage = UIImage(named: C.Images.searchIcon)
        searchButton.setImage(searchImage, for: .normal)
        searchButton.frame = .init(x: 0, y: 0, width: 16, height: 16)
        
        let bellImage = UIImage(named: C.Images.bellIcon)
        let bellButton = BadgeButton()
        bellButton.showBadge(text: "2")
        bellButton.setImage(bellImage, for: .normal)
        bellButton.addTarget(self, action: #selector(bellClicked(sender:)), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [searchButton, bellButton])
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 35
        
        let rightStackView = UIBarButtonItem(customView: stackView)
        let rightSpacer = UIBarButtonItem(customView:
                .init(frame: .init(x: 0, y: 0, width: 7, height: 0))
        )

        navigationItem.rightBarButtonItems = [rightSpacer, rightStackView]
    }

    init(_ viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func bellClicked(sender: BadgeButton) {
        if sender.badgeView == nil {
            sender.showBadge(text: "2")
        } else {
            sender.hideBadge()
        }
    }

}

