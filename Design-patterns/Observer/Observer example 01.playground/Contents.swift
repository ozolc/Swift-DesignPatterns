import Foundation

/// Наблюдатель объявляет метод уведомления, который используют издатели для
/// оповещения.
protocol Observer: class {
    func update(subject: Subject)
}

/// Издатель владеет некоторым важным состоянием и оповещает наблюдателей о его
/// изменениях.
class Subject {
    /// Для удобства в этой переменной хранится состояние Издателя, необходимое
    /// всем подписчикам.
    var state: Int = { return Int(arc4random_uniform(10)) } ()
    
    /// observers -  Список подписчиков. В реальной жизни список подписчиков может
    /// храниться в более подробном виде (классифицируется по типу события и
    /// т.д.)
    
    private lazy var observers = [Observer]()
    
    /// Методы управления подпиской.
    func attach(_ observer: Observer) {
        print("Subject: Attached an observer.")
        observers.append(observer)
    }
    
    func detach(_ observer: Observer) {
        if let idx = observers.firstIndex(where: { $0 === observer }) {
            observers.remove(at: idx)
            print("Subject: Detached an observer.")
        }
    }
    
    /// Запуск обновления в каждом подписчике.
    func notify() {
        print("Subject: Notifying observers...")
        observers.forEach( { $0.update(subject: self) } )
    }
    
    /// Обычно логика подписки – только часть того, что делает Издатель.
    /// Издатели часто содержат некоторую важную бизнес-логику, которая
    /// запускает метод уведомления всякий раз, когда должно произойти что-то
    /// важное (или после этого).
    func someBusinessLogic() {
        print("Subject: I'm doing something important.")
        state = Int(arc4random_uniform(10))
        print("Subject: My state has just changed to: \(state)")
        notify()
    }
}

/// Конкретные Наблюдатели реагируют на обновления, выпущенные Издателем, к
/// которому они прикреплены.
class ConcreteObserverA: Observer {
    func update(subject: Subject) {
        if subject.state < 3 {
            print("ConcreteObserverA: Reacted to the event.")
        }
    }
}

class ConcreteObserverB: Observer {
    
    func update(subject: Subject) {
        
        if subject.state >= 3 {
            print("ConcreteObserverB: Reacted to the event.\n")
        }
    }
}

/// Давайте посмотрим как всё это будет работать.
class ObserverConceeptual {
    
    func testObserverConceptual() {
        
        let subject = Subject()
        
        let observer1 = ConcreteObserverA()
        let observer2 = ConcreteObserverB()
        
        subject.attach(observer1)
        subject.attach(observer2)
        
        subject.someBusinessLogic()
        subject.someBusinessLogic()
        subject.detach(observer2)
        subject.someBusinessLogic()
    }
}

let conceptual = ObserverConceeptual()
conceptual.testObserverConceptual()
