//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Ewanfo Lucky Peter on 28/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    let gameMoves = ["Rock", "Paper", "Scissors"]
    let winningMoves = ["Paper", "Scissors", "Rock"]
    let winningReasons = ["can cover", "can cut", "crushes"]
    @State var randomMove = Int.random(in: 0..<3)
    @State var appChoice = Bool.random() //WIN - TRUE or LOSE - FALSE
    @State var moveReport = false
    @State var currentScore = 0
    @State var clickedOption = ""
    @State var clickedIndex : Int?
    @State var errorOccured = false
    
    
    var body: some View {
        
        ZStack{
            
            Color("Background")
                .ignoresSafeArea()
            
            
            VStack{
                
                VStack(spacing: 0){
                    
                    Text("Let's Play")
                        .foregroundColor(.black)
                        .frame(width: 150, height: 40)
                        .background(RoundCorners(tl: 20, tr: 20, br: 0, bl: 0).fill(.white) )
                    HStack{
                        VStack(alignment: .leading){
                            Text("ROCK")
                                .titleTextModifier()
                            Text("PAPER")
                                .titleTextModifier()
                            Text("SCISSORS")
                                .titleTextModifier()
                        }
                        Spacer()
                        VStack{
                            Text("SCORE")
                                .font(.title3.weight(.bold))
                                .foregroundColor(.blue)
                            //                        Spacer()
                            Text("\(currentScore)")
                                .font(.largeTitle.weight(.bold))
                        }
                        .padding([.leading, .trailing], 20)
                        .padding([.top, .bottom], 8)
                        .background(RoundCorners(tl: 10, tr: 10, br: 10, bl: 10).fill(.white))
                        
                    }
                    .padding([.leading], 30)
                    .padding([.top, .bottom], 20)
                    .padding([.trailing], 20)
                    .frame(height: 100, alignment: .leading)
                    .background(RoundCorners(tl: 10, tr: 10, br: 10, bl: 10).stroke(.white, style: StrokeStyle(lineWidth: 1.2)) )
                    
                    
                    Spacer()
                    Spacer()
                    
                    VStack{
                        HStack(spacing: 40){
                            Text("Computer")
                                .titleTextModifier()
                                .frame(width: 150, height: 100)
                                .fixedSize(horizontal: true, vertical: false)
                            VStack{
                                Image("\(gameMoves[randomMove].lowercased())")
                                    .resizable()
                                    .aspectRatio(contentMode:.fit)
                                    .padding(10)
                                    .frame(width: 100, height: 100)
        //                            .background(.white)
                                    .background(Circle().stroke(.white, style: StrokeStyle(dash: [10, 3]) ))
                                
                                Text("\(appChoice ? "WIN" : "LOOSE" )")
                                    .foregroundColor(appChoice ? .green : .red)
                                    .titleTextModifier()
                            }
                            
                        }
                        Text("VS")
                            .titleTextModifier()
                            .padding([.bottom, .top], 30)
                        HStack(spacing: 40){
                            Text("Player (You)")
                                .titleTextModifier()
                                .frame(width: 150, height: 100)
                                .fixedSize(horizontal: true, vertical: false)
//                                .padding([.bottom], 30)
                            
                            VStack{
                                clickedOption == "" ?
                                AnyView(Text("?").padding(10)
                                            .foregroundColor(.white)
                                            .font(.title2.weight(.bold))
                                            .frame(width: 100, height: 100)
                                            .background(Circle().stroke(.white, style: StrokeStyle(dash: [10, 3]) )))
                                
                                : AnyView(Image(clickedOption.lowercased())
                                            .resizable()
                                            .aspectRatio(contentMode:.fit)
                                            .padding(10)
                                            .frame(width: 100, height: 100)
                                            .background(Circle().stroke(.white, style: StrokeStyle(dash: [10, 3]) )))
                                
                                Text("\( clickedOption != "" ? moveReport ? "CORRECT" : "FAILED" : "waiting.." )")
                                    .foregroundColor(clickedOption != "" ?moveReport ? .green : .red : .yellow)
                                    .titleTextModifier()
                                
                                
                            }
                            
                            
                        }
                    }
                    
                    
                    Spacer()
                    
                }
                .padding(40)
                .frame(alignment: .top)
                
                Spacer()
                GeometryReader{ reader in
                    VStack(alignment: .center, spacing: 0){
                        
                        HStack{
                            VStack{
                                Text(clickedIndex != nil ? moveReport ? "You Won" : "Computer Won" : "Computer")
                                    .foregroundColor(.white)
                                    .font(.title2.bold())
                                Text( clickedIndex != nil ? "\(winningMoves[clickedIndex!])  \(winningReasons[clickedIndex!]) \(gameMoves[clickedIndex!])" : "waiting")
                                    .foregroundColor(.white)
                            }
                            .padding(.trailing, 20)
                            .frame(width: 250)
                            
                            Text("Continue")
                                .frame(width: 90, height: 40)
                                .background(RoundCorners(tl: 10, tr: 10, br: 10, bl: 10).fill(.white))
                                .onTapGesture {
                                    continuePlaying()
                                }
                        }
                        .frame(width: reader.size.width, height: 55)
                        .background(Color("Secondary"))
                        
//
                        VStack(spacing: 0){
                            
                            HStack(spacing: 40){
                                Image("rock")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 60)
                                    .padding(10)
                                    .background(Circle().fill(.white))
                                    .onTapGesture {
                                        scoreMove("Rock")
                                    }
                                
                                Image("paper")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 60)
                                    .padding(10)
                                    .background(Circle().fill(.white))
                                    .onTapGesture {
                                        scoreMove("Paper")
                                    }
                                Image("scissors")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 60)
                                    .padding(10)
                                    .background(Circle().fill(.white))
                                    .onTapGesture {
                                        scoreMove("Scissors")
                                    }
                            }
                            .frame(width: reader.size.width, height: 120)
                            .background(Color("Background")
                                            .opacity(0.8))
                            
                            Text("Choose your Weapon")
                                .foregroundStyle(.white)
                                .titleTextModifier()
                                .padding(10)
                            
                        }
                        
                    }
                    
                }
                .frame(height: 200)
                .background(Color("Sedondary") )
                
            }
            
        }
        .alert("Error !!!", isPresented: $errorOccured){
            
            Button( "Continue", action: continuee )
            
        } message: {
            Text("1. You can't use thesame weapon as the computer\n2. Click continue to proceed with the game")
        }
        
    }
    
    func continuee(){
        
    }
    
    func scoreMove(_ selectedMove: String){
        
        if clickedOption == "" &&  gameMoves[randomMove] != selectedMove{
            
            clickedOption = selectedMove
            clickedIndex = gameMoves.firstIndex(of: selectedMove)
            
            let didUserWin : Bool = winningMoves[randomMove] == selectedMove
            
            if appChoice{
                print("App choice -- true")
                if didUserWin {
                    currentScore += 1
                    moveReport = true
                }else{
                    currentScore -= 1
                    moveReport = false
                }
            }else if appChoice == false{
                print("App choice -- false")
                if didUserWin {
                    currentScore -= 1
                    moveReport = false
                }else{
                    currentScore += 1
                    moveReport = true
                }
            }
            
        }else{
            errorOccured = true
        }
        
        
    }
    
    func continuePlaying(){
        
        clickedOption = ""
        clickedIndex = nil
        let previousRandomMove = randomMove
        let previousAppChoice = appChoice
        
        while randomMove == previousRandomMove {
            //RESET APP CHOICES
            randomMove = Int.random(in: 0..<gameMoves.count)
        }
        
        while appChoice == previousAppChoice {
            //RESET APP CHOICES
            appChoice = Bool.random()
        }
        
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            ContentView()
        }
    }
}
