import Alamofire

var chatIndex = 2
var message : [String] = ["哈喽，我是乐于助人善良的琳琳(*^▽^*)，请问有什么我能帮你的吗？"]
let headers: HTTPHeaders = [
    "Content-Type": "application/json",
    "X-AcA-DataInspection": "enable",
    "x-fag-servicename": "aca-chat-send",
    "x-fag-appcode": "aca",
    "Authorization": "Bearer lm-U+OS+O8eK6ugoPovf6Zqtg=="
]
var parameters: Parameters = [
    "input": [
        "messages": [
            ["role": "assistant", "content": "哈喽，我是乐于助人善良的琳琳(*^▽^*)，请问有什么我能帮你的吗？"],
            ["role": "user", "content": "请在此输入对话"]
        ],
        "aca": [
            "botProfile": ["characterId": "0e42bad89763469aa9fd110c55d77540"],
            "userProfile": [ "userId": "123456", "userName": "小可爱", "basicInfo": "" ],
            "scenario": ["description": ""],
            "context": ["useChatHistory": false]
        ]
    ]
]
