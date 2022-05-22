//
//  OnboardingView.swift
//  SwiftUIRestart
//
//  Created by Kaori Persson on 2022-05-22.
//

import SwiftUI

struct OnboardingView: View {
    
    // if the isOnboardingViewActive was found in app strage, this would be skipped.
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Onboarding")
                .font(.largeTitle)
            
            Button(action: {
                isOnboardingViewActive = false
            }) {
                Text("Start")
            }
        } //: VSTACK
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
