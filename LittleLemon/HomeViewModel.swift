//
//  HomeViewModel.swift
//  LittleLemon
//
//  Created by Bianca Curutan on 9/24/24.
//

import UIKit

class HomeViewModel {
    var menuItems: [MenuItem] = []

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

        // TODO
//        let url = URL(filePath: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
//        let urlRequest = URLRequest(url: url)
//        let urlSession = URLSession.shared
//        let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
//            do {
//                let fullMenu = try JSONDecoder().decode(JSONMenu.self, from: data!)
//                self.menuItems = fullMenu.menu
//            } catch let parseError {
//                print("JSON Error \(parseError.localizedDescription)")
//            }
////            let fullMenu = try JSONDecoder().decode(JSONMenu.self, from: data!)
////            menuItems = fullMenu.menu
//        }
//        dataTask.resume()
    }
}
