//
//  MoviesService.swift
//  LearningUIKit
//
//  Created by Vincent on 04/03/2024.
//

import Foundation

struct Movie: Decodable, Equatable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    var posterURL: URL {
        URL(string: "https://image.tmdb.org/t/p/w400/\(posterPath)")!
    }
}

extension Movie {
    static let mock: Movie = Movie(
        id: 799876,
        title: "The Outfit",
        overview: "Leonard is an English tailor who used to craft suits on London’s world-famous Savile Row. After a personal tragedy, he’s ended up in Chicago, operating a small tailor shop in a rough part of town where he makes beautiful clothes for the only people around who can afford them: a family of vicious gangsters.",
        posterPath: "/lZa5EB6PVJBT5mxhgZS5ftqdAm6.jpg"
    )
}

struct MovieResponse: Decodable {
    let results: [Movie]
}

class MoviesService {
    func fetchMovies() async throws -> MovieResponse {
        let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=\(apiKey)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try jsonDecoder.decode(MovieResponse.self, from: data)
        return decoded
    }
}
