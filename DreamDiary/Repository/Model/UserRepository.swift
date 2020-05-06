
protocol UserRepository {
    func create(loginId: String, name: String) -> User
    func findByLoginId(loginId: String) -> User?
}
