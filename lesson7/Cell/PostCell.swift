//
//  PostCell.swift
//  lesson7
//
//  Created by Dmitrii Nazarov on 11.08.2024.
//

import UIKit

    
class PostCell: UITableViewCell {
    
    static var id = "PostCell"
    
    lazy var someView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .placeholderText
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 30
        return $0
    }(UIView())
    
    lazy var postImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 240).isActive = true
        $0.image = UIImage(named: "img")
        return $0
    }(UIImageView())
    
    lazy var profileImg: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 70).isActive = true
        $0.widthAnchor.constraint(equalToConstant: 70).isActive = true
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 35
        $0.image = UIImage(named: "circleImg")
        return $0
    }(UIImageView())
    
    lazy var nameabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.text = "Имя Фамилия"
        $0.textColor = .white
        return $0
    }(UILabel())
    
    lazy var headerText: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.text = "Заголовок"
        $0.textColor = .black
        return $0
    }(UILabel())

    lazy var contentText: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 16, weight: .light)
        $0.text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore"
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    lazy var cellBtn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("next", for: .normal)
        $0.heightAnchor.constraint(equalToConstant: 48).isActive = true
        $0.layer.cornerRadius = 15
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .green
        
        return $0
    }(UIButton(primaryAction: nil))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //backgroundColor = .brown
        contentView.addSubview(someView)
        someView.addSubview(postImage)
        someView.addSubview(headerText)
        postImage.addSubview(nameabel)
        postImage.addSubview(profileImg)
        someView.addSubview(contentText)
        someView.addSubview(cellBtn)
        
        setupConstr()
        
    }
    
     func setupView(item: TableData) {
        postImage.image = UIImage(named: item.image) 
        contentText.text = item.content
         profileImg.image = UIImage(named: item.profileImage)
        headerText.text = item.header
        nameabel.text = item.name
        
        setupConstr()
    }
    
    private func  setupConstr () {
        NSLayoutConstraint.activate([
            
            someView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            someView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            someView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            someView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            postImage.topAnchor.constraint(equalTo: someView.topAnchor, constant: 20),
            postImage.leadingAnchor.constraint(equalTo: someView.leadingAnchor, constant: 20),
            postImage.trailingAnchor.constraint(equalTo: someView.trailingAnchor, constant: -20),
            
            profileImg.topAnchor.constraint(equalTo: postImage.topAnchor, constant: 20),
            profileImg.leadingAnchor.constraint(equalTo: postImage.leadingAnchor, constant:20),
            
            nameabel.bottomAnchor.constraint(equalTo: postImage.bottomAnchor, constant: -35),
            nameabel.leadingAnchor.constraint(equalTo: postImage.leadingAnchor, constant: 30),
            nameabel.trailingAnchor.constraint(equalTo: postImage.trailingAnchor, constant: -20),
            
            headerText.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 20),
            headerText.leadingAnchor.constraint(equalTo: someView.leadingAnchor, constant: 30),
            headerText.trailingAnchor.constraint(equalTo: someView.trailingAnchor, constant: -20),
            
            contentText.topAnchor.constraint(equalTo: headerText.bottomAnchor, constant: 15),
            contentText.leadingAnchor.constraint(equalTo: someView.leadingAnchor, constant: 15),
            contentText.trailingAnchor.constraint(equalTo: someView.trailingAnchor, constant: -40),
            
            cellBtn.topAnchor.constraint(equalTo: contentText.bottomAnchor, constant: 20),
            cellBtn.leadingAnchor.constraint(equalTo: someView.leadingAnchor, constant: 20),
            cellBtn.trailingAnchor.constraint(equalTo: someView.trailingAnchor, constant: -20),
            
            someView.bottomAnchor.constraint(equalTo: cellBtn.bottomAnchor, constant: 30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
