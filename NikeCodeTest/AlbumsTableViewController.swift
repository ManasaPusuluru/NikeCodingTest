//
//  AlbumsTableViewController.swift
//  NikeSample
//
//  Created by Srinivas M on 29/07/20.
//  Copyright © 2020 Manasa. All rights reserved.
//

import UIKit

class AlbumsTableViewController: UITableViewController {
    
    var feedData = Feed()
    var albumList = [Album]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Albums"
        
        self.tableView.register(AlbumCell.self, forCellReuseIdentifier: "AlbumCell")
        
        loadData()
    }
    
    func loadData() {
        FetchData.shared.getData { (response) in
            if let data = response.0 {
                self.feedData = data
                self.albumList = data.feed?.results ?? [Album]()
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell") as? AlbumCell else { return UITableViewCell() }
        cell.album = albumList[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AlbumDetailViewController()
        vc.album = albumList[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

class AlbumCell: UITableViewCell {
    
    let imageV: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "ImagePlaceholder")
        iv.layer.borderWidth = 2
        iv.layer.borderColor = UIColor.lightGray.cgColor
        iv.layer.cornerRadius = 5
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let nameLBL: UILabel = {
        let lbl = UILabel.lines(2)
        lbl.font = UIFont.boldSystemFont(ofSize: 17)
        return lbl
    }()
    
    let artistNameLBL: UILabel = {
        return UILabel.lines(2)
    }()
    
    var album : Album? {
        didSet {
            imageV.image(urlString: album?.artworkUrl100 ?? "")
            nameLBL.text = album?.name
            artistNameLBL.text = album?.artistName
        }
    }
    
    func prepareViews() {
        addSubview(imageV)
        addSubview(nameLBL)
        addSubview(artistNameLBL)
        NSLayoutConstraint.activate([
            imageV.widthAnchor.constraint(equalToConstant: 80),
            imageV.heightAnchor.constraint(equalToConstant: 80),
            imageV.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            imageV.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            imageV.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            
            nameLBL.leadingAnchor.constraint(equalTo: self.imageV.trailingAnchor, constant: 15),
            nameLBL.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -5),
            nameLBL.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            
            artistNameLBL.leadingAnchor.constraint(equalTo: self.imageV.trailingAnchor, constant: 15),
            artistNameLBL.topAnchor.constraint(equalTo: self.nameLBL.bottomAnchor, constant: 5),
            artistNameLBL.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20)
        ])
    }

    // Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
