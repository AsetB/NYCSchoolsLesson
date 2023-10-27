//
//  SchoolDirectoryAPI.swift
//  NYC Schools
//
//  Created by Aset Bakirov on 26.10.2023.
//

import Foundation

protocol SchoolAPILogic {
  func getSchools()
}

class SchoolAPI: SchoolAPILogic {
  private struct Constants {
    static let schoolListURL = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json?$$app_token=Hha4lo9QzN0k78YnEsM7s6r1I"
  }
  func getSchools() {
    //todo
    //print(Constants.schoolListURL)
    //print("implement getSchools")
    retrieveSchoolsUsingStandardServices()
  }
  private func retrieveSchoolsUsingStandardServices() {
    var urlComponents = URLComponents()
    urlComponents.scheme = "https"
    urlComponents.host = "data.cityofnewyork.us"
    urlComponents.path = "/resource/s3k6-pzi2.json"
    urlComponents.queryItems = [URLQueryItem(name: "$$app_token",
                                                value: "Hha4lo9QzN0k78YnEsM7s6r1I")]
    //another way to get url
    //URL(string: schoolListURL)
    
    if let url = urlComponents.url {
      let urlSession = URLSession(configuration: .default)
      
      let task = urlSession.dataTask(with: url) { data, response, error in
        guard error == nil else {
          print("error occured \(error?.localizedDescription)")
          return
        }
        
        if let data = data {
          let decoder = JSONDecoder()
          do {
            let schools = try decoder.decode([School].self,
                                               from: data)
            print("Schools \(schools)")
          } catch let error {
            print("error during parsing \(error)")
          }
          
        }
      }
      task.resume()
    }
  }
  
}
