//
//  ViewController.swift
//  composerQuiz
//
//  Created by Min Hu on 2023/9/15.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var excerciseQuestionLabel: UILabel!
    
    @IBOutlet weak var excerciseAnswerLabel: UILabel!
    
    @IBOutlet weak var excerciseSegmentedControl: UISegmentedControl!
    
    @IBOutlet var quizView: UIView!
    @IBOutlet weak var quizQuestionLabel: UILabel!
    @IBOutlet weak var quizAnswerTextField: UITextField!
    @IBOutlet weak var quizAnswerLabel: UILabel!
    
    @IBOutlet weak var quizRightOrWrong: UILabel!
    @IBOutlet weak var quizCountingLabel: UILabel!
    @IBOutlet weak var quizScoreLabel: UILabel!
    @IBOutlet weak var quizSegmentedControl: UISegmentedControl!
    
    var score = 0
    var index = 0
    var composerArray: [Composers] = [
        Composers(name: "Beethoven", country: "German"),
            Composers(name: "Mozart", country: "Austrian"),
            Composers(name: "Bach", country: "German"),
            Composers(name: "Tchaikovsky", country: "Russian"),
            Composers(name: "Chopin", country: "Polish"),
            Composers(name: "Handel", country: "German"),
            Composers(name: "Verdi", country: "Italian"),
            Composers(name: "Haydn", country: "Austrian"),
            Composers(name: "Wagner", country: "German"),
            Composers(name: "Schubert", country: "Austrian"),
            Composers(name: "Vivaldi", country: "Italian"),
            Composers(name: "Dvorak", country: "Czech"),
            Composers(name: "Brahms", country: "German"),
            Composers(name: "Mendelssohn", country: "German"),
            Composers(name: "Rachmaninoff", country: "Russian"),
            Composers(name: "Stravinsky", country: "Russian"),
            Composers(name: "Liszt", country: "Hungarian"),
            Composers(name: "Grieg", country: "Norwegian"),
            Composers(name: "Debussy", country: "French"),
            Composers(name: "Sibelius", country: "Finnish"),
            Composers(name: "Puccini", country: "Italian"),
            Composers(name: "Saint-Saëns", country: "French"),
            Composers(name: "Mussorgsky", country: "Russian"),
            Composers(name: "Borodin", country: "Russian"),
            Composers(name: "Ravel", country: "French"),
            Composers(name: "Gershwin", country: "American"),
            Composers(name: "Prokofiev", country: "Russian"),
            Composers(name: "Shostakovich", country: "Russian"),
            Composers(name: "Gounod", country: "French"),
            Composers(name: "Glinka", country: "Russian"),
            Composers(name: "Smetana", country: "Czech"),
            Composers(name: "Villa-Lobos", country: "Brazilian"),
            Composers(name: "Elgar", country: "English"),
            Composers(name: "Bartók", country: "Hungarian"),
            Composers(name: "Bizet", country: "French"),
            Composers(name: "Copland", country: "American"),
            Composers(name: "Barber", country: "American"),
            Composers(name: "Delius", country: "English"),
            Composers(name: "Mahler", country: "Austrian"),
            Composers(name: "Chaminade", country: "French"),
            Composers(name: "Glazunov", country: "Russian"),
            Composers(name: "Satie", country: "French"),
            Composers(name: "Pergolesi", country: "Italian"),
            Composers(name: "Röntgen", country: "Dutch"),
            Composers(name: "Gluck", country: "German"),
            Composers(name: "Lully", country: "Italian"),
            Composers(name: "De Falla", country: "Spanish"),
            Composers(name: "Mompou", country: "Spanish"),
            Composers(name: "Tallis", country: "English"),
            Composers(name: "Widor", country: "French"),
            Composers(name: "Dukas", country: "French"),
            Composers(name: "Hindemith", country: "German"),
            Composers(name: "Poulenc", country: "French"),
            Composers(name: "Tailleferre", country: "French"),
            Composers(name: "Turina", country: "Spanish"),
            Composers(name: "Schumann", country: "German"),
            Composers(name: "Hummel", country: "German"),
            Composers(name: "Albéniz", country: "Spanish"),
            Composers(name: "Cilea", country: "Italian"),
            Composers(name: "Leoncavallo", country: "Italian"),
            Composers(name: "Rimsky-Korsakov", country: "Russian"),
            Composers(name: "Sousa", country: "American"),
            Composers(name: "Massenet", country: "French"),
            Composers(name: "Ponchielli", country: "Italian"),
            Composers(name: "Chausson", country: "French"),
            Composers(name: "Berwald", country: "Swedish"),
            Composers(name: "Vaughan Williams", country: "English"),
            Composers(name: "Albéniz", country: "Spanish"),
            Composers(name: "Buxtehude", country: "German"),
            Composers(name: "Glazunov", country: "Russian"),
            Composers(name: "Grieg", country: "Norwegian"),
            Composers(name: "Liszt", country: "Hungarian"),
            Composers(name: "Sibelius", country: "Finnish"),
            Composers(name: "Puccini", country: "Italian"),
            Composers(name: "Sullivan", country: "English")
    ]
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizView.isHidden = true
        quizSegmentedControl.selectedSegmentIndex = 0
        excerciseSegmentedControl.selectedSegmentIndex = 0
        excerciseAnswerLabel.text = ""
        composerArray.shuffle()
        excerciseQuestionLabel.text = composerArray[index].name
        
    }
 
    @IBAction func segmentedControlMirror(_ sender: UISegmentedControl) {
        
        // 如果題數還沒到 10，或題數為 10 但答案Label 的文字為空
        if index < 9 || (index == 9 && quizAnswerLabel.text == "") {

            // 在程式碼中使用這個自定義的UIAlertController子類別
            let alertGoToExcerciseView = MyAlertController(title: "返回練習測驗，結果將歸0", message: "確定要回練習嗎？", preferredStyle: .alert) { (isConfirmed) in
                // 這裡定義了一個閉包，該閉包將在用戶選擇了確定或取消時執行

                // 如果按確定
                if isConfirmed {
                    // 呼叫 self 的 viewDidLoad 方法
                    self.viewDidLoad()
                } else {
                    // 將 quizSegmentedControl 的選擇索引設為 1
                    self.quizSegmentedControl.selectedSegmentIndex = 1
                }
            }

            // 顯示提示框
            self.present(alertGoToExcerciseView, animated: true)

        // 如果題數已到10
        } else {
            // 呼叫 self 的 viewDidLoad 方法
            viewDidLoad()
        }

    }
    
    @IBAction func quizShowAnswer(_ sender: UIButton) {
        // 顯示答案
        quizAnswerLabel.text = composerArray[index].country
        // 如果答對
        if quizAnswerTextField.text == composerArray[index].country{
            quizRightOrWrong.text = "答對了！真厲害！"
            // 加 10 分
            score += 10
            quizScoreLabel.text = "\(score) / 100 分"
        }else{ // 如果答錯
            quizRightOrWrong.text = "再接再厲！"
        }
    }
    fileprivate func quizDoReset() {
        // 初始所有設定，並亂數後顯示第一題
        index = 0
        score = 0
        quizRightOrWrong.text = ""
        quizAnswerLabel.text = ""
        quizAnswerTextField.text = ""
        quizScoreLabel.text = "\(score) / 100 分"
        quizCountingLabel.text = "第 \(index + 1) / 10 題"
        composerArray.shuffle()
        quizQuestionLabel.text = composerArray[index].name
    }
    
    @IBAction func quizShowNextQuestion(_ sender: UIButton) {
        // 先檢查有沒有看過答案，如果答案 Label 不是空的，則
        if quizAnswerLabel.text != ""{
            // 檢查題數是否還沒 10 題，如果還沒10題則
            if index < (10 - 1){
                // 題數＋1
                index += 1
                quizCountingLabel.text = "第 \(index + 1) / 10 題"
                quizQuestionLabel.text = composerArray[index].name
                // 清空 答案、評語、作答三欄
                quizAnswerLabel.text = ""
                quizRightOrWrong.text = ""
                quizAnswerTextField.text = ""
            }else{ // 若已作答 10 題
                // 宣告提示彈窗，標題為測驗結束，底下文字顯示得分
                let alertFinished = UIAlertController(title: "測驗結束", message: "\(score) 分", preferredStyle: .alert)
                // 設定彈窗中確定鍵的樣式
                let okAction = UIAlertAction(title: "確定", style: .cancel, handler: nil)
                // 將確定鍵加入彈窗
                alertFinished.addAction(okAction)
                        // 通過 self.present 顯示 alertFinished
                self.present(alertFinished, animated: true)
                quizDoReset()
            }
            
        }else{ // 如果還沒點過答案鍵
            // 跳提示請先看答案
            let alertClickShowAnswer = UIAlertController(title: "請先看答案", message: nil, preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "確定", style: .cancel, handler: nil)
            alertClickShowAnswer.addAction(okAction)
                    // 通過 self.present 顯示 alertClickShowAnswer，顯示購買完成的提示
                    self.present(alertClickShowAnswer, animated: true)
        }
    }
    @IBAction func quizReset(_ sender: UIButton) {
        quizDoReset()
    }
    
    
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        // 顯示 quizView
        quizView.isHidden = false
        // quizView 的 Segmented Control 顯示到"測驗"
        quizSegmentedControl.selectedSegmentIndex = 1
        // 答案 Label 的內容清空
        quizAnswerLabel.text = ""
        // 作答 Text Field 的內容清空
        quizAnswerTextField.text = ""
        // 清空評語 Label
        quizRightOrWrong.text = ""
        // Array 排序洗牌
        composerArray.shuffle()
        // 數字都歸 0
        index = 0
        score = 0
        // 顯示第一題問題
        quizQuestionLabel.text = composerArray[index].name
        // 題目數顯示 1/10
        quizCountingLabel.text = "第 \(index+1) / 10 題"
        // 分數顯示 0/100
        quizScoreLabel.text = " \(score) / 100 分"
    }
    
    @IBAction func excerciseShowAnswer(_ sender: UIButton) {
        // 顯示答案
        excerciseAnswerLabel.text = composerArray[index].country
        
    }
    
    @IBAction func excerciseShowNextQuestion(_ sender: UIButton) {
            // 清空答案 Label
            excerciseAnswerLabel.text = ""
        // 如果 index 小於 Array 內東西的數量 -1
        if index < composerArray.count - 1 {
            // 則 index + 1
            index += 1
            // 問題 Label 顯示 +1 後的 index 對應的作曲家名
            excerciseQuestionLabel.text = composerArray[index].name
            // 如果 index = Array 內東西的數量 -1
        }else{
            // 將 Array 洗牌
            composerArray.shuffle()
            // index 歸 0
            index = 0
            // 問題 Label 顯示 +1 後的 index 對應的作曲家名
            excerciseQuestionLabel.text = composerArray[index].name
        }
        }
    
}

