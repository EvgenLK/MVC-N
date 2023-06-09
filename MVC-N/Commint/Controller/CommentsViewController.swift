//
//  CommentsViewController.swift
//  MVC-N
//
//  Created by Evgenii Kutasov on 08.06.2023.
//

import UIKit

class CommentsViewController: UIViewController {
    
    lazy private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: tableView.topAnchor),
            view.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
        ])
        tableView.dataSource = self
        tableView.rowHeight = 150
        tableView.register(CommentCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    var comments = [Comment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CommentNetworkService.getComments { response in
            self.comments = response.comments
            self.tableView.reloadData()
        }
    }
}

extension CommentsViewController: UITableViewDelegate {}

extension CommentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CommentCell
        let comment = comments[indexPath.row]
        cell.configure(with: comment)
        return cell
    }
    
}
