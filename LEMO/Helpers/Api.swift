//
//  Api.swift
//  LEMO
//
//  Created by Admin on 23.09.2023.
//

import Foundation
import CoreData

class Api {
    static let shared = Api()
    
    func getMenuData(_ coreDataContext:NSManagedObjectContext) async {
        PersistenceController.shared.clear()
        
        let urlString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        let urlSession = URLSession.shared
        let decoder = JSONDecoder()
        
        do {
            let (data, _) = try await urlSession.data(from: url)
            let menuList = try decoder.decode(MenuList.self, from: data)
            for menuItem in menuList.menu {
                let dish = Dish(context: coreDataContext)
                dish.title = menuItem.title
                dish.price = menuItem.price
                dish.image = menuItem.image
                dish.dishDescription = menuItem.description
            }
            try? coreDataContext.save()
        }
        
        catch { }
    }
}
