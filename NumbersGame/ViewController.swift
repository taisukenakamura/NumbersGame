//
//  ViewController.swift
//  NumbersGame
//
//  Created by 中村泰輔 on 2019/08/07.
//  Copyright © 2019 icannot.t.n. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //    入力した数字を表示するラベルの変数
    @IBOutlet weak var printScore: UILabel!
    //    入力する数字を受け取る変数
    @IBOutlet weak var textNumber: UITextField!
    //    結果を表示する変数
    @IBOutlet weak var resultMessage: UITextView!
    //    乱数を持つ変数を作成
    var randomNum = Int(arc4random_uniform(101))
    //    回数を数える変数
    var counts : Int = 0
    //    Messageの初期値を設定する
    var acceptedNum = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //    アラートを表示する、アラート関数
    func showAlert(title : String,message : String) {
        //        アラート表示の生成
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        //        アラートからの遷移先を生成
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        //        上記二つの定数を結合
        alert.addAction(close)
        //        アラートを起動させる
        present(alert, animated: true, completion: nil)
    }


}

