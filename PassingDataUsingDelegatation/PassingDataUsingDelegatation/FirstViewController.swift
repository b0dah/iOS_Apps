//
//  FirstViewController.swift
//  PassingDataUsingDelegatation
//
//  Created by Иван Романов on 02.05.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

import UIKit

/*
1. Создаем протокол с методом передачи данных
2. Реализуем проктоол первым Контроллером
3. Во втором Контроллере создаем свойство delegate типа Протокола
4. В сегвее передаем текущий Контроллер как значение свойства delegate
5. По нажатию на кнопку закрываем Второй Контроллер (текущий) и вызываем метод делегата на передачу(в данном случае отображение) данных.
 */

class FirstViewController: UIViewController, /* STEP #1 -> */ DataSendingDelegateProtocol {
    @IBOutlet weak var receivedDataLabel: UILabel!
    @IBAction func getDataButtonClicked(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func sendData(data: String) {
        receivedDataLabel.text = data
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "GetDataSegue" else {
            return
        }
        
        if let secondViewController = segue.destination as? SecondViewController {
            secondViewController.delegate = self /* STEP #2 */
        }
    }
    
}
