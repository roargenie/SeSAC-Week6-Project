


import UIKit

import Alamofire
import SwiftyJSON

/*
 1. html tag <> </> 기능 활용
 2. 문자열 대체 메서드
 */

/*
 TableView automaticDimension
 - 컨텐츠의 양에 따라서 셀 높이가 자유롭게
 - 조건1: 레이블 numberOfLines 0
 - 조건2: tableView height automaticDimension
 - 조건3: 레이아웃
 */

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var isExpanded = false
    
    var blogList: [String] = []
    var cafeList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        searchBlog()
    }
    
    func searchBlog() {
        APIManager.shared.callRequest(type: .blog, query: "고래밥") { data in
            
            //print(data)
            
            for item in data["documents"].arrayValue {
                
                let value = item["contents"].stringValue.replacingOccurrences(of: "<b>", with: "").replacingOccurrences(of: "</b>", with: "")
                
                self.blogList.append(value)
                
            }
            
            self.searchCafe()
            print(self.blogList)
            
        }
        
    }
    
    func searchCafe() {
        APIManager.shared.callRequest(type: .cafe, query: "팥빙수") { data in
            
            for item in data["documents"].arrayValue {
                
                let value = item["contents"].stringValue.replacingOccurrences(of: "<b>", with: "").replacingOccurrences(of: "</b>", with: "")
                
                
                self.cafeList.append(value)
                
            }
            print(self.cafeList)
            self.tableView.reloadData()
        }
        
    }
    
    @IBAction func expandCell(_ sender: UIBarButtonItem) {
        isExpanded = !isExpanded
        tableView.reloadData()
        
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return section == 0 ? blogList.count : cafeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "KakaoCell", for: indexPath) as? KakaoCell else { return UITableViewCell() }
        cell.testLabel.numberOfLines = isExpanded ? 0 : 2
        cell.testLabel.text = indexPath.section == 0 ? blogList[indexPath.row] : cafeList[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "블로그 검색결과" : "카페 검색결과"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

class KakaoCell: UITableViewCell {
    
    @IBOutlet weak var testLabel: UILabel!
    
    
}

