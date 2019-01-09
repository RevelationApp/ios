import UIKit

class Typography {
    enum FontStyle: String {
        case regular = "HelveticaNeue"
        case light = "HelveticaNeue-Light"
        case medium = "HelveticaNeue-Medium"
        case bold = "HelveticaNeue-Bold"
    }

    enum FontSize: CGFloat {
        case largeTitle = 24
        case title = 22
        case subtitle = 20
        case body = 14
        case caption = 12
    }

    static func font(style: FontStyle, size: FontSize) -> UIFont {
        let font = UIFont(name: style.rawValue, size: size.rawValue)!
        return font
    }
}
