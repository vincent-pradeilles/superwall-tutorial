//
//  MoviesView.swift
//  SuperwallTutorial
//
//  Created by Vincent on 01/05/2024.
//

import SwiftUI

struct MoviesView: View {
    
    @StateObject var viewModel = MoviesViewModel()
    
    var body: some View {
        List(viewModel.movies) { movie in
            NavigationLink {
                MovieDetailsView(movie: movie)
            } label: {
                HStack {
                    AsyncImage(url: movie.posterURL) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 160)
                    } placeholder: {
                        ProgressView()
                            .frame(width: 100, height: 160)
                    }

                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.headline)
                        
                        Text(movie.overview)
                            .font(.caption)
                            .lineLimit(5)
                    }
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Top Rated")
        .task {
            await viewModel.fetchData()
        }
    }
}

#Preview {
    NavigationStack {
        MoviesView()
    }
}
