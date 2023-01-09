//
//  APICaller.swift
//  NetflixClone
//
//  Created by Casper Tyson on 7/01/23.
//

import Foundation

struct Constants {
    static let API_KEY = "a25d9650b583a47c23615e224961212c"
    static let baseURL = "https://api.themoviedb.org"
}


class APICaller{
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (String) -> Void){
        guard let url  = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                print(results)
            }catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
