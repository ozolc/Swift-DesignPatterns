import Foundation

protocol NameType {
    var name: String { get }
}

class UserShort: NameType {
    var id: UInt
    var name: String
    
    init(id: UInt, name: String) {
        self.id = id
        self.name = name
    }
}

final class UserLong: UserShort {
    var status: String
    var isOnline: Bool
    
    init(id: UInt, name: String, status: String, isOnline: Bool) {
        self.status = status
        self.isOnline = isOnline
        super.init(id: id, name: name)
    }
}

protocol UserProtocol {
    func sortedByName() -> [UserShort]
}

final class UserCollection: UserProtocol {
    let users: [UserShort]
    
    init(users: [UserShort]) {
        self.users = users
    }
    
    func sortedByName() -> [UserShort] {
        return users.sorted { $0.name > $1.name }
    }
}

let follower = UserShort(id: 1, name: "Medium Guest")
let currentUser = UserLong(id: 999, name: "Steve Jobs", status: "CEO of Apple", isOnline: true)
let userCollection = UserCollection(users: [currentUser, follower])
let sorted = userCollection.sortedByName()

for case let user as UserLong in sorted {
    print("UserLong: \(user.name)")
}
