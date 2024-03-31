//
//  HomeService.swift
//  ChefDelivery
//
//  Created by Nor, Gustavo on 30/03/24.
//

import Foundation
import Alamofire

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
    
    func confirmOrder(product: ProductType) async throws -> Result<[String: Any]?, RequestError> {
        guard let url = URL(string: "https://private-1326188-chefdelivery10.apiary-mock.com/home") else {
            return .failure(.invalidURL)
        }
        
        let encodedObject = try JSONEncoder().encode(product)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = encodedObject
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let message = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        
        return .success(message)
    }
    
    func fetchDataWithAlamofire(completion: @escaping([StoreType]?, Error?) -> Void) {
        AF.request("https://private-1326188-chefdelivery10.apiary-mock.com/home").responseDecodable(of: [StoreType].self) { response in
            switch response.result {
            case .success(let stores):
                completion(stores, nil)
            default: break
            }
        }
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
