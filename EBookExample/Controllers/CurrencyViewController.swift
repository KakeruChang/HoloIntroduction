//
//  CurrencyViewController.swift
//  EBookExample
//
//  Created by ChangTingWei on 2020/12/4.
//

import UIKit

class CurrencyViewController: UIViewController {
    
    var currencies = CurrencyInfo()
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var currency1FromLabel: UILabel!
    @IBOutlet weak var currency2FromLabel: UILabel!
    @IBOutlet weak var currency1ToLabel: UILabel!
    @IBOutlet weak var currency2ToLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        currencies.delegate = self
        
        currencies.getAllExchangeRate(base: "JPY")
    }
}

//MARK: - UIPickerViewDataSource

extension CurrencyViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencies.getCurrenciesNumber()
    }
}

//MARK: - UIPickerViewDelegate

extension CurrencyViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencies.currencyList[row].name
    }
   
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let currency1 = currencies.currencyList[pickerView.selectedRow(inComponent: 0)].name
        let currency2 = currencies.currencyList[pickerView.selectedRow(inComponent: 1)].name
        
        currencies.getExchangeRate(symbols: currency1, base: currency2)
        
    }
}

//MARK: - CurrencyInfoDelegate

extension CurrencyViewController: CurrencyInfoDelegate {
    func didUpdateCurrencies(currencyData: CurrencyData) {
        DispatchQueue.main.async { [self] in
            if currencyData.rates.count > 1 {
                var newList: [Currency] = []
                for (index,item) in currencyData.rates.sorted(by: { (a, b) -> Bool in
                    return a.key < b.key
                }).enumerated() {
                    if index == 0 {
                        let firstValue = "1 \(item.key)"
                        currency2FromLabel.text = firstValue
                        currency1FromLabel.text = firstValue
                        currency2ToLabel.text = firstValue
                        currency1ToLabel.text = firstValue
                    }
                    newList.append(Currency(name: item.key, exchangeRate: item.value))
                }
                currencies.renewCurrencyList(list: newList)
                currencyPicker.reloadAllComponents()
            } else {
                currency2FromLabel.text = "1 \(currencyData.base)"
                
                for item in currencyData.rates {
                    currency1FromLabel.text = "1 \(item.key)"
                    currency2ToLabel.text = "\(String(format: "%.3f", item.value)) \(item.key)"
                    currency1ToLabel.text = "\(String(format: "%.3f", 1/item.value)) \(currencyData.base)"
                }
            }
        }
    }
}
