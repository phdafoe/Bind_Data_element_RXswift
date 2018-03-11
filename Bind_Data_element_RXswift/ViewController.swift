//
//  ViewController.swift
//  Bind_Data_element_RXswift
//
//  Created by Andres Felipe Ocampo Eljaiesk on 10/3/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    
    //Variables
    let disposeBag = DisposeBag()
    let textFieldData = Variable("")
    let buttonTapped = PublishSubject<String>()
    
    
    //IBOutets
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet var myTapGR: UITapGestureRecognizer!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        myTapGR.rx.event.bind{ [weak self] _ in
            self?.view.endEditing(true)
            }.disposed(by: disposeBag)
        
        myButton.rx.tap.map{
            "Tapped!"
        }.bind(to: buttonTapped).disposed(by: disposeBag)
        
        buttonTapped.subscribe{
            print($0)
        }.disposed(by: disposeBag)
        
        myTextField.rx.text.orEmpty.bind(to: textFieldData).disposed(by: disposeBag)
        
        textFieldData.asObservable().subscribe{
            print($0)
        }.disposed(by: disposeBag)
    }

    


}

