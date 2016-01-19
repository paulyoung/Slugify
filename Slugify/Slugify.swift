import Foundation

extension String {
    private static let allowedCharacters = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-")
    
    public func slugify() -> String {
        var string = self
        
        string = string
            .stringByApplyingTransform(NSStringTransformToLatin, reverse: false)?
            .stringByApplyingTransform(NSStringTransformStripDiacritics, reverse: false)?
            .localizedLowercaseString ?? string
        
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
