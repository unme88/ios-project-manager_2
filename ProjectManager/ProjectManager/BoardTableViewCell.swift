//
//  BoardTableViewCell.swift
//  ProjectManager
//
//  Created by 강인희 on 2021/03/09.
//

import UIKit

class BoardTableViewCell: UITableViewCell {
    static let identifier = "BoardTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateUI(with todoItem: TodoItem) {
        self.titleLabel.text = todoItem.title
        self.descriptionLabel.text = todoItem.description
        self.dueDateLabel.text = todoItem.dueDate
    }
}
