// 
//  HistoryView.swift
//  TestProject
//
//  Created by rickyTA on 02/02/24.
//

import UIKit

class HistoryView: UIViewController {
    
    //MARK: - Property HistoryView
    @IBOutlet weak var toolbar: ToolbarView!
    @IBOutlet weak var mainTable: UITableView!
    @IBOutlet weak var backHome: UIButton!
    var presenter: VTPHistoryProtocol?
    var listPay : [ResultPayEntity] = [ResultPayEntity]()
    //MARK: - Lifecycle HistoryView
    override func viewDidLoad() {
        setupView()
        setupAction()
        setupData()
    }
}
extension HistoryView{
    //MARK: - Function HistoryView
    func setupView(){
        toolbar.setToolbar(title: "Success Payment")
        toolbar.delegate = self

        setupTable()
    }
    func setupAction(){
        backHome.addTarget(self, action: #selector(toBackHomeAction), for: .touchUpInside)
    }
    func setupData(){
        if let historyLoad = AppSetting.shared.loadHistoryPay() as? [ResultPayEntity] {
            print("get hisotry data \(historyLoad)")
            listPay = historyLoad
            self.mainTable.reloadData()
        }
    }

    //MARK: - Function Action HistoryView
    @objc func toBackHomeAction(){
        if let nav = self.navigationController {
            presenter?.goToHome(nav: nav)
        }
    }
}
extension HistoryView : UITableViewDelegate, UITableViewDataSource {
    func setupTable(){
        mainTable.register(UINib(nibName: "HistoryCell", bundle: nil), forCellReuseIdentifier: "HistoryCellIdentifier")
        mainTable.dataSource = self
        mainTable.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("hisotry data count \(listPay.count)")
        return listPay.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCellIdentifier", for: indexPath) as! HistoryCell
        cell.setView(data: listPay.safeGet(index: indexPath.row))
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
extension HistoryView : ToolbarViewDelegate {
    func pressBack() {
        if let nav = self.navigationController {
            presenter?.pushBackVC(nav: nav)
        }
    }
}
    //MARK: - Extension HistoryView

extension HistoryView: PTVHistoryProtocol {

}
