//
//  ViewExtentions.swift
//  NikeSample
//
//  Created by Manasa Pusuluru on 29/07/20.
//  Copyright © 2020 Manasa. All rights reserved.
//

import UIKit

extension UIImageView {
    func image(urlString:String, completion: (() -> Void)? = nil) {
        guard let url = URL(string: urlString) else { return }
        if let image = FetchData.cache.object(forKey: url as NSURL) {
            self.image = image
        } else {
            self.image = UIImage(named: "ImagePlaceholder")
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else { return }
                guard let image = UIImage(data: data) else { return }
                FetchData.cache.setObject(image, forKey: url as NSURL)
                RunLoop.main.perform {
                    self.image = image
                    completion?()
                }
            }.resume()
        }
    }
}

extension UILabel {
    static func lines(_ count:Int) -> UILabel {
        let label = UILabel()
        label.numberOfLines = count
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
