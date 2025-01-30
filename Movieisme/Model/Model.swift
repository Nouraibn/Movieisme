struct MovieResponse: Codable {
    let records: [Movie]?
}

struct Movie: Codable, Identifiable {
    let id: String
    let createdTime: String
    let fields: Moviefields
}

struct Moviefields: Codable {
    let name: String?
    let rating: String?
    let genre: [String]?
    let poster: String?
    let language: [String]?
    let IMDb_rating: Int?
    let runtime: String?
    let story: String?
}

struct ActorResponse: Codable {
    let records: [Actor]?
}

struct Actor: Codable, Identifiable {
    let id: String
    let createdTime: String
    let fields: Actorfields
}

struct Actorfields: Codable {
    let image: String?
    let name: String
}

struct UserResponse: Codable {
    let records: [User]?
}

struct User: Codable, Identifiable {
    let id: String
    let createdTime: String
    let fields: Userfields
}

struct Userfields: Codable {
    let profile_image: String?
    let email: String
    let name: String
    let password: String
}

struct DirectorResponse: Codable {
    let records: [Director]?
}

struct Director: Codable, Identifiable {
    let id: String
    let createdTime: String
    let fields: Directorfields
}

struct Directorfields: Codable {
    let name: String
    let image: String?
}

struct ReviewResponse: Codable {
    let records: [Review]?
}

struct Review: Codable, Identifiable {
    let id: String
    let createdTime: String
    let fields: Reviewfields
}

struct Reviewfields: Codable {
    let review_text: String
    let rate: Int
    let movie_id: String
    let user_id: String
}
