//
//  AlbumDetailViewControllerTest.swift
//  NikeSampleTests
//
//  Created by Srinivas M on 30/07/20.
//  Copyright © 2020 Manasa. All rights reserved.
//

import XCTest

class AlbumDetailViewControllerTest: XCTestCase {
    
    let albumsVC = AlbumDetailViewController()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        albumsVC.album = Album(artistName: "Brandy", id: "1523385900", releaseDate: "2020-07-31", name: "B7", kind: "album", copyright: "℗ 2020 Brand Nu, Inc./ Entertainment One U.S., LP", artistId: "17416", contentAdvisoryRating: "Explicit", artistUrl: "https://music.apple.com/us/artist/brandy/17416?app=music", artworkUrl100: "https://is4-ssl.mzstatic.com/image/thumb/Music114/v4/20/fb/bd/20fbbda4-38ef-be62-a4b1-9969c9370842/634164638528.png/200x200bb.png", genres: [Genre(genreId: "15", name: "Music", url: "https://itunes.apple.com/us/genre/id15")], url: "https://music.apple.com/us/album/b7/1523385900?app=music")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTableViewPopulatedData() {
        let _ = albumsVC.view
        albumsVC.view.layoutIfNeeded()
        
        XCTAssertEqual(albumsVC.album?.name, albumsVC.title)
        
        XCTAssertEqual(albumsVC.album?.artistName, albumsVC.artistNameLBL.text)
        XCTAssertEqual(albumsVC.album?.name, albumsVC.nameLBL.text)
        XCTAssertEqual(albumsVC.album?.releaseDate, albumsVC.releaseDateLBL.text)
        
        //Check button bottom space is 20
        XCTAssertEqual(20 , albumsVC.view.frame.size.height - (albumsVC.redirectButton.frame.origin.y + 45))
    }

}
