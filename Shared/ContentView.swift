//
//  ContentView.swift
//  Shared
//
//  Created by stormshadow on 14/4/2564 BE.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCard:String = "13" + "S"
    @State private var botCard:String = "12" + "D"
    @State private var botScore:Int = 0
    @State private var playerScore:Int = 1
    @State private var playerCards:Int = 0
    @State private var botCards:Int = 0
    
    
    var body: some View {
        ZStack {
            Color.secondary
                .ignoresSafeArea()
            VStack(alignment: .center) {
                Spacer()
                Image("back_cards-7")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                    Image(botCard)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Spacer()

                }
                Spacer()
                Button(action: {
                    //Random Card
                    let playerRanCard = Int.random(in: 1...13)
                    let botRanCard = Int.random(in: 1...13)
//                    var cardType = ["C", "D", "H", "S"]
                    
                    botCards = botRanCard
                    playerCards = playerRanCard
                    
                    //Update Score
                    if(playerCards > botCards )
                    {
                        playerScore = playerScore + 1;
                    }
                    else if(botCards > playerCards)
                    {
                        botScore = botScore + 1
                    }
                    else{
                        botScore = botScore + 1
                        playerScore = playerScore + 1
                    }
                    
                    //Update Card
                        playerCard = String(playerRanCard) + "S"
                        botCard = String(botRanCard) + "D"
//                    playerCard = String(playerRanCard) + cardType.shuffle()
//                    botCard = String(botRanCard) + cardType.shuffle()
                    
                    
                    
                    
                }, label: {
                    Text("Deal")
                        .bold()
                        .padding(.all)
                        .background(Color.red)
                        .cornerRadius(10.0)
                })
                Spacer()
                HStack{
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack {
                        Text("Bot")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(botScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
