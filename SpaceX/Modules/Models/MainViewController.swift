//
//  ViewController.swift
//  SpaceX
//
//  Created by Paul Matar on 02/11/2022.
//

import UIKit
import Combine

final class MainViewController: UIViewController {
    
    private let viewModel: MainViewModelProtocol
    
    private let mainView = MainView()
    
    private var cancellables = Set<AnyCancellable>()
    
    private lazy var dataSource = configureDataSource()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        bindViewModel()
        viewModel.getLaunches()
    }

    init(_ viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods

extension MainViewController {
    
    private func commonInit() {
        mainView.collectionView.delegate = self
    }
    
    private func setupNavBar() {
        let titleLabel = UILabel()
        titleLabel.text = C.Text.title
        titleLabel.font = UIFont(name: C.Fonts.latoBold, size: 25)

        let leftSpacer = UIBarButtonItem(customView:
                .init(frame: .init(x: 0, y: 0, width: 7, height: 0))
        )
        
        navigationItem.leftBarButtonItems = [leftSpacer, .init(customView: titleLabel)]
        
        let searchButton = UIButton(type: .custom)
        let searchImage = UIImage(named: C.Images.search)
        searchButton.setImage(searchImage, for: .normal)
        searchButton.frame = .init(x: 0, y: 0, width: 16, height: 16)
        
        let bellImage = UIImage(named: C.Images.bell)
        let bellButton = BadgeButton()
        bellButton.showBadge(text: "2")
        bellButton.setImage(bellImage, for: .normal)
        
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
    
    private func bindViewModel() {
        viewModel.refresh
            .receive(on: RunLoop.main)
            .sink { [weak self] _ in
                self?.setData(animated: true)
            }
            .store(in: &cancellables)
    }
}

// MARK: - CollectionView Delegate

extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let launch = dataSource.itemIdentifier(for: indexPath) else { return }
        viewModel.goToDetails(launch)
    }
}

// MARK: - Diffable Data Source Setup

extension MainViewController {
    
    fileprivate typealias LaunchDataSource = UICollectionViewDiffableDataSource<Section, LaunchModel>
    fileprivate typealias LaunchSnapshot = NSDiffableDataSourceSnapshot<Section, LaunchModel>

    fileprivate enum Section {
        case main
    }
    
    private func configureDataSource() -> LaunchDataSource {
        let cellRegistration = UICollectionView.CellRegistration<LaunchCell, LaunchModel> { cell, _, model in
            cell.configure(with: model)
        }
        
        return LaunchDataSource(collectionView: mainView.collectionView) { collectionView, indexPath, itemIdentifier in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
    }
    
    private func setData(animated: Bool) {
        var snapshot = LaunchSnapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel.launches)
        
        dataSource.apply(snapshot, animatingDifferences: animated)
    }
}
