//
//  MovieDetailsService.swift
//  LearningUIKit
//
//  Created by Vincent on 04/03/2024.
//

import UIKit

enum ImageError: Error {
    case couldNotDecode
}

struct MovieCastMember: Identifiable, Equatable, Decodable {
    let id: Int
    let name: String
    let character: String
}

struct MovieCreditsResponse: Decodable {
    let cast: [MovieCastMember]
}

class MovieDetailsService {
    func fetchPoster(for movie: Movie) async throws -> UIImage {
        let (data, _) = try await URLSession.shared.data(from: movie.posterURL)
        
        guard let decoded = UIImage(data: data) else {
            throw ImageError.couldNotDecode
        }
        
        return decoded
    }

    func fetchCredits(for movie: Movie) async throws -> MovieCreditsResponse {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movie.id)/credits?api_key=\(apiKey)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try jsonDecoder.decode(MovieCreditsResponse.self, from: data)
        return decoded
    }
}
