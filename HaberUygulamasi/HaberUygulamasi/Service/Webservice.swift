//
//  Webservice.swift
//  HaberUygulamasi
//
//  Created by Samet on 23.10.2024.
//

import Foundation

class Webservice{
    func haberleriindir(url : URL , completion : @escaping ([News]?) -> () ){
         
        URLSession.shared.dataTask(with: url) {(data, responsible, error) in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
            
            }else if let data = data {
                
                let haberlerDizisi = try? JSONDecoder().decode([News].self, from: data)
                
                if let haberlerDizisi = haberlerDizisi{
                    completion(haberlerDizisi)
                }
                
                
            }
        }.resume()
    }
        
        
    
}
