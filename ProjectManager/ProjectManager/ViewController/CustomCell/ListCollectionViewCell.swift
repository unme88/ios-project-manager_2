//
//  ListCollectionViewCell.swift
//  ProjectManager
//
//  Created by sole on 2021/03/09.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    static var identifier: String {
        return "\(self)"
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ListItemTableViewCell.self, forCellReuseIdentifier: ListItemTableViewCell.identifier)
        tableView.backgroundColor = .systemGray6
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        delegateDelegate()
        setUpContentView()
        configureAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func delegateDelegate() {
        tableView.dataSource = self
    }
    
    private func setUpContentView() {
        contentView.addSubview(tableView)
    }
    
    private func configureAutoLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configureTableHeaderView(itemStatus: ItemStatus) {
        let headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        headerView.backgroundColor = .systemGray6
        headerView.fillHeaderViewText(itemStatus: itemStatus)
        tableView.tableHeaderView = headerView
    }
}

// MARK: - TableView DataSource
extension ListCollectionViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListItemTableViewCell.identifier, for: indexPath) as? ListItemTableViewCell else {
            return UITableViewCell()
        }
        let todo = Todo(title: "지금 시간", description: "우리 커밋하고 있어여", deadLine: Date())
        cell.fillLabelsText(item: todo)
        return cell
    }
}
