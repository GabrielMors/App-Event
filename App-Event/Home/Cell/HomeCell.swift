import UIKit

protocol HomeCellProtocol {
    func tappedButton()
}

class HomeCell: UITableViewCell {
    
    static var identifier: String = String(describing: HomeCell.self)
    
    var delegate: HomeCellProtocol?
    
    public func delegate(delegate: HomeCellProtocol) {
        self.delegate = delegate
    }
    
    lazy var NameOfEventLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        
        return label
    }()
    
    lazy var imageOfEventImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.tintColor = .black
        
        return image
    }()
    
    lazy var acessarButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Acessar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(self.imageOfEventImage)
        contentView.addSubview(self.NameOfEventLabel)
        contentView.addSubview(self.acessarButton)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: Evento) {
        NameOfEventLabel.text = model.name
        imageOfEventImage.image = UIImage(systemName: model.image)
    }
    
    @objc private func buttonTapped() {
        self.delegate?.tappedButton()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            imageOfEventImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageOfEventImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageOfEventImage.widthAnchor.constraint(equalToConstant: 80),
            imageOfEventImage.heightAnchor.constraint(equalToConstant: 80),
            
            NameOfEventLabel.leadingAnchor.constraint(equalTo: self.imageOfEventImage.trailingAnchor, constant: 15),
            NameOfEventLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            NameOfEventLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            acessarButton.leadingAnchor.constraint(equalTo: self.imageOfEventImage.trailingAnchor, constant: 15),
            acessarButton.topAnchor.constraint(equalTo: self.NameOfEventLabel.bottomAnchor, constant: 10),
            acessarButton.widthAnchor.constraint(equalToConstant: 80),
            
        ])
    }
}
