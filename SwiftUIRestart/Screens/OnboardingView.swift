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
        ZStack {
            // fullscreen bg
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                // MARK: - header
                Spacer()
                
                VStack(spacing: 0) {
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    // for long text, wrap with 3 """
                    Text("""
                    It's not how much we give but
                    how much love we put into giving.
                    """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                } //: header
                // MARK: - center
                
                ZStack{
                    ZStack{
                        Circle()
                            .stroke(.white.opacity(0.2),lineWidth: 40)
                            .frame(width: 260, height: 260, alignment: .center)
                        
                        Circle()
                            .stroke(.white.opacity(0.2), lineWidth: 80)
                            .frame(width: 260, height: 260, alignment: .center)
                        
                    } //: zstack
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                } //: center
                
                Spacer()
                
                // MARK: - hooter
                ZStack {
                    // 1. bg static
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    // 2. call to action static
                    // 3. capsule (dynamic width)
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: 80)
                        
                        // To push the red circle to the left
                        Spacer()
                    }
                    // 4. circle (draggable)
                    
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                            
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        
                        // To push the button to the left edge
                        Spacer()
                    } //: Zstack
                    
                    
                } //: footer
                .frame(height: 80, alignment: .center)
                .padding()
                
            } //: VSTACK
        } //: ZSTACK
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
