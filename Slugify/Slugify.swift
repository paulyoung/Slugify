import Foundation

extension String {
    private static let allowedCharacters = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-")
    
    public func slugify() -> String {
        let cocoaString = NSMutableString(string: self) as CFMutableStringRef
        CFStringTransform(cocoaString, nil, kCFStringTransformToLatin, false)
        CFStringTransform(cocoaString, nil, kCFStringTransformStripCombiningMarks, false)
        CFStringLowercase(cocoaString, .None)
        
        var string = String(cocoaString)
        
        while let range = string.rangeOfCharacterFromSet(String.allowedCharacters.invertedSet) {
            string = string
                .stringByReplacingCharactersInRange(range, withString: "-")
                .stringByReplacingOccurrencesOfString("--", withString: "-")
        }
        
        if string[string.startIndex] == "-" {
            string = string.substringFromIndex(string.startIndex.advancedBy(1))
        }
        
        if string[string.endIndex.advancedBy(-1)] == "-" {
            string = string.substringToIndex(string.endIndex.advancedBy(-1))
        }
        
        return string
    }
}
