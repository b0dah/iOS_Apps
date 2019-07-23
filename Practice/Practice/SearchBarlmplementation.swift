// Search bar stuff for main view controller

import UIKit

extension MainScreenController: UISearchBarDelegate {
    
    func setUpSearchBar(){
        searchController.searchBar.delegate = self
        
        // MARK: - Search Bar Appearence
        searchController.searchBar.tintColor = .orange
        searchController.searchBar.placeholder = "Поиск"
        
        var textFieldInsideSearchBar = searchController.searchBar.value(forKey: "_searchField") as? UITextField
        textFieldInsideSearchBar?.backgroundColor = UIColor(red: 133/255, green: 33/255, blue: 33/255, alpha: 0.72)
        
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
