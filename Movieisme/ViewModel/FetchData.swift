

import Foundation
import Kingfisher
import Combine

// MARK: - ViewModel
class FetchData: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var actors: [Actor] = []
    @Published var users: [User] = []
    @Published var directors: [Director] = []
    @Published var reviews: [Review] = []
    @Published var errorMessage: String? = nil
    private var cancellables = Set<AnyCancellable>()

    func fetchMovies() {
        fetchData(urlString: "https://api.airtable.com/v0/appsfcB6YESLj4NCN/movies", completion: { (response: MovieResponse?) in
            self.movies = response?.records ?? []
        })
    }

    func fetchActors() {
        fetchData(urlString: "https://api.airtable.com/v0/appsfcB6YESLj4NCN/actors", completion: { (response: ActorResponse?) in
            self.actors = response?.records ?? []
        })
    }

    func fetchUsers() {
        fetchData(urlString: "https://api.airtable.com/v0/appsfcB6YESLj4NCN/users", completion: { (response: UserResponse?) in
            self.users = response?.records ?? []
        })
    }

    func fetchDirectors() {
        fetchData(urlString: "https://api.airtable.com/v0/appsfcB6YESLj4NCN/directors", completion: { (response: DirectorResponse?) in
            self.directors = response?.records ?? []
        })
    }

    func fetchReviews() {
        fetchData(urlString: "https://api.airtable.com/v0/appsfcB6YESLj4NCN/reviews", completion: { (response: ReviewResponse?) in
            self.reviews = response?.records ?? []
        })
    }

    private func fetchData<T: Codable>(urlString: String, completion: @escaping (T?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            errorMessage = "Invalid URL"
            return
        }

        var request = URLRequest(url: url)
        request.setValue("Bearer pat7E88yW3dgzlY61.2b7d03863aca9f1262dcb772f7728bd157e695799b43c7392d5faf4f52fcb001", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure(let error) = completion {
                    print("Decoding error: \(error.localizedDescription)")
                    self?.errorMessage = error.localizedDescription
                }
            }, receiveValue: { response in
                completion(response)
            })
            .store(in: &cancellables)
    }
}
