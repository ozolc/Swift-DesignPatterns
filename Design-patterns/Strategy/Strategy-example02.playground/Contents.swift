protocol StrategyProtocol {
    func method(first a: Int, second b: Int) -> Int
}

class StrategyAdd: StrategyProtocol {
    func method(first a: Int, second b: Int) -> Int {
        let result = a + b
        print(result)
        return a + b
    }
}

class StrategySubstruct: StrategyProtocol {
    func method(first a: Int, second b: Int) -> Int {
        let result = a - b
        print(result)
        return result
    }
}

class Context {
    private var strategy: StrategyProtocol?
    
    init(strategy: StrategyProtocol) {
        self.strategy = strategy
    }
    
    func setStrategy(strategy: StrategyProtocol) {
        self.strategy = strategy
    }
    
    func operation(a: Int, b: Int) -> Int {
        guard let strategy = strategy else { return 0 }
        return strategy.method(first: a, second: b)
    }
}

let substruct = StrategySubstruct()
let add = StrategyAdd()
let context = Context(strategy: substruct)
context.operation(a: 5, b: 2)
context.setStrategy(strategy: add)
context.operation(a: 5, b: 2)
