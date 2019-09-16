//
//  DHString.swift
//
//  Created by showthat on 16/09/2019.
//

extension String {
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    func localized(bundle: Bundle = .main) -> String {
        let table: String = "Localizable"
        
        return NSLocalizedString(self, tableName: table, value: "**\(self)**", comment: "")
    }
    
    
    func isEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: self)
    }
    
    func isPasswordFormatted() -> Bool {
        //지정된 문자셋을 각각 포함하는 것으로 확인.
        //영문, 숫자, 특수문자를 모두 포함해야 하는 조건으로 처리한다.
        let characterSetAlphabet:CharacterSet = CharacterSet.init(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ")
        let characterSetSpecial:CharacterSet = CharacterSet.init(charactersIn: "!@#$%^&*()")
        let characterSetNumber:CharacterSet = CharacterSet.init(charactersIn: "0123456789")
        
        return self.rangeOfCharacter(from: characterSetAlphabet) != nil && self.rangeOfCharacter(from: characterSetSpecial) != nil && self.rangeOfCharacter(from: characterSetNumber) != nil
        
        //        
        //        //지정된 문자외 입력된 문자를 검출하여 확인.
        //        let characterSet:CharacterSet = CharacterSet.init(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ!@#$%^&*()0123456789")
        //        return self.rangeOfCharacter(from: characterSet.inverted) == nil
    }
    
    func isUserIDFormatted() -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[a-zA-Z0-9//s]{5,12}$", options: .caseInsensitive)
            return 0 != regex.numberOfMatches(in: self, options: [], range: NSMakeRange(0, self.count))
        }
        catch {
            return false
        }
    }
    
    func isEmailFormatted() -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}", options: .caseInsensitive)
            return 0 != regex.numberOfMatches(in: self, options: [], range: NSMakeRange(0, self.count))
        }
        catch {
            return false
        }
    }
    
    func formattedDate(date:Date, format:String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale.current
        
        return dateFormatter.string(from: (date))
    }
    
    
    func toFormattedCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        
        var string = self.replacingOccurrences(of: ",", with: "")
        string = string.replacingOccurrences(of: "원", with: "")
        return formatter.string(from: NSNumber.init(value: Double(string) ?? 0)) ?? "0"
    }
    
    static func randomString() -> String {
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var random : NSMutableString = NSMutableString(capacity: 4)
        
        for _ in 0..<4 {
            var length = UInt32 (letters.length)
            var rand = arc4random_uniform(length)
            
            random.appendFormat("%C", letters.character(at: Int(rand)))
        }
        
        return random as! String
    }
    
    
    func toPhonenumberFormat() -> String {
        if self.count == 11 || self.count == 10 {
            let firstIndex = self.index(self.startIndex, offsetBy: 3)
            let midIndex = self.index(firstIndex, offsetBy: 4)
            let endIndex = self.index(self.endIndex, offsetBy: -4)
            
            return "\(self[..<firstIndex])-\(self[firstIndex..<midIndex])-\(self[endIndex...])"
        }
        else {
            return self
        }
    }
    
    func toBirthdayFormat() -> String {
        if self.count == 6 || self.count == 8 {
            let firstIndex = self.index(self.endIndex, offsetBy: -4)
            let midIndex = self.index(firstIndex, offsetBy: 2)
            let endIndex = self.index(self.endIndex, offsetBy: -2)
            return "\(self[..<firstIndex]). \(self[firstIndex..<midIndex]). \(self[endIndex...])"
        }
        else {
            return self
        }
    }
    
    
    // Url percent encoding according to RFC3986 specifications
    func urlPercentEncoded(withAllowedCharacters allowedCharacters: CharacterSet, encoding: String.Encoding) -> String {
        var returnStr = ""
        
        // Compute each char seperatly
        for char in self {
            let charStr = String(char)
            let charScalar = charStr.unicodeScalars[charStr.unicodeScalars.startIndex]
            if allowedCharacters.contains(charScalar) == false,
                let bytesOfChar = charStr.data(using: encoding) {
                // Get the hexStr of every notAllowed-char-byte and put a % infront of it, append the result to the returnString
                for byte in bytesOfChar {
                    returnStr += "%" + String(format: "%02hhX", byte as CVarArg)
                }
            } else {
                returnStr += charStr
            }
        }
        
        return returnStr
    }
}
