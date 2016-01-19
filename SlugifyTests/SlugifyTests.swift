import XCTest
import Slugify

class SlugifyTests: XCTestCase {
    func testSlugify() {
        let string = "!Hello~`!@#$%^&*()_+={}[]|\\;:'\"<>,.?/World! こんにちは! สวัสดี! مرحبا! 您好!"
        let slug = string.slugify()
        XCTAssertEqual("hello-world-kon-nichiha-swasdi-mrhba-nin-hao", slug)
    }
}
