//
//  DetailsViewController.swift
//  SpaceX
//
//  Created by Paul Matar on 02/11/2022.
//

import UIKit
import Combine

final class DetailsViewController: UIViewController {
    
    private let viewModel: DetailsViewModelProtocol
    
    private let detailsView = DetailsView()
    
    private var cancellables = Set<AnyCancellable>()

    override func loadView() {
        view = detailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.mapModel()
    }
    
    init(_ viewModel: DetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
    // MARK: - Private methods

extension DetailsViewController {
    
    private func commonInit() {
        detailsView.closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        detailsView.bottomView.buttonsView.readMoreButton.addTarget(self, action: #selector(readMore), for: .touchUpInside)
        detailsView.bottomView.buttonsView.shareButton.addTarget(self, action: #selector(share), for: .touchUpInside)
    }
    
    private func bindViewModel() {
        viewModel.update
            .receive(on: RunLoop.main)
            .sink { [weak self] _ in
                self?.configureWithModel()
            }
            .store(in: &cancellables)
    }
    
    private func configureWithModel() {
        if let model = viewModel.rocketModel {
            detailsView.backgroundImageView.image = model.image
            detailsView.bottomView.descriptionView.dateLabel.text = model.date
            detailsView.bottomView.descriptionView.descriptionLabel.text = model.description
            detailsView.bottomView.descriptionView.descriptionLabel.setLineHeight(10)
            detailsView.bottomView.topInfoView.nameLabel.text = model.name
            detailsView.bottomView.topInfoView.recordLabel.text = model.flightNumber
            detailsView.indicatorLine.isHidden = !model.upcoming
        }
    }
    
    @objc private func close() {
        dismiss(animated: true)
    }
    
    @objc private func readMore() {
        guard let strUrl = viewModel.rocketModel?.link else { return }
        guard let url = URL(string: strUrl) else { return }
        UIApplication.shared.open(url, options: [:]) { _ in }
    }
    
    @objc private func share() {
        let image = viewModel.rocketModel?.image as Any
        let text = viewModel.rocketModel?.description as Any
        let itemsToShare = [image, text]
        let activityViewController = UIActivityViewController(activityItems: itemsToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = view
        present(activityViewController, animated: true, completion: nil)
    }
}
