import UIKit
//#"\d+\[[a-z]*\]"#
class MessageDecryptor: NSObject {
    
    func decryptMessage(_ message: String) -> String {
        func matchesForRegexInText(regex: String!, text: String!) -> [String] {

        do {

            let regex = try NSRegularExpression(pattern: regex, options: [])
            let nsString = text as NSString
            let results = regex.matches(in: text, options: [], range: NSMakeRange(0, nsString.length))
            return results.map { nsString.substring(with: $0.range)}
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }}
        
        var messageVar = message
        while matchesForRegexInText(regex: "\\d+\\[[a-z]*\\]", text: messageVar).count != 0 {
            var array = matchesForRegexInText(regex: "\\d+\\[[a-z]*\\]", text: messageVar)
            while !array.isEmpty {
                let number = matchesForRegexInText(regex: "\\d+", text: array[0])
                let substring = matchesForRegexInText(regex: "[a-z]++", text: array[0])
                var newString = String()
                if number[0] != "0" {
                    for _ in 1...Int(number[0])! {
                        newString += substring[0]
                    }
                } else { newString = "" }
                messageVar = messageVar.replacingOccurrences(of: array[0], with: newString)
                array.removeFirst()
            }
        }
        while matchesForRegexInText(regex: "\\[[a-z]*\\]", text: messageVar).count != 0 {
            var array = matchesForRegexInText(regex: "\\[[a-z]*\\]", text: messageVar)
            while !array.isEmpty {
                let substring = matchesForRegexInText(regex: "[a-z]++", text: array[0])
                let newString = String(substring[0])
                messageVar = messageVar.replacingOccurrences(of: array[0], with: newString)
                array.removeFirst()
            }
        }
        return messageVar

    }
    
}

