//
//  FetchData.swift
//  NikeSample
//
//  Created by Manasa Pusuluru on 29/07/20.
//  Copyright © 2020 Manasa. All rights reserved.
//

import UIKit

struct Feed: Codable {
    public var feed : Results?
}

struct Results: Codable {
    public var results : [Album]?
}

struct Album: Codable {
    public var artistName: String?
    public var id: String?
    public var releaseDate: String?
    public var name: String?
    public var kind: String?
    public var copyright: String?
    public var artistId: String?
    public var contentAdvisoryRating: String?
    public var artistUrl: String?
    public var artworkUrl100: String?
    public var genres : [Genre]?
    public var url: String?
}

struct Genre: Codable {
    public var genreId: String?
    public var name: String?
    public var url: String?
}

class FetchData: NSObject {
    
    static let shared = FetchData()
    
    static let cache = NSCache<NSURL, UIImage>()
    
    func getData(completionBlock:@escaping (_ response:(Feed?,String?)) -> Void) {
        let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/100/explicit.json")!
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    let decodedData = try JSONDecoder().decode(Feed.self, from: todoData)
                    DispatchQueue.main.async {
                        completionBlock((decodedData,nil))
                    }
                } else {
                    print("No data found")
                    completionBlock((nil,"No data found"))
                }
            } catch {
                print("Error")
                completionBlock((nil,error.localizedDescription))
            }
        }.resume()
    }
}
