import Foundation

struct DonutLayer: OptionSet {
    var rawValue: Int
    
    init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    static let dough = DonutLayer(rawValue: 1 << 1)
    static let glaze = DonutLayer(rawValue: 1 << 2)
    static let topping = DonutLayer(rawValue: 1 << 3)
    
    static let all: DonutLayer = [dough, glaze, topping]
}
