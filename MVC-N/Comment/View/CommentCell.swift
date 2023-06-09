//
//  CommentCell.swift
//  MVC-N
//
//  Created by Evgenii Kutasov on 08.06.2023.
//

import UIKit

final class CommentCell: UITableViewCell {
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(textView)
        NSLayoutConstraint.activate([ // мне кажется что эта часть ошибочная и можно было бы ее натсроить сразу

            topAnchor.constraint(equalTo: label.topAnchor),
            bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: 100),
            leadingAnchor.constraint(equalTo: label.leadingAnchor, constant: -30),
            trailingAnchor.constraint(equalTo: label.trailingAnchor),
        ])
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: textView.topAnchor, constant: -40),
            bottomAnchor.constraint(equalTo: textView.bottomAnchor, constant: 30),
            leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: -30),
            trailingAnchor.constraint(equalTo: textView.trailingAnchor, constant: 30),
        ])
    }
    
    func configure(with comment: Comment) {
        label.text = comment.name
        textView.text = comment.body
    }
    
}
