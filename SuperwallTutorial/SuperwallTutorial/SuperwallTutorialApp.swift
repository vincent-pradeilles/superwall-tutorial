//
//  SuperwallTutorialApp.swift
//  SuperwallTutorial
//
//  Created by Vincent on 01/05/2024.
//

import SwiftUI
import SuperwallKit

@main
struct SuperwallTutorialApp: App {
    
    init() {
        Superwall.configure(
            apiKey: "pk_db90e0f33e1ae65e76cdef8aca86c340d2bfdccd35f6cb39"
        )
    }
    
    @AppStorage("hasNeverSeenOnboarding") var hasNeverSeenOnboarding = true
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MoviesView()
                    .sheet(isPresented: $hasNeverSeenOnboarding, content: {
                        OnBoardingView()
                    })
            }
        }
    }
}
