import UIKit

protocol HomeCellProtocol: AnyObject {
    func tappedButton()
}

class HomeCell: UITableViewCell {
    
    static var identifier: String = String(describing: HomeCell.self)
    
    var delegate: HomeCellProtocol?
    
    func delegate(delegate: HomeCellProtocol) {
        self.delegate = delegate
    }
    
    lazy var NameOfEvent: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Nome do evento"
        name.font = UIFont.systemFont(ofSize: 20)
        
        return name
    }()
    
    lazy var imageOfEvent: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.fill")
        image.contentMode = .scaleToFill
        image.tintColor = .black
        
        return image
    }()
    
    lazy var acessarButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Acessar", for: .normal)
        button.tintColor = UIColor.black
        button.backgroundColor = .darkGray
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(self.imageOfEvent)
        contentView.addSubview(self.NameOfEvent)
        contentView.addSubview(self.acessarButton)
        configConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: Evento) {
        NameOfEvent.text = model.name
        imageOfEvent.image = UIImage(systemName: model.image)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            imageOfEvent.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageOfEvent.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageOfEvent.widthAnchor.constraint(equalToConstant: 80),
            imageOfEvent.heightAnchor.constraint(equalToConstant: 80),
            
            NameOfEvent.leadingAnchor.constraint(equalTo: self.imageOfEvent.trailingAnchor, constant: 15),
            NameOfEvent.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            NameOfEvent.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            acessarButton.leadingAnchor.constraint(equalTo: self.imageOfEvent.trailingAnchor, constant: 15),
            acessarButton.topAnchor.constraint(equalTo: self.NameOfEvent.bottomAnchor, constant: 10),
            acessarButton.widthAnchor.constraint(equalToConstant: 80),
            
        ])
    }
    
    @objc private func buttonTapped() {
        delegate?.tappedButton()
    }
}
