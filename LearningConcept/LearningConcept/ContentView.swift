//
//  ContentView.swift
//  LearningConcept
//
//  Created by Ewanfo Lucky Peter on 27/06/2022.
//

import SwiftUI


//PRACTICING CUSTOM BINDING
struct CustomBindingView: View{
    
    @State private var agreedToTerms = false
    @State private var agreedToPrivacyPolicy = false
    @State private var agreedToEmails = false
    
    var body: some View{
        let agreedToAll = Binding<Bool>(
            get: {
                agreedToTerms && agreedToPrivacyPolicy && agreedToEmails
            },
            set: {
                value in
                agreedToTerms = value
                agreedToPrivacyPolicy = value
                agreedToEmails = value
            }
        )

        return VStack {
            Toggle("Agree to terms", isOn: $agreedToTerms)
            Toggle("Agree to privacy policy", isOn: $agreedToPrivacyPolicy)
            Toggle("Agree to receive shipping emails", isOn: $agreedToEmails)
            Toggle("Agree to all", isOn: agreedToAll)
            Image(systemName: "")
        }
    }
}


struct Title: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct Watermark: ViewModifier{
    
    var title: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: Alignment.bottomTrailing){
            content
            Text(title)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}
extension View{
    func watermark(qui title: String) -> some View{
        modifier(Watermark(title: title))
    }
}

extension View{
    func titleStyle() -> some View{
        modifier(Title())
    }
}

struct CapsuleText: View{
    var text: String
    
    var body: some View{
        Text(text)
            .titleStyle()
    }
}

struct ContentView: View {
    var body: some View {
        Color.blue
            .frame(width: 300, height: 300)
            .watermark(qui: "Hello")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CustomBindingView()
    }
}
