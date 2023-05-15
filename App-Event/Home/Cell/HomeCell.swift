import UIKit

protocol HomeCellProtocol: AnyObject {
    func tappedButton(row: Int)
}

class CustomButton: UIButton {
    var row: Int?
}

class HomeCell: UITableViewCell {
    
    static var identifier: String = String(describing: HomeCell.self)
    
    var delegate: HomeCellProtocol?
    var viewModel: HomeViewModel?
    
    func delegate(delegate: HomeCellProtocol) {
        self.delegate = delegate
    }
    
    lazy var NameOfEvent: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.numberOfLines = 2
        name.font = UIFont.systemFont(ofSize: 16)
        
        return name
    }()
    
    lazy var imageOfEvent: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.layer.borderWidth = 1.5
        image.layer.borderColor = UIColor(red: 164/255, green: 170/255, blue: 193/255, alpha: 1).cgColor
        
        return image
    }()
    
    lazy var acessarButton: CustomButton = {
        let button = CustomButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Acessar", for: .normal)
        button.tintColor = UIColor.black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.backgroundColor = .darkGray
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.addTarget(self, action: #selector(buttonTapped(_ :)), for: .touchUpInside)
        
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
    
    @objc private func buttonTapped(_ customButton: CustomButton) {
        delegate?.tappedButton(row: customButton.row ?? 0)
    }
    
    func setupCell(model: Evento) {
        NameOfEvent.text = model.title
        imageOfEvent.image = UIImage(systemName: model.image)
    }
    
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            imageOfEvent.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageOfEvent.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageOfEvent.widthAnchor.constraint(equalToConstant: 100),
            imageOfEvent.heightAnchor.constraint(equalToConstant: 100),
            
            NameOfEvent.leadingAnchor.constraint(equalTo: self.imageOfEvent.trailingAnchor, constant: 15),
            NameOfEvent.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            NameOfEvent.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            acessarButton.leadingAnchor.constraint(equalTo: self.imageOfEvent.trailingAnchor, constant: 15),
            acessarButton.topAnchor.constraint(equalTo: self.NameOfEvent.bottomAnchor, constant: 10),
            acessarButton.widthAnchor.constraint(equalToConstant: 80),
            
        ])
    }
}
