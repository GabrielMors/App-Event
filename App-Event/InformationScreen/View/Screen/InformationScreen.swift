//
//  InformationScreen.swift
//  App-Event
//
//  Created by Gabriel Mors  on 10/05/23.
//

import UIKit

class InformationScreen: UIView {
    
    lazy var imageEvent: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.layer.borderWidth = 1.5
        image.layer.borderColor = UIColor(red: 164/255, green: 170/255, blue: 193/255, alpha: 1).cgColor
        
        return image
    }()
    
    lazy var scrolView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isScrollEnabled = true // desabilita o scroll para a imagem
        
        return scroll
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
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
        scrolView.addSubview(containerView)
        containerView.addSubview(descriptionEvent)
        addSubview(imageEvent)
        addSubview(scrolView)
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
            
            scrolView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrolView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrolView.topAnchor.constraint(equalTo: imageEvent.bottomAnchor, constant: 20),
            scrolView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            containerView.leadingAnchor.constraint(equalTo: scrolView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrolView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: scrolView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrolView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrolView.widthAnchor),
            
            descriptionEvent.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            descriptionEvent.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            descriptionEvent.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            descriptionEvent.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        ])
        
        // define o tamanho do contentSize do UIScrollView com base no tamanho do UILabel
        scrolView.contentSize = CGSize(width: containerView.frame.size.width, height: descriptionEvent.frame.size.height + 20)
    }
}
