//
//  CountryCodePickerViewController.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 24.02.2024.
//

import UIKit

protocol CountryCodePickerDelegate: AnyObject {
    func countryCodePicker(didSelectCountry country: Country)
}

struct Country {
    var flag: UIImage
    var code: String
}

class CountryCodePickerViewController: UITableViewController {
    
    weak var delegate: CountryCodePickerDelegate?
    var countries: [Country] = [Country(flag: UIImage(named: "KG")!, code: "+996"), Country(flag: UIImage(named: "KZ")!, code: "+7"),Country(flag: UIImage(named: "RU")!, code: "+7")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CountryCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        let country = countries[indexPath.row]
        cell.textLabel?.text = country.code
        cell.imageView?.image = country.flag
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = countries[indexPath.row]
        delegate?.countryCodePicker(didSelectCountry: selectedCountry)
        dismiss(animated: true, completion: nil)
    }
}
