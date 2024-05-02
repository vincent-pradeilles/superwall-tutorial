//
//  MovieDetailsView.swift
//  SuperwallTutorial
//
//  Created by Vincent on 01/05/2024.
//

import SwiftUI

struct MovieDetailsView: View {
    
    let movie: Movie
    
    @StateObject var viewModel: MovieDetailsViewModel
    
    init(movie: Movie) {
        self.movie = movie
        _viewModel = StateObject(
            wrappedValue: MovieDetailsViewModel(
                movie: movie
            )
        )
    }
    
    var body: some View {
        List {
            Section {
                HStack {
                    AsyncImage(url: movie.posterURL) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 180)
                    } placeholder: {
                        ProgressView()
                            .frame(width: 120, height: 180)
                    }
                                        
                    Button(action: {
                        // Show a paywall
                    }, label: {
                        Label("Watch", systemImage: "play.rectangle.fill")
                            .font(.callout)
                            .foregroundStyle(.white)
                            .padding()
                            .background(.tint)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .frame(maxWidth: .infinity)
                    })
                    .buttonStyle(.plain)
                }
            }
            
            Section("Overview") {
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text(movie.overview)
                        }
                    }
                }
            }
            
            Section("Credits") {
                ForEach(viewModel.credits) { castMember in
                    VStack(alignment: .leading) {
                        Text(castMember.name)
                            .font(.headline)
                        Text(castMember.character)
                    }
                }
            }
        }
        .navigationTitle(movie.title)
        .task {
            await viewModel.fetchData()
        }
    }
}

#Preview {
    NavigationStack {
        MovieDetailsView(movie: .mock)
    }
}
