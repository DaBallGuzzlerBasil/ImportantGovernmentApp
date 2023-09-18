//
//  votingScreen.swift
//  lesson 6 projecc
//
//  Created by Balasaravanan Dhanwin Basil on 12/9/23.
//

import SwiftUI

struct votingScreen: View {
    
    //Voting Screen
    @Binding var bindedGourmet:Bool
    
    @Binding var jesusChristVotes:Int
    @Binding var ligmaJohnsonVotes:Int
    @Binding var mcBobbersonVotes:Int
    
    //Government Screen
    //Rigged
    @State var jesusChristFinalised=0
    @State var ligmaJohnsonFinsalised=0
    @State var mcBobbersonFinalised=0
    
    //Slider Values
    @Binding var jesusSliderValue:Double
    @Binding var ligmaJohnsonSliderValue:Double
    @Binding var mcBobbersonSliderValue:Double
    
    @State var winner=""
    @State var winnerVotes=0
    
    var body: some View {
        if bindedGourmet{
            VStack{
                Text("The Votes!!!").font(.title).bold().accentColor(.green)
                Text("")
                Text("")
                Text("The Total Votes were \(jesusChristVotes+ligmaJohnsonVotes+mcBobbersonVotes)")
                if jesusSliderValue==0 {
                    Text("Candidate Number 1, Jesus Christ has \(jesusChristVotes) votes").accentColor(.black)
                }else{
                    Text("Candidate Number 1, Jesus Christ has \(jesusChristVotes * Int(round((jesusSliderValue*100)))+jesusChristVotes)").accentColor(.black)
                }
                
                if ligmaJohnsonSliderValue==0 {
                    Text("Candidate Number 2, Ligma Johnson has \(ligmaJohnsonVotes)").accentColor(.black)
                }else{
                    Text("Candidate Number 2, Ligma Johnson has \(ligmaJohnsonVotes+mcBobbersonVotes * Int(round((ligmaJohnsonSliderValue*100)))+ligmaJohnsonVotes)").accentColor(.black)
                }
                
                if mcBobbersonSliderValue==0 {
                    Text("Candidate Number 3, mcBobberson has \(mcBobbersonVotes)").accentColor(.black)
                }else{
                    Text("Candidate Number 3, mcBobberson has \(mcBobbersonVotes * Int(round((mcBobbersonSliderValue*100)))+mcBobbersonVotes)").accentColor(.black)
                }
                Text("")
                Text("")
                Text("The winner is the one with the highest votes btw")
            }
        }else{
            Text("Who u gonna vote for, huh? Select it NOW!").bold().font(.title).accentColor(.blue)
            Button{
                jesusChristVotes=jesusChristVotes+1
                print(jesusChristVotes)
            }label:{
                Text("Jesus Christ").padding()
                    .accentColor(.black).background(Color.yellow
                        .cornerRadius(10))
            }
            
            Text("")
            Text("")
            
            Button{
                ligmaJohnsonVotes+=1
            }label: {
                Text("Ligma Johnson").padding()
                    .accentColor(.black).background(Color.orange
                        .cornerRadius(10))
            }
            
            Text("")
            Text("")
            
            Button{
                mcBobbersonVotes+=1
            }label: {
                Text("mcBobberson").padding()
                    .accentColor(.black).background(Color.green
                        .cornerRadius(10))
            }
            Spacer()
            Text("Total Votes: \(jesusChristVotes+ligmaJohnsonVotes+mcBobbersonVotes)").accentColor(.black)
        }
    }
}

struct votingScreen_Previews: PreviewProvider {
    static var previews: some View {
        votingScreen(bindedGourmet: .constant(false), jesusChristVotes: .constant(0), ligmaJohnsonVotes: .constant(0), mcBobbersonVotes: .constant(0), jesusSliderValue: .constant(0.0), ligmaJohnsonSliderValue: .constant(0.0), mcBobbersonSliderValue: .constant(0.0))
    }
}
