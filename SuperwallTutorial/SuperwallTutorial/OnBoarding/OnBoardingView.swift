//
//  OnBoardingView.swift
//  SuperwallTutorial
//
//  Created by Vincent on 02/05/2024.
//

import SwiftUI
import SuperwallKit

struct OnBoardingView: View {
    
    @AppStorage("hasNeverSeenOnboarding") var hasNeverSeenOnboarding = true

    var body: some View {
        VStack {
            Text("How do you prefer to watch movies?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Button(action: {
                Superwall.shared.setUserAttributes(
                    ["watchPreference": "byMyself"]
                )
                hasNeverSeenOnboarding = false
            },
                   label: {
                Label("By myself", systemImage: "person.fill")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.tint)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            })
            
            Button(action: {
                Superwall.shared.setUserAttributes(
                    ["watchPreference": "withFamily"]
                )
                
                hasNeverSeenOnboarding = false
            }, label: {
                Label("With family", systemImage: "person.3.fill")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.tint)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                
            })
        }
        .padding()
    }
}

#Preview {
    OnBoardingView()
}
