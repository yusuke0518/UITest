//
//  ViewController.swift
//  UITest
//
//  Created by 保坂勇輔 on 2019/07/07.
//  Copyright © 2019 保坂勇輔. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    private var myInfoDarkButton: UIButton!
    private var myInfoLightButton: UIButton!
    private var myAddButton: UIButton!
    private var myDetailButton: UIButton!
    private var mySystemButton: UIButton!
    private var myCustomButton: UIButton!
    private var myRectButton: UIButton!
    private var myButton: UIButton!
    private var myTextField: UITextField!
    private var label : UILabel!
    var count=0
    
    // ボタンのサイズを定義.
    let bWidth: CGFloat = 200
    let bHeight: CGFloat = 50
    // UITextFieldの配置するx,yと幅と高さを設定.
    let tWidth: CGFloat = 200
    let tHeight: CGFloat = 30

    override func viewDidLoad() {
        super.viewDidLoad()
        // Viewの背景を青にする.
        self.view.backgroundColor = UIColor.cyan
    
        // 配置する座標を定義(画面の中心).
        let posX: CGFloat = self.view.bounds.width/2 - bWidth/2
        let posY: CGFloat = self.view.bounds.height/2 - bHeight/2
        
        // Labelを作成.
        label = UILabel(frame: CGRect(x: posX, y: posY-100, width: bWidth, height: bHeight))
        label.text = "整数を入力してね"
        myTextField = UITextField(frame: CGRect(x: posX, y: posY, width: tWidth, height: tHeight))
    
        // Buttonを生成する.
//        myButton = UIButton()
        
        // ボタンの設置座標とサイズを設定する.
//        myButton.frame = CGRect(x: posX, y: posY, width: bWidth, height: bHeight)
        
        changeTextField()
        
        // Viewに追加する
        self.view.addSubview(myTextField)
        
        // ViewにLabelを追加.
        self.view.addSubview(label)

    }
    
    func changeLabel(label:UILabel){
        label.backgroundColor = UIColor.orange
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15.0
        label.textColor = UIColor.white
        label.text = "Hello Swift!!"
        label.shadowColor = UIColor.gray
        label.textAlignment = NSTextAlignment.center
    }
    
    func changeButton(button:UIButton){
    
        
        // ボタンの背景色を設定.
        myButton.backgroundColor = UIColor.red
        
        // ボタンの枠を丸くする.
        myButton.layer.masksToBounds = true
        
        // コーナーの半径を設定する.
        myButton.layer.cornerRadius = 20.0
        
        // タイトルを設定する(通常時).
        myButton.setTitle("ボタン(通常)", for: .normal)
        myButton.setTitleColor(UIColor.white, for: .normal)
        
        // タイトルを設定する(ボタンがハイライトされた時).
        myButton.setTitle("ボタン(押された時)", for: .highlighted)
        myButton.setTitleColor(UIColor.black, for: .highlighted)
        
        // ボタンにタグをつける.
        myButton.tag = 1
        
        myButton.addTarget(self, action: #selector(onClickMyButton(_sender:)) , for: UIControl.Event.touchUpInside)
    }
    
    func changeTextField(){
        myTextField.text = ""
        myTextField.delegate = self
        myTextField.borderStyle = .roundedRect
        myTextField.clearButtonMode = .whileEditing
    }
    
    func makeButton(){
        let posX: CGFloat = self.view.bounds.width/2 - bWidth/2
        myInfoDarkButton = UIButton(type: .infoDark)
        myInfoLightButton = UIButton(type: .infoLight)
        myAddButton = UIButton(type: .contactAdd)
        myDetailButton = UIButton(type: .detailDisclosure)
        mySystemButton = UIButton(type: .system)
        myCustomButton = UIButton(type: .custom)
        myRectButton = UIButton(type: .roundedRect)
        myInfoDarkButton.layer.position = CGPoint(x: posX, y: 50)
        myInfoLightButton.layer.position = CGPoint(x: posX, y: 100)
        myAddButton.layer.position = CGPoint(x: posX, y: 150)
        myDetailButton.layer.position = CGPoint(x: posX, y: 200)
        myCustomButton.layer.position = CGPoint(x: posX, y: 250)
        myRectButton.layer.position = CGPoint(x: posX, y: 300)
    }
    
    func addButtons(){
        self.view.addSubview(myButton)
        self.view.addSubview(myInfoDarkButton)
        self.view.addSubview(myInfoLightButton)
        self.view.addSubview(myAddButton)
        self.view.addSubview(myDetailButton)
        self.view.addSubview(mySystemButton)
        self.view.addSubview(myCustomButton)
        self.view.addSubview(myRectButton)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func onClickMyButton(_sender: UIButton) {
        count+=1
        print(String(count)+"回クリックされました")
    }

    /*
     UITextFieldが編集された直前に呼ばれる
     */
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing: \(textField.text!)")
    }
    
    /*
     UITextFieldが編集された直後に呼ばれる
     */
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing: \(textField.text!)")
    }
    
    /*
     改行ボタンが押された際に呼ばれる
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn: \(textField.text!)")
        textField.resignFirstResponder()
        
        
        guard let num:Int = toInt(textField.text!) else{
            label.text="整数を入力してね"
            return true
        }
        if isPrime(x: num){
            label.text="素数だぁぁあ"
        }
        else{
            label.text="素数じゃねぇxえx"
        }
        return true
        
        
        
        
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("textFieldShouldClear: \(textField.text!)")
        return true
    }
    
    func isPrime(x:Int) -> Bool{
        if x<2{
            return false
        }
        for i in 2..<Int(sqrt(Double(x)))+1 {
            if(x%i==0){
                return false
            }
        }
        return true
    }
    
    func toInt(_ string:String) -> Int? {
        return Int(string)
    }
    
}

