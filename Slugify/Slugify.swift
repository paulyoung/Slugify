import Foundation

extension String {
    private static let allowedCharacters = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-")
    
    public func slugify() -> String {
        let cocoaString = NSMutableString(string: self) as CFMutableStringRef
        CFStringTransform(cocoaString, nil, kCFStringTransformToLatin, false)
        CFStringTransform(cocoaString, nil, kCFStringTransformStripCombiningMarks, false)
        CFStringLowercase(cocoaString, .None)
        
        return String(cocoaString)
            .componentsSeparatedByCharactersInSet(String.allowedCharacters.invertedSet)
            .filter { $0 != "" }
            .joinWithSeparator("-")
    }
}
