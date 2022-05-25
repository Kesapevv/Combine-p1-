//
//  ViewController.swift
//  Combine (p1)
//
//  Created by Vadim Voronkov on 25.05.2022.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    private var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancellable = NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: textField)
            .map { $0.object as? UITextField }
            .compactMap { $0?.text }
            .map { str -> Bool in
                if let number = Double(str) {
                    return number > 10
                } else {
                    return false
                }
                
            }
            .assign(to: \.isEnabled, on: button)
    }


}

