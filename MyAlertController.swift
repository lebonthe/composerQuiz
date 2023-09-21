//
//  MyAlertController.swift
//  composerQuiz
//
//  Created by Min Hu on 2023/9/15.
//

import UIKit
// 定義一個新的子類別，繼承自UIAlertController
class MyAlertController: UIAlertController {
    
    // 自定義初始化方法，用來得知使用者選擇了確定還是取消
    convenience init(title: String?, message: String?, preferredStyle: UIAlertController.Style, completionHandler: @escaping (Bool) -> Void) {
        self.init(title: title, message: message, preferredStyle: preferredStyle)
        
        // 設定取消鍵
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { _ in
            // 用戶選擇了取消，將參數設為false
            completionHandler(false)
        }
        
        // 設定確定鍵
        let okAction = UIAlertAction(title: "確定", style: .destructive) { _ in
            // 用戶選擇了確定，將參數設為true
            completionHandler(true)
        }
        
        // 將取消鍵和確定鍵加入提示窗
        self.addAction(cancelAction)
        self.addAction(okAction)
    }
}
