//
//  ViewController2.swift
//  寻色
//
//  Created by Mengduan on 2024/3/11.
//

import UIKit
import CoreML
import Vision
import NaturalLanguage
import Alamofire
class ViewController2 : UIViewController{
    var loadCount = 3
    var load = String()
    var iswhite = false
    let tableId = "tableCell"
    var timer : Timer?
    var timeArray : [String] = []
    lazy var topLabel : UILabel = {
       let label = UILabel(frame: CGRect(x: -2, y: 0, width: 395, height: 100))
        label.text = "健 康 秘 语"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 2
        
        return label
    }()
    lazy var textView : UITextField = {
        let textview = UITextField(frame: CGRect(x: 0, y: 720, width: 300, height: 40))
        textview.backgroundColor = .white
        textview.textColor = .black
        textview.delegate = self
        textview.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
        textview.placeholder = "来说点什么吧。"
        textview.tintColor = .black
        textview.textAlignment = .left
        textview.contentVerticalAlignment = .center
        textview.borderStyle = .bezel
        
//        textview.layer.borderColor = UIColor.black.cgColor
//        textview.layer.borderWidth = 2
        return textview
    }()
    
    lazy var sendButton : UIButton = {
       let button = UIButton(frame: CGRect(x: 300, y: 720, width: 93, height: 42))
        button.setTitle("发送", for: .normal)
        button.backgroundColor = .black
        button.tintColor = UIColor.white
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
        button.addTarget(self, action: #selector(judgeText), for: .touchUpInside)
        return button
    }()
    
    lazy var tableView : UITableView = {
      let tableview = UITableView(frame: CGRect(x: 0, y: 100, width: 393, height: 620))
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(TableViewCell.self, forCellReuseIdentifier: tableId)
        tableview.backgroundColor = .black
        // 设置预估行高, 必须要写, 否则打印垃圾log日志, 提示约束冲突,随便写一个值就行了
        tableview.estimatedRowHeight = 80
        // 自动计算行高
        tableview.rowHeight = UITableView.automaticDimension
        return tableview
    }()
    
    private lazy var sentimentClassifier: NLModel? = {
        let model = try? NLModel(mlModel: MyTextsClassifier().model)
        return model
    }()
    
    lazy var changeColor : UIButton = {
       let button = UIButton(frame: CGRect(x: 340, y: 45, width: 50, height: 50))
        button.setImage(UIImage(named: "w"), for: .normal)
        button.addTarget(self, action: #selector(changecolor), for: .touchUpInside)
        return button
    }()
    lazy var topButton : UIButton = {
       let button  = UIButton(frame: CGRect(x: 0, y: 100, width: 393, height: 740 - 380))
        button.addTarget(self, action: #selector(resign), for: .touchUpInside)
        button.backgroundColor = .clear
        button.isHidden = true
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        AskIfNeedOpendHttps()
        self.view.backgroundColor = .black
        self.view.addSubview(topLabel)
        self.view.addSubview(tableView)
        self.view.addSubview(changeColor)
        self.view.addSubview(textView)
        self.view.addSubview(sendButton)
        self.view.addSubview(topButton)
        for index in (0...1000){
            timeArray.append("nono")
        }
    }
    



}



extension ViewController2 : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableId) as! TableViewCell
        let time = getCurrentTime(timeFormat: .YYYYMMDDHHMMSS)
        
        cell.timeLabel.text = time
        cell.chatLabel.text = message[indexPath.row]
        if iswhite == false{
            cell.backgroundColor = UIColor.black
            cell.avatarImageView.image = UIImage(named: "ai0")
            cell.timeLabel.textColor = .white
            cell.chatLabel.textColor = .white
        }else{
            cell.backgroundColor = UIColor.white
            cell.avatarImageView.image = UIImage(named: "ai1")
            cell.timeLabel.textColor = .black
            cell.chatLabel.textColor = .black
        }
        
        //用户
        if (indexPath.row % 2 == 1){
            if iswhite == false{
                cell.avatarImageView.image = UIImage(named: "me0")
            }else{
                cell.avatarImageView.image = UIImage(named: "me1")
            }
            
        }else{
        //AI
            
            if iswhite == false{
                cell.avatarImageView.image = UIImage(named: "ai0")
            }else{
                cell.avatarImageView.image = UIImage(named: "ai1")
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 24
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    
    
}


extension ViewController2{
    //获取时间
    func getCurrentTime(timeFormat:TimeFormat) -> String{
            let formatter = DateFormatter()
            formatter.dateFormat = timeFormat.rawValue
            let timezone = TimeZone.init(identifier: "Asia/Beijing")
            formatter.timeZone = timezone
            let dateTime = formatter.string(from: Date.init())
            return dateTime
        }
    
}
extension ViewController2: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, animations: {
            self.textView.center.y = 740 - 250
            self.sendButton.center.y = 740 - 250
        })
        self.topButton.isHidden = false
    }
    
    @objc func resign(){
        //收起键盘
        self.textView.resignFirstResponder()
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, animations: {
            self.textView.center.y = 740
            self.sendButton.center.y = 740
        })
        self.topButton.isHidden = true
    }
    

    func  textFieldShouldReturn(_ textField: UITextField ) ->  Bool
        {
            //收起键盘
            self.textView.resignFirstResponder()
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, animations: {
                self.textView.center.y = 740
                self.sendButton.center.y = 740
            })
            return  true ;
        }
}


extension ViewController2{
    
