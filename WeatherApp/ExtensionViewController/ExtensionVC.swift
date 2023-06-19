//
//  ExtensionVC.swift
//  WeatherApp
//
//  Created by macbookair on 2.06.2023.
//

import Foundation
import UIKit
import Kingfisher

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListViewModel == nil ? 0 : self.weatherListViewModel.numberOfRowsInSection()
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        let weatherViewModel = weatherListViewModel.weatherAtIndex(indexPath.row)
        cell.dayLabelCell.text = weatherViewModel.day
        cell.degreLabelCell.text = "\(weatherViewModel.fahrein)°C"
        
        
        if let imageUrl = URL(string: weatherViewModel.icon) {
            cell.imageİconCell.kf.setImage(with: imageUrl)
        }
        
        
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
                return 120
            } else {
                return 120
            }
    }
    
    func getData(cityname : String) {
        
        let encodedCityName = cityname.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=\(encodedCityName)"

        
        
        
        if let url = URL(string: urlString) {
            let webService = WebService()
            
            
            
            
            webService.downloadData(url: url) { weatherList in
                if let weatherList = weatherList {
                    
                    self.weatherListViewModel = WeatherListViewModel(weatherList: weatherList)
                    
                    
                    for weather in weatherList {
                        DispatchQueue.main.async {
                            self.dayLabel.text = weather.day
                            self.dateLabel.text = weather.date
                            self.fahreinLabel.text = "\(weather.degree)°C"
                            self.descriptionLabel.text = weather.description
                            self.imageView.image = UIImage(named: weather.icon)
                            
                            
                            if let iconURL = URL(string: weather.icon) {
                                    URLSession.shared.dataTask(with: iconURL) { (data, response, error) in
                                        if let data = data, let image = UIImage(data: data) {
                                                DispatchQueue.main.async {
                                                    self.imageView.image = image
                                                }
                                        }
                                 }.resume()
                            }
                            
                            self.tableView.reloadData()
                            
                    }
                        
                }
            } else {
                    print("Veriler indirilemedi.")
                }
            }
        }

    }
    
    
}
