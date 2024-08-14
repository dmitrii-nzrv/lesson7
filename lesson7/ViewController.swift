//
//  ViewController.swift
//  lesson7
//
//  Created by Dmitrii Nazarov on 11.08.2024.
//

import UIKit

class ViewController: UIViewController {
    let users = TableData.mockData()
    
    lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.separatorStyle = .none
        $0.register(PostCell.self, forCellReuseIdentifier: PostCell.id)
        
        return $0
    }(UITableView(frame: view.frame, style: .plain))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        // title = "Friends"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.id, for: indexPath) as! PostCell
        let item = users[indexPath.row]
        cell.setupView(item: item)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let vc = SecondViewController()
        //vc.userData = users[indexPath.row]
        //navigationController?.pushViewController(vc, animated: true)
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//           return "new"
//       }
}

struct TableData {
    let name: String
    let profileImage: String
    let header: String
    let content: String
    let image: String
    
    static func mockData() -> [TableData] {
        [
        TableData(name: "Petr Yan", profileImage: "circleImg", header: "Заголовок", content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore", image: "img"),
        TableData(name: "Dmitrii Nazarov", profileImage: "circleImgTwo", header: "Заголовок", content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore", image: "imgTwo")
        ]
    }
}

