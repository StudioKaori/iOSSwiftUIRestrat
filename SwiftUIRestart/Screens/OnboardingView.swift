//
//  OnboardingView.swift
//  SwiftUIRestart
//
//  Created by Kaori Persson on 2022-05-22.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: property
    // if the isOnboardingViewActive was found in app strage, this would be skipped.
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    // slide button width will be always the screen width - 80(40 padding for each)
    @State private var slideButtonWidth: Double = UIScreen.main.bounds.width - 80
    // this value will be constantly changed while the button is dragged.
    @State private var slideButtonOffset: CGFloat = 0
    
    private var circleButtonWidth: CGFloat = 80
    
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
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                } //: center
                
                Spacer()
                
                // MARK: - footer
                ZStack {
                    // 1. bg static
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    // 2. call to action static
                    
                    Text("Get started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    
                    // 3. capsule (dynamic width)
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            // buttonOffset will start from 0, so add 80
                            .frame(width: slideButtonOffset + circleButtonWidth)
                        
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
                        .frame(width: circleButtonWidth, height: circleButtonWidth, alignment: .center)
                        .offset(x: slideButtonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged{ gesture in
                                    // This is triggered each time the drag gesture happened.
                                    
                                    // dragging direction left to right
                                    // gesture.translation is equivalent to location.{x,y} - startLocation.{x,y}. = amount of dragging
                                    if gesture.translation.width > 0 && slideButtonOffset <= slideButtonWidth - circleButtonWidth {
                                        slideButtonOffset = gesture.translation.width
                                    }
                                }
                                .onEnded { _ in
                                    if slideButtonOffset > slideButtonWidth / 2 {
                                        // when the button is in the right than half, move to the home screen
                                        slideButtonOffset = slideButtonWidth - circleButtonWidth
                                        isOnboardingViewActive = false
                                    } else {
                                        // the button is in the left than the half, back to the default position
                                        slideButtonOffset = 0
                                    }
                                    
                                }
                        ) //: Gesture
                        
                        // To push the button to the left edge
                        Spacer()
                    } //: ZStack
                    
                    
                } //: footer
                .frame(width: slideButtonWidth, height: 80, alignment: .center)
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
