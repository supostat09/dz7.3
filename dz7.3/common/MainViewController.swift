//
//  MainViewController.swift
//  dz7.3
//
//  Created by Абдулла-Бек on 28/3/23.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private var personalDataList: [PersonalData] = []
    private var filteredPersonalDataList: [PersonalData] = []
    private var isFiltering = false
    
    private let searchBar = UISearchBar()
    private let tableView = UITableView()
    private let tableViewCell = UITableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        initData()
    }
    
    private func initUI(){
        navigationItem.titleView = searchBar
        view.backgroundColor = .white
        searchBar.placeholder = "Search here"
        
        view.addSubview(tableView)
        searchBar.delegate = self
        tableView.dataSource = self
        
        tableView.register(CompanyTableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(16)
        }
    }
    
    private func initData() {
        personalDataList = [
            PersonalData(title: "C0015",
                         nameCompany: "ABC Company",
                         adreess: "Jl. Merah Biru Nomor 123",
                         email: "abccompany@email.com",
                         phoneNamber: "+6281234567777"),
            PersonalData(title: "C0016",
                         nameCompany: "PQR Company",
                         adreess: "Jl. Merah Biru Nomor 456",
                         email: "pqrcompany@email.com",
                         phoneNamber: "+6281234567888"),
            PersonalData(title: "C0017",
                         nameCompany: "XYZ Company",
                         adreess: "Jl. Merah Biru Nomor 789",
                         email: "xyzcompany@email.com",
                         phoneNamber: "+6281234567890"),
            PersonalData(title: "C0018",
                         nameCompany: "ABCD Company",
                         adreess: "Jl. Merah Hijau Nomor 123",
                         email: "abcdcompany@email.com",
                         phoneNamber: "+628123456555"),
            PersonalData(title: "C0019",
                         nameCompany: "PQRS Company",
                         adreess: "Jl. Biru Kuning Nomor 123",
                         email: "pqrscompany@email.com",
                         phoneNamber: "+6281234563333"),
            PersonalData(title: "C0020",
                         nameCompany: "WXYZ Company",
                         adreess: "Jl. Biru Hijau Nomor 123",
                         email: "wxyzcompany@email.com",
                         phoneNamber: "+7281234569999")
        ]
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isFiltering ? filteredPersonalDataList.count : personalDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        as! CompanyTableViewCell
        cell.setData(title: isFiltering ? filteredPersonalDataList[indexPath.row].title
                     : personalDataList[indexPath.row].title,
                     nameCompany: isFiltering ? filteredPersonalDataList[indexPath.row].nameCompany
                     : personalDataList[indexPath.row].nameCompany,
                     adreess: isFiltering ? filteredPersonalDataList[indexPath.row].adreess
                     : personalDataList[indexPath.row].adreess,
                     email: isFiltering ? filteredPersonalDataList[indexPath.row].email
                     : personalDataList[indexPath.row].email,
                     phoneNamber: isFiltering ? filteredPersonalDataList[indexPath.row].phoneNamber
                     : personalDataList[indexPath.row].phoneNamber)
        return cell
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isFiltering = false
        } else {
            isFiltering = true
            filteredPersonalDataList = personalDataList.filter({$0.nameCompany.contains(searchText)})
        }
        tableView.reloadData()
    }
}
