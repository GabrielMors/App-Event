
import UIKit

class HomeScreen: UIView {

    lazy var tableView: UITableView = {
        let tb: UITableView = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.isScrollEnabled = true
        tb.showsVerticalScrollIndicator = false
        
        return tb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configContraints()
    }
    
    private func addSubViews() {
        addSubview(tableView)
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
    
}


