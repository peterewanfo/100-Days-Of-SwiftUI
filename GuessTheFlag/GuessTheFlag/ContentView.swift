//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ewanfo Lucky Peter on 22/06/2022.
//

import SwiftUI

struct FlagImage: ViewModifier{
    
    var imageName: String
    
    func body(content: Content) -> some View {
        Image(imageName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

extension View{
    func flagImage(imageName name: String) -> some View{
        modifier(FlagImage(imageName: name))
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var selectedCountry = 0
    @State private var score = 0
    @State private var gameTrialCount = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack{
            
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack{
                
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                Spacer()
                
                VStack(spacing:30){
                    VStack{
                        Text("Tap the Flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3){ number in
                        Button{
                            gameTrialCount += 1
                            
                            flagTapped(number, isLastTrial: gameTrialCount == 8)
                        } label: {
                            flagImage(imageName: countries[number])
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
                
            }
            .padding()
            
        }
        .alert(scoreTitle, isPresented: $showingScore){
            gameTrialCount < 8 ?
                Button( "Continue", action: askQuestion)
                :
                Button( "Reset", action: resetGame)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int, isLastTrial:Bool){
        
        selectedCountry = number
        if number == correctAnswer{
            scoreTitle = isLastTrial ? "Last Trial: Correct" : "Correct"
            score += 1
            
        }else{
            let errorExplanation = "That's the flag of \(countries[selectedCountry])"
            scoreTitle =  isLastTrial ? "Last Trial: Wrong, \(errorExplanation)" :"Wrong! \(errorExplanation)"
            score -= 1
        }
        showingScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        selectedCountry = 0
        score = 0
        gameTrialCount = 0
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
