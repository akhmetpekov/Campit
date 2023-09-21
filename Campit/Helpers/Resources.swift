//
//  Resources.swift
//  Campit
//
//  Created by Erik on 19.09.2023.
//

import UIKit

enum Resources {
    enum Colors {
        static var primary = UIColor(hexString: "#0f1115")
        static var active = UIColor(hexString: "#fffffe")
        static var citate = UIColor(hexString: "#434751")
        static var author = UIColor(hexString: "#282c34")
        static var inactive = UIColor(hexString: "#57595c")
        static var greenTint = UIColor(hexString: "#6bd064")
        static var secondary = UIColor(hexString: "#171b20")
    }
    
    enum Strings {
        enum TabBar {
            static var all = "all"
            static var today = "today"
            static var settings = "settings"
        }
    }
    
    enum Images {
        static var burgerIcon = "line.3.horizontal.circle"
        static var addIcon = "plus.circle"
        static var chevronDown = "chevron.down"
        static var dismissIcon = "xmark.circle"
        static var checkmarkIcon = "checkmark.seal.fill"
    }
    
    enum Fonts {
        static var main = "montreal-serial-bold"
        static var tab = "montreal-serial-regular"
        static var citate = "ArquitectaLight"
    }
    
    enum Constants {
        enum Size {
            static var main: CGFloat = 30
        }
        
        static var leading = 20
        static var trailing = -20
        static var titleLeading = 10
        static var titleTop = 20
    }
}
