//
//  ViewController.swift
//  NumbersGame
//
//  Created by 中村泰輔 on 2019/08/07.
//  Copyright © 2019 icannot.t.n. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //入力した数字を表示するラベルの変数
    @IBOutlet weak var printScore: UILabel!
    //入力する数字を受け取る変数
    @IBOutlet weak var textNumber: UITextField!
    //結果を表示する変数
    @IBOutlet weak var resultMessage: UITextView!
    //乱数を持つ変数を作成
    var randomNum = Int(arc4random_uniform(101))
    //回数を数える変数
    var counts : Int = 0
    //Messageの初期値を設定する
    var acceptedNum = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //TextViewを編集させない
        //resultMessage.isEditable = false
        print(randomNum)
    }
    
    
    @IBAction func tappedButton(_ sender: Any) {
        //数値のみだけを処理させて、他のnilやString型を処理させないようにする
        guard let acceptedNum = Int(textNumber.text!) else {
        //数字以外の値が来た時にエラーアラートを表示
            showAlert(title: "エラー",message: "1~100以内の数値を入力してください")

            return
            
        }
        
        //let acceptedNum = Int(textNumber.text!)!ß ←ゴミコードの残骸
        if 0 < acceptedNum && acceptedNum <= 100{
            //入力数値　＞　正解数値
            if acceptedNum > randomNum{
                //現在の回数に　＋１
                counts += 1
                //入力数値をラベルに表示
                printScore.text = "\(acceptedNum)"
                //不正解アラート
                showAlert(title: "不正解",message: "答えは\(acceptedNum)より低い値です")
                //履歴更新
                resultMessage.text += "[\(counts)回目]答えは\(acceptedNum)より低い値です。\n"
                //入力数値　＜　正解数値
            }else if acceptedNum < randomNum {
                //現在の回数に　＋１
                counts += 1
                //入力した数値をラベルに表示
                printScore.text = "\(acceptedNum)"
                //不正解アラート
                showAlert(title: "不正解",message: "答えは\(acceptedNum)より高い値です")
                //履歴更新
                resultMessage.text += "[\(counts)回目]答えは\(acceptedNum)より高い値です。\n"
                //正解した場合
            }else{
                //現在の回数に　＋１
                counts += 1
                //正解アラート
                showAlert(title: "正解",message: "[\(counts)回目]で正解しました。\n 数字をリセットします")
                //履歴更新
                resultMessage.text +=  "[\(counts)回目]答えは\(acceptedNum)です \n"
                //正解したため、答えの値を更新
                resetRandomNum()
                //回数を振り出しに戻す
                counts = 0
                
            }
            // 1~100以外の数字を入力した場合
        }else{
            showAlert(title: "エラー",message: "1~100以内の数値を入力してください")
        }
        
                textNumber.text = ""
        
    }
    
    //アラートを表示する、アラート関数
    func showAlert(title : String,message : String) {
        //アラート表示の生成
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        //アラートからの遷移先を生成
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        //上記二つの定数を結合
        alert.addAction(close)
        //アラートを起動させる
        present(alert, animated: true, completion: nil)
    }
    
    //正解を更新する関数
    func resetRandomNum(){
        randomNum = Int(arc4random_uniform(101))
    }
    
    
}

