//
//  AlbumDetailViewController.swift
//  NikeSample
//
//  Created by Srinivas M on 29/07/20.
//  Copyright © 2020 Manasa. All rights reserved.
//

import UIKit

class AlbumDetailViewController: UIViewController {
    
    var album:Album?
    
    let imageV: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "ImagePlaceholder")
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let copyRightLBL: UILabel = {
        let lbl = UILabel.lines(0)
        lbl.textColor = UIColor.blue
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textAlignment = .right
        return lbl
    }()
    
    let nameLBL: UILabel = {
        let lbl = UILabel.lines(2)
        lbl.font = UIFont.boldSystemFont(ofSize: 17)
        return lbl
    }()
    
    let artistNameLBL: UILabel = {
        return UILabel.lines(2)
    }()
    
    let releaseDateLBL: UILabel = {
        return UILabel.lines(1)
    }()
    
    let redirectButton: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.setTitle("Album page in the iTunes store", for: .normal)
        btn.layer.borderColor = UIColor.blue.cgColor
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        
        self.title = album?.name ?? ""
        
        self.prepareViews()
        imageV.image(urlString: album?.artworkUrl100 ?? "")
        nameLBL.text = album?.name
        artistNameLBL.text = album?.artistName
        copyRightLBL.text = album?.copyright
        releaseDateLBL.text = album?.releaseDate
        
        redirectButton.addTarget(self, action: #selector(self.redirectToItunes), for: .touchUpInside)
    }
    
    @objc func redirectToItunes() {
        guard let url  = URL(string: "itms://itunes.apple.com/us/album/ne-olacak-dj-funky-c-vs-ogün-dalka-single/id1202943921".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else {
            return
        }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func prepareViews() {
        self.view.addSubview(imageV)
        self.view.addSubview(nameLBL)
        self.view.addSubview(artistNameLBL)
        self.view.addSubview(copyRightLBL)
        self.view.addSubview(releaseDateLBL)
        self.view.addSubview(redirectButton)
        NSLayoutConstraint.activate([
            imageV.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width),
            imageV.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            imageV.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            imageV.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            
            copyRightLBL.leadingAnchor.constraint(equalTo: self.imageV.leadingAnchor, constant: 20),
            copyRightLBL.bottomAnchor.constraint(equalTo: self.imageV.bottomAnchor, constant: -10),
            copyRightLBL.trailingAnchor.constraint(equalTo: self.imageV.trailingAnchor, constant: -20),
            
            nameLBL.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            nameLBL.topAnchor.constraint(equalTo: self.imageV.bottomAnchor, constant: 20),
            nameLBL.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            artistNameLBL.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            artistNameLBL.topAnchor.constraint(equalTo: self.nameLBL.bottomAnchor, constant: 15),
            artistNameLBL.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            releaseDateLBL.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            releaseDateLBL.topAnchor.constraint(equalTo: self.artistNameLBL.bottomAnchor, constant: 15),
            releaseDateLBL.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            redirectButton.heightAnchor.constraint(equalToConstant: 45),
            redirectButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            redirectButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            redirectButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
        ])
    }
}
