
import UIKit

class HomeScreen: UIView {
    
    lazy var ListOfEventLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "List Of Event"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .lightGray
        label.backgroundColor = .darkGray
        label.clipsToBounds = true
        label.layer.cornerRadius = 7.5
        
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tb: UITableView = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.isScrollEnabled = true
        
        return tb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configContraints()
        configConstraintsLabel()
    }
    
    private func addSubViews() {
        self.addSubview(self.tableView)
        self.addSubview(self.ListOfEventLabel)
    }
    
    public func configProtocolTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        tableView.register(HomeCell.self, forCellReuseIdentifier: HomeCell.identifier)
    }
    
    private func configContraints() {
        tableView.pin(to: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraintsLabel() {
        NSLayoutConstraint.activate([
            
            // adiciona a constraint de topo com a view em vez da safe area
            ListOfEventLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            ListOfEventLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            ListOfEventLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        
        ])
    }
    
}


