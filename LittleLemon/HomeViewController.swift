//
//  HomeViewController.swift
//  LittleLemon
//
//  Created by Bianca Curutan on 9/24/24.
//

import SwiftUI
import UIKit

class HomeViewController: UIViewController {

    private let viewModel = HomeViewModel()

    private var menuTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getMenuData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Navigation bar
        title = "Little Lemon"
        navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"))

        // About
        let aboutView = UIHostingController(rootView: AboutView()).view!
        aboutView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aboutView)
        NSLayoutConstraint.activate([
            aboutView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            aboutView.leftAnchor.constraint(equalTo: view.leftAnchor),
            view.rightAnchor.constraint(equalTo: aboutView.rightAnchor),
            aboutView.heightAnchor.constraint(equalToConstant: 300)
        ])
        aboutView.backgroundColor = .lightGray

        // Search bar TODO

        // Order
        menuTableView.dataSource = self
        menuTableView.delegate = self
        menuTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(menuTableView)
        NSLayoutConstraint.activate([
            menuTableView.topAnchor.constraint(equalTo: aboutView.bottomAnchor, constant: 24),
            menuTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: menuTableView.bottomAnchor),
            view.rightAnchor.constraint(equalTo: menuTableView.rightAnchor)
        ])
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.menuItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell() 
        cell.textLabel?.text = viewModel.menuItems[indexPath.row].title
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(MenuItemViewController(viewModel.menuItems[indexPath.row]), animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
