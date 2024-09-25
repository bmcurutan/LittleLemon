//
//  Helpers.swift
//  LittleLemon
//
//  Created by Bianca Curutan on 9/25/24.
//

import UIKit

class Helpers {

    // Substring with start and end indices
    static func sub(_ s: String, _ start: Int, _ end: Int) -> String {
      guard start >= 0, start <= end, end < s.count else { return s }

      let startIndex = s.index(s.startIndex, offsetBy: start)
      let endIndex = s.index(s.startIndex, offsetBy: end)
      return "" + s[startIndex..<endIndex]
    }

    static func downloadImage(_ urlString: String, _ imageView: UIImageView) {
        let url = URL(string: urlString)!
        let dataTask = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                imageView.image = UIImage(data: data)
            }
        })
        dataTask.resume()
    }
}
