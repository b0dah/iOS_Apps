// Search bar stuff for main view controller

import UIKit

extension MainScreenController: UISearchBarDelegate {
    
    func setUpSearchBar(){
        searchController.searchBar.delegate = self
        searchController.searchBar.tintColor = .orange
        
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray]
            
    }
    
    // MARK: - Search Functionality
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty  else {
            searchedItems = items
            tableView.reloadData()
            return
        }
        searchedItems = items.filter({item -> Bool in
            return item.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
}
