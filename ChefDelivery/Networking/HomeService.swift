//
//  HomeService.swift
//  ChefDelivery
//
//  Created by Nor, Gustavo on 30/03/24.
//

import Foundation

enum RequestError: Error {
    case invalidURL
    case errorRequest(error: String)
}

struct HomeService {
    //Mark: - Methods
    
    func fetchData() async throws -> Result<[StoreType], RequestError> {
        guard let url = URL(string: "https://private-1326188-chefdelivery10.apiary-mock.com/home") else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        let storesObject = try JSONDecoder().decode([StoreType].self, from: data)
        
        return .success(storesObject)
    }
}


//        URLSession.shared.dataTask(with: url) { data, _, error in
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let data = data {
//                let storeObjects = try? JSONDecoder().decode([StoreType].self, from: data)
//                print(storeObjects)
//            }
//        }.resume()
