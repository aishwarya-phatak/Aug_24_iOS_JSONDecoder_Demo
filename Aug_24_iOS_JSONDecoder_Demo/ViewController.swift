//
//  ViewController.swift
//  Aug_24_iOS_JSONDecoder_Demo
//
//  Created by Vishal Jagtap on 05/11/24.
//

import UIKit

class ViewController: UIViewController {

    var products : [Product] = []
    var url : URL?
    var urlRequest : URLRequest?
    var urlSession : URLSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParsing()
        
    }
    
    func jsonParsing(){
        
        url = URL(string : "https://fakestoreapi.com/products")
        
        urlRequest = URLRequest(url: url!)
        urlSession = URLSession(configuration: .default)
        
        let dataTask = urlSession?.dataTask(with: urlRequest!, completionHandler: { data, response, error in
            
            self.products = try! JSONDecoder().decode([Product].self, from: data!)
            
            print(self.products)
        })
        dataTask?.resume()
    }
}
