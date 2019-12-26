//
//  VolumeCell.swift
//  ComicApp
//
//  Created by casandra grullon on 12/26/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import UIKit

class VolumeCell: UITableViewCell {

    @IBOutlet weak var comicImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberOfIssues: UILabel!
    @IBOutlet weak var startYearLabel: UILabel!
    
    var comic: Results?
    
    func configureCell(for comic: Results){
        nameLabel.text = comic.name
        numberOfIssues.text = comic.numberOfIssues?.description
        startYearLabel.text = comic.startYear
        
        comicImage.getImage(with: comic.image.thumbImage) { [weak self] (result) in
            switch result{
            case .failure:
                DispatchQueue.main.async {
                    self?.comicImage.image = UIImage(systemName: "book.fill")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.comicImage.image = image
                }
            }
        }
    }

}
