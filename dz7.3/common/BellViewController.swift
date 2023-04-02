//
//  BellViewController.swift
//  dz7.3
//
//  Created by Абдулла-Бек on 28/3/23.
//

import UIKit

class BellViewController: UIViewController {
    
    private var personalDataList: [PersonalData] = []
    private let searchBar = UISearchBar()
    
    private let mapImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "map")
        return image
    }()
    
    private let tabelView = UITableView()
    private let tabelViewCell = UITableViewCell()
       
    override func viewDidLoad() {
        super.viewDidLoad ()
        
        initUI()
        initData()
    }
    
    private func initUI(){
        //navigationItem.titleView = searchBar
        view.backgroundColor = .white
        searchBar.placeholder = "Search here"
        
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        
        view.addSubview(mapImage)
        mapImage.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        view.addSubview(tabelView)
        tabelView.dataSource = self
        tabelView.snp.makeConstraints { make in
            make.top.equalTo(mapImage.snp.bottom)
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview()
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

extension BellViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personalDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        as! BellTableViewCell
        cell.setData(name: personalDataList[indexPath.row].nameCompany,
                     adreess: personalDataList[indexPath.row].adreess)
        return cell
    }
    
    
}

