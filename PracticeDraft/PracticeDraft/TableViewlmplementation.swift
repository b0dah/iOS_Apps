// TB Methods

import UIKit

extension MainScreenController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ItemCell
            else {
                return UITableViewCell()
        }
        
        cell.setData(currentItem: searchedItems[indexPath.row])
        
        return cell
    }
    
    // cell appearence
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
    // Titile with the date
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let date = items[indexPath.row].beginDate.prefix(10)
        self.title = String(date.replacingOccurrences(of: "-", with: "."))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if searchedItems[indexPath.row].kind == 2 {
            return 80 // kind = 2
        }
        else if searchedItems[indexPath.row].participant[0].name == nil {
            return 100 // kind = 1 && !participant
        }
        else {
            return 170 // kind = 1 && participant
        }
        //return UITableView.automaticDimension
    }
}
