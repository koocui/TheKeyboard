//
//  XCMoneyOfkeyboard.swift
//  自定义金额输入键盘
//
//  Created by 小崔 on 2018/11/5.
//  Copyright © 2018年 小崔fasdfff. All rights reserved.
//

import UIKit
private let KEYSCREENNW = UIScreen.main.bounds.size.width
private let KEYSCREENH = UIScreen.main.bounds.size.height
private let KeyBorodBtnW = (KEYSCREENNW-50)/4
private let KeyBorodBtnH = KeyBorodBtnW/2
private let KeyTopViewH = KeyBorodBtnH
private let KeyMidleViewH = KeyBorodBtnH*3
private let KeyBoradViewH = (KeyBorodBtnH*4) + 40 + 30
private let KeyContentViewH = KeyTopViewH + KeyMidleViewH + KeyBoradViewH
private let KEY_COLOR_BACKGROUND = UIColor(red: 237.0/255, green: 237.0/255, blue: 237.0/255, alpha: 1)
class XCMoneyOfkeyboard: UIView {

    //显示输入金额
    var showInputMoney:String?
    //灰色的遮罩
    private lazy var bgView:UIView = {
        let aView = UIView()
        aView.frame = CGRect(x: 0, y: 0, width: KEYSCREENNW, height: KEYSCREENH)
        aView.alpha = 0.3
        aView.backgroundColor = UIColor.black
        return aView
    }()
    //内容的View
    private lazy var contentView:UIView = {
        let aview = UIView()
        aview.backgroundColor = UIColor.white
        return aview
    }()
    //头部view
    private lazy var topView : UIView = {
        let aview = UIView()
        aview.backgroundColor = KEY_COLOR_BACKGROUND
        aview.isUserInteractionEnabled = true
        return aview
    }()
    ///取消按钮
    private lazy var cancelBtn:UIButton = {
        let abtn = UIButton()
        abtn.setTitle("取消", for: .normal)
        abtn.setTitleColor(UIColor.gray, for: .normal)
        abtn.layer.borderColor = UIColor.lightGray.cgColor
        abtn.layer.borderWidth = 1.0
        abtn.addTarget(self, action: #selector(XCMoneyOfkeyboard.cancelBtnClick), for: .touchUpInside)
        return abtn
    }()
    
    //金额输入显示的View
    private lazy var mideView:UIView = {
        let aview = UIView()
        aview.backgroundColor = UIColor.white
        return aview
    }()
    //显示金额￥符
    private lazy var moneyF:UILabel = {
        let alable = UILabel()
        alable.text = "￥"
        alable.textColor = UIColor.black
        alable.font = UIFont.systemFont(ofSize: 30)
        return alable
    }()
    ///输入金额的textFiled
    private lazy var moneyTextF:UILabel = {
        let atextF = UILabel()
        atextF.textColor = UIColor.red
        atextF.font = UIFont.systemFont(ofSize: 30)
        atextF.text = "500,000.00"
        return atextF
    }()
    //分割线
    private lazy var line : UILabel = {
        let alabel = UILabel()
        alabel.backgroundColor = UIColor.lightText
        return alabel
    }()
    ///起购金额
    private lazy var startTishi:UILabel = {
        let alabel = UILabel()
        alabel.text = "起购金额："
        alabel.textColor = UIColor.darkGray
        alabel.font = UIFont.systemFont(ofSize: 15)
        return alabel
    }()
    ///起购金额
    private lazy var startMoney:UILabel = {
        let alabel = UILabel()
        alabel.text = "￥2,000.00"
        alabel.textColor = UIColor.darkGray
        alabel.font = UIFont.systemFont(ofSize: 15)
        return alabel
    }()
    ///递增金额
    private lazy var increasTishi:UILabel = {
        let alable = UILabel()
        alable.text = "递增金额："
        alable.font = UIFont.systemFont(ofSize: 15)
        alable.textColor = UIColor.darkGray
        return alable
    }()
    ///递增金额
    private lazy var increasMMondy:UILabel = {
        let alable = UILabel()
        alable.text = "￥1000.00"
        alable.font = UIFont.systemFont(ofSize: 15)
        alable.textColor = UIColor.darkGray
        return alable
    }()
    
    //键盘的View
    private lazy var keyboradView:UIView = {
        let aView = UIView()
        aView.backgroundColor = KEY_COLOR_BACKGROUND
        return aView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        showInputMoney = ""
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}
//画页面
extension XCMoneyOfkeyboard{
    //1，初始化UI
    func configUI(){
        addSubview(bgView)
        addSubview(contentView)
        contentView.addSubview(topView)
        topView.addSubview(cancelBtn)
        contentView.addSubview(mideView)
        mideView.addSubview(moneyF)
        mideView.addSubview(moneyTextF)
        mideView.addSubview(line)
        mideView.addSubview(startMoney)
        mideView.addSubview(startTishi)
        mideView.addSubview(increasTishi)
        mideView.addSubview(increasMMondy)
        contentView.addSubview(keyboradView)
        
        //内容View
        contentView.frame = CGRect(x: 0, y: KEYSCREENH-KeyContentViewH, width: KEYSCREENNW, height: KeyContentViewH)
        topView.frame = CGRect(x: 0, y: 0, width: KEYSCREENNW, height: KeyTopViewH)
        cancelBtn.frame = CGRect(x: KEYSCREENNW-KeyBorodBtnW, y: 0, width: KeyBorodBtnW, height: KeyBorodBtnH)
        mideView.frame = CGRect(x: 0, y: KeyTopViewH, width: KEYSCREENNW, height: KeyMidleViewH)
        moneyF.frame = CGRect(x: 10, y: KeyBorodBtnH/2, width: 30, height: KeyBorodBtnH)
        moneyTextF.frame = CGRect(x: 40, y: KeyBorodBtnH/2, width: KEYSCREENNW-80, height: KeyBorodBtnH)
        line.frame = CGRect(x: 10, y: KeyBorodBtnH*2, width: KEYSCREENNW - 20, height: 1)
        startTishi.frame = CGRect(x: 10, y: KeyBorodBtnH*2+1, width: KeyBorodBtnW, height: KeyBorodBtnH)
        startMoney.frame = CGRect(x: 10+KeyBorodBtnW, y: KeyBorodBtnH*2+1, width: KeyBorodBtnW, height: KeyBorodBtnH)
        increasTishi.frame = CGRect(x: 20 + KeyBorodBtnW*2, y: KeyBorodBtnH*2+1, width: KeyBorodBtnW, height: KeyBorodBtnH)
        increasMMondy.frame = CGRect(x: 20 + KeyBorodBtnW*3, y: KeyBorodBtnH*2+1, width: KeyBorodBtnW, height: KeyBorodBtnH)
        keyboradView.frame = CGRect(x: 0, y: KeyBorodBtnH*4, width: KEYSCREENNW, height: KeyBoradViewH)
        drawKeyboard()
    }
    
    func drawKeyboard(){
        var btnx:CGFloat = 10
        var btny:CGFloat = 10
        for i in 0...3{
            btny = 10 + ((KeyBorodBtnH+10) * CGFloat(i))
            for j in 0...3 {
                btnx = 10 + ((KeyBorodBtnW+10) * CGFloat(j))
                let btn = UIButton()
                if i < 3 && j < 3 {//数字
                    btn.setTitle("\(j+(i*3+1))", for: .normal)
                    btn.tag = j+(i*3+1)
                }
                if  i == 0 && j == 3 {//第一行第四列
                    btn.setTitle("删除", for: .normal)
                    btn.tag = 101
                }
                if i == 1 && j == 3 {//第二行第四列
                    btn.setTitle("0000", for: .normal)
                    btn.tag = 102
                }
                if i == 3 {//第四行数字
                    if j == 0{
                        btn.setTitle("清除", for: .normal)
                        btn.tag = 103
                    }
                    if j == 1{
                        btn.setTitle("0", for: .normal)
                        btn.tag = 104
                    }
                    if j == 2{
                        btn.setTitle("00", for: .normal)
                        btn.tag = 105
                    }
                    
                }
                if !(i == 3 && j == 3) {//第四行第四列
                    btn.setTitleColor(UIColor.black, for: .normal)
                    btn.backgroundColor = UIColor.white
                    btn.frame = CGRect(x: btnx, y: btny, width: KeyBorodBtnW, height: KeyBorodBtnH)
                    btn.setTitleColor(UIColor.red, for: .highlighted)
                }
               
                if i == 2 && j == 3 {//第三行第四列
                    btn.setTitleColor(UIColor.white, for: .normal)
                    btn.setTitle("确定", for: .normal)
                    btn.backgroundColor = UIColor.red
                    btn.tag = 106
                    btn.frame = CGRect(x: btnx, y: btny, width: KeyBorodBtnW, height: KeyBorodBtnH*2 + 10)
                }
                btn.addTarget(self, action: #selector(self.keyboardBtnClick(_:)), for: .touchUpInside)
                keyboradView.addSubview(btn)
            }
        }
    }
  
}
extension XCMoneyOfkeyboard{
    @objc func cancelBtnClick(){
        self.removeFromSuperview()
    }
    @objc func keyboardBtnClick(_ button:UIButton){
        print("btnTag->\(button.tag)")
        button.isHighlighted = true
        if button.tag < 10{//点击数字
            showInputMoney = showInputMoney! + "\(button.tag)"
        }
        if button.tag == 101{//点击删除
            if showInputMoney != ""{
                let endIndex = showInputMoney?.index((showInputMoney?.endIndex)!, offsetBy: -1)
                showInputMoney = "\(showInputMoney!.prefix(upTo: endIndex!))"
            }
        }
        if button.tag == 102{//点击0000
            showInputMoney = showInputMoney! + "0000"
        }
        if button.tag == 103{//点击清除
            showInputMoney = ""
        }
        if button.tag == 104{//点击0
            showInputMoney = showInputMoney! + "0"
        }
        if button.tag == 105{//点击00
            showInputMoney = showInputMoney! + "00"
        }
        self.moneyTextF.text = showInputMoney
    }
}































































