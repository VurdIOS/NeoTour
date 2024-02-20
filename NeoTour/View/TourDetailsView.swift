//
//  FourthExampleViewController.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 20.02.2024.
//

import UIKit

class TourDetailsView: UIViewController {
    
    var tour: TourModel!

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
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
    }


}

extension TourDetailsView: UITableViewDataSource {
    // MARK: - Table View Data Source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TourDetailsTopCollectionCell.reuseIdentifier, for: indexPath) as! TourDetailsTopCollectionCell
            cell.pictureImageView.image = tour.image
            return cell
        } else {
            // Ячейка с текстом и отзывами
            let cell = tableView.dequeueReusableCell(withIdentifier: TourDetailsBottomCollectionCell.reuseIdentifier, for: indexPath) as! TourDetailsBottomCollectionCell
            // Тут должен быть твой кастомный код для настройки внешнего вида ячейки с текстом и отзывами
            cell.configure(tour: tour)
            cell.selectionStyle = .none
            cell.bookButtonTriger = {
                // тут сетить кнопку
            }
            return cell
        }
    }

}

extension TourDetailsView: UITableViewDelegate {
    // MARK: - Table View Delegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Возвращаем высоту ячейки в зависимости от её позиции
        if indexPath.row == 0 {
            // Высота для ячейки с изображением
            return 389
        } else {
            // Высота для ячейки с текстом и отзывами
            return UITableView.automaticDimension
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Этот метод вызывается перед отображением ячейки. Здесь мы настраиваем zPosition, чтобы нижняя ячейка отображалась поверх верхней.
        if indexPath.row == 1 {
            cell.layer.zPosition = 1
        }
    }
}
