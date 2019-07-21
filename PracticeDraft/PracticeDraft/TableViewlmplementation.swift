// TB Methods

import UIKit

extension MainScreenController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return items.count
        return searchedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ItemCell
            else {
                return UITableViewCell()
        }
        
        // time
        let beginTime = searchedItems[indexPath.row].beginDate.suffix(8)
        let endTime = searchedItems[indexPath.row].endDate.suffix(8)
        cell.timeLabel.text = beginTime.prefix(5) + "-" + endTime.prefix(5)
        
        //location
        cell.venueLabel.text = searchedItems[indexPath.row].venue
        
        // Mandatory
        cell.nameLabel.text = searchedItems[indexPath.row].name
        cell.descriprionLabel.text = searchedItems[indexPath.row].description
        
        // icon
        if let imageId = searchedItems[indexPath.row].imageId {
            cell.iconView.image = UIImage(named: String(imageId) )
            cell.iconView.isHidden = false /**/
        }
        else {
            cell.iconView.isHidden = true
        }
        
        // kind 2
        if searchedItems[indexPath.row].kind == 2 {
            cell.descriprionLabel.isHidden = true
        }
        else {
            cell.descriprionLabel.isHidden = false /**/
        }
        
        // participant section
        if searchedItems[indexPath.row].participant[0].name == nil {  // if no participant
            cell.participantStackView.isHidden = true
        }
        else {
            cell.participantStackView.isHidden = false /**/
            
            if let imageId = searchedItems[indexPath.row].participant[0].imageId { // avatar
                cell.avatarView.image = UIImage(named: String(imageId) )
            }
            else {
                cell.avatarView.isHidden = true
            }
            
            cell.participantNameLabel.text = searchedItems[indexPath.row].participant[0].surname! + " " + searchedItems[indexPath.row].participant[0].name!.prefix(1) + ". " + searchedItems[indexPath.row].participant[0].patronyc!.prefix(1) + "."
            cell.participantPositionLabel.text = searchedItems[indexPath.row].participant[0].position
            cell.participantCompanyLabel.text = searchedItems[indexPath.row].participant[0].company
        }
        
        return cell
    }
    
    //APPEARENCE
    
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
