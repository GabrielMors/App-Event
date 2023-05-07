import UIKit

class HomeCell: UITableViewCell {
    
    static var identifier = String(describing: HomeViewController.self)
    
    lazy var nameOfEvent: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = true
        name.text = "Nome do evento"
        
        return name
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            nameOfEvent.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            nameOfEvent.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            nameOfEvent.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            nameOfEvent.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -15),
            
        ])
    }
    
    
    public func setupCell(name: String) {
        nameOfEvent.text = name
    }
    
}
