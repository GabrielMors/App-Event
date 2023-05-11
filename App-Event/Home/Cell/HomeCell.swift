import UIKit

class HomeCell: UITableViewCell {
    
    static var identifier: String = String(describing: HomeCell.self)
    
    lazy var NameOfEvent: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Nome do evento"
        name.font = UIFont.systemFont(ofSize: 20)
        
        return name
    }()
    
    lazy var imageOfEvent: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "person.fill")
        img.contentMode = .scaleToFill
        img.tintColor = .black
        
        return img
    }()
    
    lazy var acessarButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("Acessar", for: .normal)
        bt.tintColor = UIColor.black
        bt.backgroundColor = .darkGray
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 7.5
        
        return bt
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(self.imageOfEvent)
        self.addSubview(self.NameOfEvent)
        self.addSubview(self.acessarButton)
        configConstraints()
        self.acessarButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
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
            
            acessarButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            acessarButton.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            acessarButton.widthAnchor.constraint(equalToConstant: 80)
            
        ])
    }
    
    @objc private func buttonTapped() {
        
    }
    
}
