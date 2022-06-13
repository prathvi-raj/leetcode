import Foundation
import Combine
import UIKit
import Darwin


struct User {
    let name: String
    let userId: String
}

enum AuthenticationState {
    case guest
    case loggedIn(User)
}

protocol APIService {
    func performDataTask(request: URLRequest) -> AnyPublisher<Codable, Never>
}

Protocol StorageService {
    func storeData(_ data: Data, key: String)
    func storeValue(_ value: String, key: String)
}

Protocol KeyChainStorageService {
    func storeData(_ data: Data, key: String)
    func storeValue(_ value: String, key: String)
}

Protocol LoginRepository {
    func loginWithEmail(email: String, password: String) -> AnyPublisehr<AuthenticationState, Never>
}

Protocol LoginService {
    var currentLoggedInState: AnyPublisehr<AuthenticationState, Never>  { get }
    func loginWithEmail(_ email: String, password: String) -> AnyPublisehr<AuthenticationState, Never>
    func logout() -> Void
}


class ConcreteAPIService: APIService {

}

class MockLoginService: LoginService {

}

class ConcreteLoginRepository: LoginRepository {

}

class ConcreteStorageService: StorageService {

}

class ConcreteKeyChainStorageService: KeyChainStorageService {

}

class ConcreteLoginRepository: LoginRepository {

}


protocol Scene<ViewConbtroller> {
    typealias ViewConbtroller: uiview


    func createViewController
}



class LoginScene: Scene {

}

protocol LoginViewModelProtocol {
    func login()
}


class LoginViewModel: LoginViewModelProtocol {
    var user: User
    func login()
}