    @objc func judgeText(){
        guard  self.textView.text != nil  else {
            return
        }
        if self.textView.text == ""{
            return
        }
        //文本分类
        if let nowtext = self.textView.text{
            self.load = nowtext
            DispatchQueue.main.async{
                self.textView.text = ""
                message.append(nowtext)
                message.append("  ...")
                // 创建两个新的 IndexPath 来分别对应两个新消息
                let newIndexPath1 = IndexPath(row: message.count - 2, section: 0)
                let newIndexPath2 = IndexPath(row: message.count - 1, section: 0)
//                    UIView.performWithoutAnimation {
                    // 插入新的 cell
                    self.tableView.beginUpdates()
                    self.tableView.insertRows(at: [newIndexPath1, newIndexPath2], with: .none)
                    self.tableView.endUpdates()
                let lastRow = self.tableView.numberOfRows(inSection: 0) - 1
                let indexPath = IndexPath(row: lastRow, section: 0)
                self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
                self.chatRequest(input: nowtext)
                self.load = nowtext
                self.timer = Timer.scheduledTimer(withTimeInterval: 1.2, repeats: true, block: {_ in
                    if message[chatIndex] != "  ..." && message[chatIndex] != "  ." && message[chatIndex] != "  .."{
                        let indexPath = IndexPath(row: chatIndex, section: 0)
                        self.tableView.reloadRows(at: [indexPath], with: .fade)
                        let indexPath1 = IndexPath(row: lastRow, section: 0)
                        self.tableView.scrollToRow(at: indexPath1, at: .bottom, animated: true)
                        chatIndex = chatIndex + 2
                        self.timer?.invalidate()
                    }else if message[chatIndex] == "  ."{
                        message[chatIndex] = "  .."
                    }else if message[chatIndex] == "  .."{
                        message[chatIndex] = "  ..."
                    }else if message[chatIndex] == "  ..."{
                        message[chatIndex] = "  ."
                    }
                    //禁用动画
                    UIView.performWithoutAnimation {
                        let indexPath = IndexPath(row: chatIndex, section: 0)
                        self.tableView.reloadRows(at: [indexPath], with: .fade)
                    }
                })
            }
//            chatTexts.append(nowtext)
//            self.tableView.reloadData()
//            if let label = sentimentClassifier?.predictedLabel(for: nowtext) {//机器学习Core ML预测文本标签
//                chatTexts.append(label)
//                self.tableView.reloadData()
//                self.tableView.scrollToRow(at: NSIndexPath(row: chatTexts.count - 1,section: 0) as IndexPath, at: .bottom, animated: true)
//                self.textView.text = ""
//            }
            
        }
        
    }
    
    @objc func changecolor(){
        isWhiteColor = !isWhiteColor
        if isWhiteColor == true{
            self.changeColor.setImage(UIImage(named: "w"), for: .normal)
        }else{
            self.changeColor.setImage(UIImage(named: "b"), for: .normal)
        }
    }
    
    
}

extension ViewController2{
    func chatRequest(input : String) {
        // 更改 scenario 的 description 值
        let newDescription = input
        // 获取 scenario 数组
        var inputDict = parameters["input"] as! [String: Any]
        var acaDict = inputDict["aca"] as! [String: Any]
        var scenarioArray = acaDict["scenario"] as! [String: Any]
        // 更新 description 值
        scenarioArray["description"] = newDescription
        // 将更新后的 scenario 数组放回到 aca 字典和 input 字典和 parameters 字典中
        acaDict["scenario"] = scenarioArray
        inputDict["aca"] = acaDict
        parameters["input"] = inputDict
            // 添加新的信息
        let newMessage1 = ["role": "assistant", "content": "\(message[chatIndex - 1])"]
            // 修改 messages 数组
            var inputDicts = parameters["input"] as! [String: Any]
            var messagesArray = inputDicts["messages"] as! [[String: Any]]
            messagesArray.append(newMessage1)
            // 将修改后的 messages 数组放回到 input 字典和 parameters 字典中
            inputDicts["messages"] = messagesArray
            parameters["input"] = inputDicts
        
        print(parameters)
        //网络请求连接云服务器，AI响应式对话
        DispatchQueue.main.async {
            AF.request("https://nlp.aliyuncs.com/v2/api/chat/send", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).response { response in
                if let data = response.value {
                        do {
                            let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
                            if let response = json,
                               let data = response["data"] as? [String: Any],
                               let choices = data["choices"] as? [[String: Any]],
                               let messages = choices.first?["messages"] as? [[String: Any]],
                               let messages = messages.first,
                               let content = messages["content"] as? String {
                                print(content)
                                message[chatIndex] = content
                                let newMessage2 = ["role": "user", "content": "\(message[chatIndex])"]
                                var messagesArray = inputDicts["messages"] as! [[String: Any]]
                                messagesArray.append(newMessage2)
                                // 将修改后的 messages 数组放回到 input 字典和 parameters 字典中
                                inputDicts["messages"] = messagesArray
                                parameters["input"] = inputDicts
                                print(parameters)
                            } else {
                                print("Couldn't find content.")
                            }
                        } catch {
                            if self.loadCount > 0{
                                self.chatRequest(input: self.load)
                                self.loadCount -= 1
                            }
                            print("Error parsing JSON: \(error)")
                        }
                }else{
                    if self.loadCount > 0{
                        self.chatRequest(input: self.load)
                        self.loadCount -= 1
                    }
                }
            }
        }
    }
    
    private func AskIfNeedOpendHttps(){
        let launchURL = "https://www.baidu.com/"
        let launchRequestHeaders: HTTPHeaders = [
            "Authorization": "Bearer sk-2f319367f0b848ee9716a0e525f4ed52"
        ]
        AF.request(launchURL, method: .get, headers: launchRequestHeaders)
            .responseJSON { result in
                print("Already connected to the network")
            }
    }
}
