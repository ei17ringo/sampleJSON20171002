//
//  ViewController.swift
//  sampleJSON
//
//  Created by Eriko Ichinohe on 2017/11/16.
//  Copyright © 2017年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //sample1.jsonを読み込むボタンを押した時発動
    @IBAction func tapSample1(_ sender: UIButton) {
    
        //sample1.jsonを読み込む
        var filePath = Bundle.main.path(forResource: "Sample1", ofType: "json")
        //Data型（人が読めない形式）でデータを取得
        
        var jsondata = NSData(contentsOfFile: filePath!)
        
        //配列データに変換
        var jsonArray = (try! JSONSerialization.jsonObject(with: Data.init(referencing: jsondata!))) as! Array<Any>
        
        // 配列の中身を高速列挙で表示
        for dat in jsonArray{
            print("値:\(dat)")
        }
        
    }
    
    //    TODO:Sample2.jsonを読み込んで、「ダージリンのお値段は600ペソです」となるような表示を取得したデータを使ってデバッグエリアに表示してください
    
    
    @IBAction func tapSample2(_ sender: UIButton) {
        //sample2.jsonを読み込む
        var filePath = Bundle.main.path(forResource: "Sample2", ofType: "json")
        //Data型（人が読めない形式）でデータを取得
        
        var jsondata = NSData(contentsOfFile: filePath!)
        
        //配列データに変換
        var jsonArray = (try! JSONSerialization.jsonObject(with: Data.init(referencing: jsondata!))) as! Array<Any>
        
        // 配列の中身を高速列挙で表示
        for dat in jsonArray{
            // ヒント：Any型からDictionary型へ型変換
            var dic = dat as! NSDictionary   //超重要！
            
            var name = dic["name"] as! String
            var price = dic["price"] as! Int
            print("\(name)のお値段は\(price)ペソです")
        }
    }
    
    //TODO:Sample3.jsonを読み込んで、「関東の餅:切り餅,醤油:濃口,月見団子:丸型」となるような表示を取得したデータを使ってデバッグエリアに表示してください
    @IBAction func tapSample3(_ sender: UIButton) {
        //sample3.jsonを読み込む
        var filePath = Bundle.main.path(forResource: "Sample3", ofType: "json")
        //Data型（人が読めない形式）でデータを取得
        
        var jsondata = NSData(contentsOfFile: filePath!)
        
        //辞書データに変換
        var jsonDictionary = (try! JSONSerialization.jsonObject(with: Data.init(referencing: jsondata!))) as! Dictionary<String, Any>
        
        // 辞書の中身を高速列挙で表示
        for (key,data) in jsonDictionary{
//            // ヒント：Any型からDictionary型へ型変換
            var dic = data as! NSDictionary   //超重要！
            
            //キー指定の場合
//
//            var 餅 = dic["餅"] as! String
//            var 醤油 = dic["醤油"] as! String
//            var 月見団子 = dic["月見団子"] as! String
//
//            print("\(key)の餅:\(餅),醤油:\(醤油),月見団子:\(月見団子)")
            
            //for文の場合
            for (dickey,dicdata) in dic {
                var 餅 = ""
                var 醤油 = ""
                var 月見団子 = ""
                
                var strKey = dickey as! String
                if strKey == "餅"{
                    餅 = dicdata as! String
                }
                
                if strKey == "醤油"{
                    醤油 = dicdata as! String
                }
                
                if strKey == "月見団子"{
                    月見団子 = dicdata as! String
                }
                print("\(key)の餅:\(餅),醤油:\(醤油),月見団子:\(月見団子)")
            }
            
            
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

