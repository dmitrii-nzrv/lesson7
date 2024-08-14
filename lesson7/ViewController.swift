//
//  ViewController.swift
//  lesson7
//
//  Created by Dmitrii Nazarov on 11.08.2024.
//

import UIKit

class ViewController: UIViewController {
    let users = UserData.mockData()
    
    lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        title = "Friends"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath )
        let user = users[indexPath.row]
        
        var config = cell.defaultContentConfiguration()
        config.text = user.name
        config.secondaryText = user.msgs
        config.image = UIImage(systemName: user.image)
        
        cell.accessoryType = .disclosureIndicator
        
        cell.contentConfiguration = config
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let vc = SecondViewController()
        //vc.userData = users[indexPath.row]
        //navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           return "new"
       }
}

struct UserData {
    let name: String
    let msgs: String
    let image: String
    
    static func mockData() -> [UserData] {
        [
        UserData(name: "Иван Обухов", msgs: "30 сообщений", image: "binoculars.fill"),
        UserData(name: "Петр Ян", msgs: "20 сообщений", image: "bell.slash.fill"),
        UserData(name: "Альберт Дьяковский", msgs: "15 сообщений", image: "bolt.slash.circle.fill"),
        ]
    }
}

