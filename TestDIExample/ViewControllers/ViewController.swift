//
//  ViewController.swift
//  TestDIExample
//
//  Created by Bruce Chen on 2022/9/10.
//

import UIKit

class ViewController: UIViewController {

    let swinjectArray: [String] = ["1. 如何註冊？", "2. 註冊同樣類型如何區分？", "3. 帶參數注入", "4. 補充", "5. 依賴注入", "6. 範圍"]
    let resolverArray: [String] = ["1. 如何註冊？", "2. 註冊同樣類型如何區分？", "3. 帶參數注入", "4. 依賴注入"]
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return swinjectArray.count
        } else {
            return resolverArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Swinject"
        } else {
            return "Resolver"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        if indexPath.section == 0 {
            cell.textLabel?.text = swinjectArray[indexPath.row]
        } else {
            cell.textLabel?.text = resolverArray[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let story = UIStoryboard(name: "Main", bundle:nil)
        
        switch indexPath {
        case IndexPath(row: 0, section: 0):
            let vc = story.instantiateViewController(withIdentifier: "RegisterExampleVC") as! RegisterExampleVC
            self.navigationController?.pushViewController(vc, animated: false)
            break
        case IndexPath(row: 1, section: 0):
            let vc = story.instantiateViewController(withIdentifier: "MutiSameServiceVC") as! MutiSameServiceVC
            self.navigationController?.pushViewController(vc, animated: false)
            break
        case IndexPath(row: 2, section: 0):
            let vc = story.instantiateViewController(withIdentifier: "ParametersInjectionVC") as! ParametersInjectionVC
            self.navigationController?.pushViewController(vc, animated: false)
            break
        case IndexPath(row: 3, section: 0):
            let vc = story.instantiateViewController(withIdentifier: "RemarkVC") as! RemarkVC
            self.navigationController?.pushViewController(vc, animated: false)
            break
        case IndexPath(row: 4, section: 0):
            let vc = story.instantiateViewController(withIdentifier: "InjectionVC") as! InjectionVC
            self.navigationController?.pushViewController(vc, animated: false)
            break
        case IndexPath(row: 5, section: 0):
            let vc = story.instantiateViewController(withIdentifier: "ScopeVC") as! ScopeVC
            self.navigationController?.pushViewController(vc, animated: false)
            break
        case IndexPath(row: 0, section: 1):
            let vc = story.instantiateViewController(withIdentifier: "ResolverRegitsterExampleVC") as! ResolverRegitsterExampleVC
            self.navigationController?.pushViewController(vc, animated: false)
            break
        case IndexPath(row: 1, section: 1):
            let vc = story.instantiateViewController(withIdentifier: "ResolverMutiSameServiceVC") as! ResolverMutiSameServiceVC
            self.navigationController?.pushViewController(vc, animated: false)
            break
        case IndexPath(row: 2, section: 1):
            let vc = story.instantiateViewController(withIdentifier: "ResolverParameterInjectionVC") as! ResolverParameterInjectionVC
            self.navigationController?.pushViewController(vc, animated: false)
            break
        case IndexPath(row: 3, section: 1):
            let vc = story.instantiateViewController(withIdentifier: "ResolverInjectionVC") as! ResolverInjectionVC
            self.navigationController?.pushViewController(vc, animated: false)
            break
        default:
            break
        }
        
    }
    
}
