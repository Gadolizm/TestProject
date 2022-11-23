//
//  ViewController.swift
//  TestProject
//
//  Created by Gado on 23/11/2022.
//

import UIKit
//
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.github.com"
        components.path = "/users/johnsundell"

        guard let url = components.url else {
            preconditionFailure("Failed to construct URL")
        }

        let label = UILabel()

        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in

            DispatchQueue.main.async {
                if let data = data {
                    label.text = String(decoding: data, as: UTF8.self)
                } else {
                    label.text = error?.localizedDescription
                }
            }
        }

        task.resume()
    }


}

