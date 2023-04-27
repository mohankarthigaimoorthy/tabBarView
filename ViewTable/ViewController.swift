//
//  ViewController.swift
//  ViewTable
//
//  Created by Mohan K on 30/11/22.
//

import UIKit

struct Section {
    let title: String
    let options : [SettingsOption]
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgrounColor: UIColor
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    private let customtable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(oneTableViewCell.self, forCellReuseIdentifier: oneTableViewCell.identifier)
        return table
    }()
    
    
    
    
    var  models = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Settings"
    view.addSubview(customtable)
        customtable.delegate = self
        customtable.dataSource = self
        customtable.frame = view.bounds
        //        customtable.style = table.grouped
        
        
    }
    
    
    func configure() {
        //        self. models = Array(0...15).compactMap ({
        //        SettingsOption(title: "Item \($0)", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
        //
        //        }
        models.append (Section (title: "general", options: [
            SettingsOption(title: "wifi", icon: UIImage(systemName: "house"), iconBackgrounColor: .systemPink),
            SettingsOption(title: "bluetooth", icon: UIImage(systemName: "house"), iconBackgrounColor: .systemPink),
            SettingsOption(title: "aeroplanemood", icon: UIImage(systemName: "house"), iconBackgrounColor: .systemPink),
            SettingsOption(title: "internet", icon: UIImage(systemName: "house"), iconBackgrounColor: .systemPink)
        ])
        )
        
        models.append (Section (title: "Accesibility", options: [
            SettingsOption(title: "Motion", icon: UIImage(systemName: "house"), iconBackgrounColor: .systemPink),
            SettingsOption(title: "Touch", icon: UIImage(systemName: "house"), iconBackgrounColor: .systemPink),
            SettingsOption(title: "Keyboard", icon: UIImage(systemName: "house"), iconBackgrounColor: .systemPink),
            SettingsOption(title: "Face id", icon: UIImage(systemName: "house"), iconBackgrounColor: .systemPink)
        ])
        )
//
//    }
//})
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    func numberOfSections(in tableView: UITableView) -> Int {

        return models.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
//        let models = section[indexPath.model].options[indexPath.row]
        guard let cell = customtable.dequeueReusableCell(withIdentifier: oneTableViewCell.identifier, for: indexPath ) as? oneTableViewCell
        else {
            return UITableViewCell()
        }
        
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        customtable.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].options[indexPath.row].title
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return.delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
//            customtable.beginUpdates()
            models.remove(at: indexPath.row)
            
            customtable.deleteRows(at: [indexPath], with: .fade)
//            customtable.endUpdates()
            customtable.reloadData()
        }
        
    }
    
}

