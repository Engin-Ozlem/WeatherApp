//
//  WebService.swift
//  WeatherApp
//
//  Created by macbookair on 2.06.2023.
//

import Foundation

class WebService {
    func downloadData(url: URL, completion: @escaping ([WeatherData]?) -> ()) {
        let headers = [
            "content-type": "application/json",
            "authorization": "apikey 4XlSqhWGA3JpyLekZCbIpJ:6JEABHaI8bin1aAEsKK1Zi"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        do {
                            let decoder = JSONDecoder()
                            let weatherDataResponse = try decoder.decode(WeatherDataResponse.self, from: data)
                            let weatherList = weatherDataResponse.result
                            completion(weatherList)
                        } catch {
                            print("JSON parsing error: \(error)")
                            completion(nil)
                        }
                    } else {
                        print("API response error: \(httpResponse.statusCode)")
                        completion(nil)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
}

    
    
    
    
    
    
    

