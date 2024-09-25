//
//  MenuItemViewController.swift
//  LittleLemon
//
//  Created by Bianca Curutan on 9/24/24.
//

import UIKit

class MenuItemViewController: UITableViewController {

    private enum Property: Int {
        case image
        case title
        case price
        case description
    }

    private var menuItem: MenuItem?

    convenience init() {
        self.init()
    }

    init(_ menuItem: MenuItem) {
        self.menuItem = menuItem
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()

        guard let menuItem = menuItem else { return cell }

        switch Property(rawValue: indexPath.row) {
        case .image:
            Helpers.downloadImage(menuItem.image, cell.imageView!)
            cell.setNeedsLayout()
        case .title:
            cell.textLabel?.text = menuItem.title
        case .price:
            cell.textLabel?.text = menuItem.price
        case .description:
            cell.textLabel?.text = menuItem.description
        default:
            break
        }

        return cell
    }
}
