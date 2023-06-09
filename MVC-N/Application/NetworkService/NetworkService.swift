//
//  NetworkService.swift
//  MVC-N
//
//  Created by Evgenii Kutasov on 08.06.2023.
//

import Foundation

class NetworkService {
    static let shared = NetworkService() // singlton
    
    private init() {}
    
    public func getData(url: URL, completion: @escaping(Any) -> ()) { // получаем какую то строку
        let session = URLSession.shared
        
        session.dataTask(with: url) { data, responce, error in // данные в этой строке которые передадим
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                DispatchQueue.main.async {
                    completion(json)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
