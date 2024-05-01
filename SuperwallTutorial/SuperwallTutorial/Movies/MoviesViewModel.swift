//
//  MoviesViewModel.swift
//  LearningUIKit
//
//  Created by Vincent on 04/03/2024.
//

import Foundation

@MainActor
class MoviesViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    
    private let service = MoviesService()
    
    func fetchData() async {
        do {
            movies = try await service.fetchMovies().results
        } catch {
            print(error.localizedDescription)
        }
    }
}
