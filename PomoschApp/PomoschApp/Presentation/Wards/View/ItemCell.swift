//
//  WardTableViewCell.swift
//  PomoschApp
//
//  Created by nastasya on 30.06.2024.
//

import UIKit

final class ItemCell: UICollectionViewCell {
    
    static let identifier = "ItemCell"
    private static let imageCache = NSCache<NSString, UIImage>()
    
    private var titleLabel = UILabel()
    private var photoImageView = UIImageView()
    private var backView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with ward: Ward) {
        titleLabel.text = ward.fullName
        loadImage(from: ward.photoURL)
    }
    
    private func setupContentView() {
        setupBackView()
        setupFullNameLabel()
        setupPhotoImageView()
        setupConstraints()
    }
    
    private func setupBackView() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.layer.cornerRadius = 20
        backView.backgroundColor = .white
        contentView.addSubview(backView)
    }
    
    private func setupFullNameLabel() {
        titleLabel.text = "Имя Фамилия"
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 25, weight: .semibold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        backView.addSubview(titleLabel)
    }
    
    private func setupPhotoImageView() {
        photoImageView.image = UIImage(systemName: "person.circle.fill")
        photoImageView.layer.cornerRadius = CellDimensions.cellPhotoDimensions / 2
        photoImageView.layer.masksToBounds = true
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        backView.addSubview(photoImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            
            photoImageView.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            photoImageView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            photoImageView.widthAnchor.constraint(equalToConstant: CellDimensions.cellPhotoDimensions),
            photoImageView.heightAnchor.constraint(equalToConstant: CellDimensions.cellPhotoDimensions),
            
            titleLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20)
        ])
    }
    
    private func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        if let cachedImage = ItemCell.imageCache.object(forKey: urlString as NSString) {
            let circularImage = self.makeCircularImage(image: cachedImage)
            photoImageView.image = circularImage
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            do {
                let data = try Data(contentsOf: url)
                if data.isEmpty {
                    print("Failed to load image data or data is empty.")
                    return
                }
                
                guard let image = UIImage(data: data) else {
                    print("Failed to decode image.")
                    return
                }
                
                ItemCell.imageCache.setObject(image, forKey: urlString as NSString)
                
                DispatchQueue.main.async {
                    guard let self = self else { return }
                    
                    let circularImage = self.makeCircularImage(image: image)
                    
                    UIView.transition(with: self.photoImageView, duration: 0.3, options: .transitionCrossDissolve, animations: {
                        self.photoImageView.image = circularImage
                    }, completion: nil)
                }
            } catch {
                print("Failed to load image data with error: \(error)")
            }
        }
    }
    
    private func makeCircularImage(image: UIImage) -> UIImage {
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: CellDimensions.cellPhotoDimensions, height: CellDimensions.cellPhotoDimensions)
        imageView.layer.cornerRadius = CellDimensions.cellPhotoDimensions / 2
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else { return image }
        imageView.layer.render(in: context)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result ?? image
    }
}

