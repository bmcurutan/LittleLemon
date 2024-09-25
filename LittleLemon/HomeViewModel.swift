//
//  HomeViewModel.swift
//  LittleLemon
//
//  Created by Bianca Curutan on 9/24/24.
//

import UIKit

struct JSONMenu: Codable {
    let menu: [MenuItem]
}

struct MenuItem: Codable, Identifiable {
    var id: Int
    let title: String
    let price: String
    let description: String
    let image: String
}

class HomeViewModel {
    var menuItems: [MenuItem] = []
    
    func getMenuData() {
        // Temp: local json
        if let url = Bundle.main.url(forResource: "menu", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(JSONMenu.self, from: data)
                menuItems = jsonData.menu
            } catch {
                print("error: \(error)")
            }
        }

        // From URL
//        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data else { return }
//            do {
//                let decoder = JSONDecoder()
//                let jsonData = try decoder.decode(JSONMenu.self, from: data)
//                self.menuItems = jsonData.menu
//            } catch {
//                print("error: \(error)")
//            }
//        }
//        task.resume()
    }
}
