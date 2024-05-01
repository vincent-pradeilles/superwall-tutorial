//
//  MovieDetailsViewModel.swift
//  LearningUIKit
//
//  Created by Vincent on 04/03/2024.
//

import Foundation
import UIKit

@MainActor
class MovieDetailsViewModel: ObservableObject {

    let movie: Movie

    @Published var poster: UIImage? = nil
    @Published var credits: [MovieCastMember] = []

    private let service = MovieDetailsService()
    
    init(movie: Movie) {
        self.movie = movie
    }

    func fetchData() async {
        do {
            async let poster = try service.fetchPoster(for: movie)
            async let credits = try service.fetchCredits(for: movie).cast
            
            self.poster = try await poster
            self.credits = try await credits
        } catch {
            print(error.localizedDescription)
        }
    }
}
