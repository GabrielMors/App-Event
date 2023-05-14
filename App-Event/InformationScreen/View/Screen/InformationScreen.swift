//
//  InformationScreen.swift
//  App-Event
//
//  Created by Gabriel Mors  on 10/05/23.
//

import UIKit

class InformationScreen: UIView {
    
    lazy var scrolView: UIScrollView = {
        let scroll = UIScrollView()
        
        return scroll
    }()
    
    lazy var imageEvent: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.layer.borderWidth = 1.5
        image.layer.borderColor = UIColor(red: 164/255, green: 170/255, blue: 193/255, alpha: 1).cgColor
        
        return image
    }()
    
    lazy var descriptionEvent: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.black
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configConstraints()
        
    }
    
    private func addSubViews() {
        addSubview(imageEvent)
        addSubview(descriptionEvent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            imageEvent.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageEvent.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            imageEvent.widthAnchor.constraint(equalToConstant: 340),
            imageEvent.heightAnchor.constraint(equalToConstant: 240),
            
            descriptionEvent.topAnchor.constraint(equalTo: imageEvent.bottomAnchor, constant: 20),
            descriptionEvent.leadingAnchor.constraint(equalTo: leadingAnchor.self, constant: 20),
            descriptionEvent.trailingAnchor.constraint(equalTo: trailingAnchor.self, constant: -20),
            
        ])
    }
    
}
