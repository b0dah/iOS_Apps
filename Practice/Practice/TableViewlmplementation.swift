// TB Methods

import UIKit

extension MainScreenController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedItems.count
    }
    
    // MARK : - Setting Data to Custom Cell
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
    
    // Title with the date
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let date = items[indexPath.row].beginDate.prefix(10)
        self.title = String(date.replacingOccurrences(of: "-", with: "."))
    }
    
}
