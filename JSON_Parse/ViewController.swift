//
//  ViewController.swift
//  JSON_Parse
//
//  Created by A1 on 28.01.18.
//  Copyright © 2018 A1. All rights reserved.
//

import UIKit


struct News: Decodable {
    //
    var resultCode: String
//    var trackingId: UInt
//    var payload: [String: String] = [:]
//    var id: UInt
//    var name: String
//    var publicationDate : [String: UInt]
//    var milliseconds: UInt
    var bankInfoTypeId: UInt
//    var text: String


    init?(json: [String: Any]) {

        guard let resultCode = json["resultCode"] as? String,
            let bankInfoTypeId = json["bankInfoTypeId"] as? UInt else {
//            let playload = json["playload"] as? [String: String] else {
                return nil
        }
        self.resultCode = resultCode
        self.bankInfoTypeId = bankInfoTypeId
//        self.payload = playload
    }

    /**
     "payload":[
     {
     "id":"10024",
     "name":"20122017-tinkoff-bank-x-mgu",
     "text":"Тинькофф Банк начинает сотрудничество с кафедрой математических и компьютерных методов анализа мехмата МГУ",
     "publicationDate":{
     "milliseconds":1513767691000
     },
     "bankInfoTypeId":2
     },
     ...
     {}
     ...
     ]
 */

}

struct Country: Decodable {
    
    let name: String
    let capital: String
    let population: UInt
    let topLevelDomain: [String]
    let translations: [String: String] = [:]
    
//    init?(json: [String: Any]) {
//
//        guard let name = json["name"] as? String,
//            let capital = json["capital"] as? String,
//            let population = json["population"] as? UInt else {
//                return nil
//        }
//        self.name = name
//        self.capital = capital
//        self.population = population
    
    /**
     ,
     {
     "name":"Angola",
     "topLevelDomain":[
     ".ao"
     ],
     "alpha2Code":"AO",
     "alpha3Code":"AGO",
     "callingCodes":[
     "244"
     ],
     "capital":"Luanda",
     "altSpellings":[
     "AO",
     "República de Angola",
     "ʁɛpublika de an'ɡɔla"
     ],
     "region":"Africa",
     "subregion":"Middle Africa",
     "population":24383301,
     "latlng":[
     -12.5,
     18.5
     ],
     "demonym":"Angolan",
     "area":1246700.0,
     "gini":58.6,
     "timezones":[
     "UTC+01:00"
     ],
     "borders":[
     "COG",
     "COD",
     "ZMB",
     "NAM"
     ],
     "nativeName":"Angola",
     "numericCode":"024",
     "currencies":[
     "AOA"
     ],
     "languages":[
     "pt"
     ],
     "translations":{
     "de":"Angola",
     "es":"Angola",
     "fr":"Angola",
     "ja":"アンゴラ",
     "it":"Angola"
     },
     "relevance":"0"
     },
     {
     "name":"Anguilla",
     "topLevelDomain":[
     ".ai"
     ],
     "alpha2Code":"AI",
     "alpha3Code":"AIA",
     "callingCodes":[
     "1264"
     ],
     "capital":"The Valley",
     "altSpellings":[
     "AI"
     ],
     "region":"Americas",
     "subregion":"Caribbean",
     "population":13452,
     "latlng":[
     18.25,
     -63.16666666
     ],
     "demonym":"Anguillian",
     "area":91.0,
     "gini":null,
     "timezones":[
     "UTC-04:00"
     ],
     "borders":[
     
     ],
     "nativeName":"Anguilla",
     "numericCode":"660",
     "currencies":[
     "XCD"
     ],
     "languages":[
     "en"
     ],
     "translations":{
     "de":"Anguilla",
     "es":"Anguilla",
     "fr":"Anguilla",
     "ja":"アンギラ",
     "it":"Anguilla"
     },
     "relevance":"0.5"
     },
 */
}

class ViewController: UIViewController {
    
    var news = [News]()
    var country = [Country]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//
//        let jsonUrl = "https://api.tinkoff.ru/v1/news"
//        let url = URL(string: jsonUrl)!
        
        let jsonCountryUrl = "https://restcountries.eu/rest/v2/all"
        let urlCountry = URL(string: jsonCountryUrl)!
        
        URLSession.shared.dataTask(with: urlCountry) { (data, response, error) in
            do {
                self.country = try JSONDecoder().decode([Country].self, from: data!)
                
                for names in self.country {
                    print(names.name + " Capital: " + names.capital + ", Population: \(names.population) peoples")
                    print("topLevelDomain: " + names.topLevelDomain.reduce("", {$1 + $0}))
                    var dict = (names.translations.flatMap({(key, value) -> String in
                        return "\(key)=\(value)"
                    }) as Array).joined(separator: ";")
                    print(dict.description)
                }
            }
            catch {
                print("Error self.country")
            }
        }.resume()
        
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            do {
//                self.news = try JSONDecoder().decode([News].self, from: data!)
//
//                for names in self.news {
//                    print(names.resultCode, names.bankInfoTypeId)
//                }
//            }
//            catch {
//                print("Error self.news")
//            }
//            }.resume()
    }
}

