//
//  PopTipDemoView.swift
//  PopTipDemoSwiftUI
//
//  Created by Julio Collado Perez on 11/23/23.
//

import SwiftUI

struct PopTipDemoView: View {
    
    @State var isInfoPopTipShown: Bool = false
    @State var isTextPopTipShown: Bool = false
    
    var body: some View {
        VStack {
            Button {
                isInfoPopTipShown.toggle()
            } label: {
                iconView
                    .popover(isPresented: self.$isInfoPopTipShown,
                             attachmentAnchor: .point(.top),
                             arrowEdge: .top,
                             content: {
                        VStack {
                            Text("Coder get your stuff and")
                            Text("let's have fun!!")
                        }
                        .multilineTextAlignment(.center)
                        .lineLimit(0)
                        .foregroundStyle(.black)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .padding()
                        .presentationCompactAdaptation(.none)
                    })
            }
            
            Spacer()
                .frame(height: 200)
            
            Button {
                isTextPopTipShown.toggle()
            } label: {
                textView
                    .popover(isPresented: self.$isTextPopTipShown,
                             attachmentAnchor: .point(.topTrailing),
                             arrowEdge: .top,
                             content: {
                        Text("It works as expected")
                            .foregroundStyle(.black)
                            .font(.system(size: 20, weight: .regular, design: .rounded))
                            .padding()
                            .presentationCompactAdaptation(.none)
                    })
                
            }
            
        }
        .padding()
    }
    
    private var iconView: some View {
        Image(systemName: "info.circle.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 24, height: 24)
            .foregroundStyle(.purple)
    }
    
    private var textView: some View {
        Text("Click here!")
            .font(.system(size: 24, weight: .bold, design: .rounded))
            .foregroundStyle(.red)
    }
}

#Preview {
    PopTipDemoView()
}
