//
//  ViewController.swift
//  TeslaSelection
//
//  Created by Asit Aslan on 9.02.2021.
//  Copyright © 2021 Asit Aslan. All rights reserved.
//

import UIKit




class TableHeader: UITableViewHeaderFooterView {
    
    static let identifier = "TableHeader"
    
    private let imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "car")
        return imageView
    }()
    
    private let label: UILabel = {
        
        let label = UILabel()
        label.text = "Select Tesla"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .center
        
        return label
        
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(imageView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.sizeToFit()
        label.frame = CGRect(x: 0, y: contentView.frame.size.height-10-label.frame.size.height, width: contentView.frame.size.width, height: label.frame.size.height)
        imageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height-15-label.frame.size.height)
    }
    
    
}

class TableFooter: UITableViewHeaderFooterView{
    
    
}

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    
   
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
        
        table.register(TableHeader.self, forHeaderFooterViewReuseIdentifier: "header")
    }()
    
    private let models = [
       
        "MODEL S",
        "MODEL X",
        "MODEL Y",
        "MODEL 3",
        "MODEL S P90"
        
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return models.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "header")
        
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
}

