//
//  FourthExampleViewController.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 20.02.2024.
//

import UIKit

class TourDetailsView: UIViewController {
    
    var viewModel: TourDetailViewModelProtocol!
    
    private lazy var blackView: UIView = {
        let view = UIView(frame: view.bounds)
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        view.isHidden = true
        return view
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(TourDetailsTopCollectionCell.self, forCellReuseIdentifier: TourDetailsTopCollectionCell.reuseIdentifier)
        tableView.register(TourDetailsBottomCollectionCell.self, forCellReuseIdentifier: TourDetailsBottomCollectionCell.reuseIdentifier)
        tableView.contentInsetAdjustmentBehavior = .never
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.addSubview(blackView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func blackOutView() {
        blackView.isHidden.toggle()
    }
    
    private func showAlert() {
        let alertVC = AlertViewController()
        alertVC.modalPresentationStyle = .overCurrentContext
        alertVC.modalTransitionStyle = .crossDissolve
        present(alertVC, animated: true)
    }
}

extension TourDetailsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TourDetailsTopCollectionCell.reuseIdentifier, for: indexPath) as! TourDetailsTopCollectionCell
            cell.viewModel = viewModel.getDataForTopCell()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TourDetailsBottomCollectionCell.reuseIdentifier, for: indexPath) as! TourDetailsBottomCollectionCell
            cell.viewModel = viewModel.getDataForBottomCell()
            cell.selectionStyle = .none
            cell.delegate = self
            return cell
        }
    }
}

extension TourDetailsView: UITableViewDelegate {
    // MARK: - Table View Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 389
        } else {
            return UITableView.automaticDimension
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            cell.layer.zPosition = 1
        }
    }
}

extension TourDetailsView: BookButtonDelegate {
    func bookButtonDidTap() {
        let vc = BookView()
        vc.viewModel = viewModel.getDataForBookView()
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        vc.onDismiss = { [weak self] in
            self?.showAlert()
        }
        present(vc, animated: true)
    }
}

extension TourDetailsView: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = PartialSizePresentationController(presentedViewController: presented, presenting: presenting)
        presentationController.presentedHeight = 505
        return presentationController
    }
}

