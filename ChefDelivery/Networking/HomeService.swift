//
//  HomeService.swift
//  ChefDelivery
//
//  Created by Nor, Gustavo on 30/03/24.
//

import Foundation

struct HomeService {
    //Mark: - Methods
    
    func fetchData() {
        guard let url = URL(string: "https://private-1326188-chefdelivery10.apiary-mock.com/home") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let storeObjects = try? JSONDecoder().decode([StoreType].self, from: data)
                print(storeObjects)
            }
        }.resume()
        
    }
}
