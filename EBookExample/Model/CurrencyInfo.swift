//
//  CurrencyInfo.swift
//  EBookExample
//
//  Created by ChangTingWei on 2020/12/5.
//

import Foundation

struct Currency {
    var name: String
    var exchangeRate: Float
}

struct CurrencyData: Codable {
    let base: String
    let rates: [ String: Float ]
}

protocol CurrencyInfoDelegate {
    func didUpdateCurrencies(currencyData: CurrencyData)
}

struct CurrencyInfo {
    let exchangeURL = "https://api.exchangeratesapi.io/latest"
    var currencyList: [Currency] = []
    
    var delegate: CurrencyInfoDelegate?
    
    mutating func renewCurrencyList(list: Array<Currency>){
        currencyList = list
    }
    
    func getCurrenciesNumber() -> Int {
        return currencyList.count
    }
    
    func getCurrencyExchangeRate(for currency: String) -> Float {
        for item in currencyList {
            if item.name == currency {
                return item.exchangeRate
            }
        }
        return 1
    }
    
    func performAPIRequest(urlString: String) {
        // 1. create a URL
        if let url = URL(string: urlString) {
            // 2. create a URLSession
            let session = URLSession(configuration: .default)
            
            // 3. give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print(error)
                    return
                }
                
                if let data = data, let safeData = parseJSON(currencyData: data) {
                    delegate?.didUpdateCurrencies(currencyData: safeData)
                    
                }
            }
 
            // 4. start the task
            task.resume()
            
        }
    }
    
    func getExchangeRate(symbols: String, base: String) {
        let urlString = "\(exchangeURL)?symbols=\(symbols)&base=\(base)"
        performAPIRequest(urlString: urlString)
    }
    
    func getAllExchangeRate(base: String) {
        let urlString = "\(exchangeURL)?base=\(base)"
        performAPIRequest(urlString: urlString)
    }
    
    func parseJSON(currencyData: Data) -> CurrencyData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CurrencyData.self, from: currencyData)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
}
