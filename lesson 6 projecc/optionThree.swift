//
//  optionThree.swift
//  lesson 6 projecc
//
//  Created by Balasaravanan Dhanwin Basil on 20/8/23.
//

import SwiftUI

struct optionThree: View {
    @Binding var count: Double
    @State var backgroundColour:Color=Color.yellow
    
    @State var bidenblast: String="Ability to use Biden Blast:"
    
    //Gourmet Mode
    @Binding var sliderValue:Double
    
    @Binding var bindedGourmet: Bool
    
    var body: some View {
        VStack {
            Text("\(bidenblast) \(count)%")
                .font(.title)
            
            HStack {
                Button(action: {
                    self.count -= 0.1
                    bidenblast="Ability to use Biden Blast:"
                }) {
                    Image(systemName: "minus.circle")
                        .font(.largeTitle)
                }
                
                Spacer()
                
                Button(action: {
                    if count <= 4.9 {
                        self.count += 0.1
                    }else{
                        bidenblast="IMPOSSIBLE. BIDEN BLAST POWER CANNOT GO OVER 5%, ERROR"
                        count=5.0
                    }
                }) {
                    Image(systemName: "plus.circle")
                        .font(.largeTitle)
                }
            }.padding().padding()
            
            VStack{
                Text("Details About Candidate").bold().font(.title)
                Text("Name -- mcBobberson")
                Text("Full Name -- Bobberson McBob McBobbersonny McRoberson")
                Text("")
                Text("Age -- ∞")
                Text("Speaking Ability -- ∞%")
                Text("mcBobberson's silky smooth skin dominates all.")
                if bindedGourmet{
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("Government-only information:").bold().accentColor(.red)
                    Text("Founder of McBobnalds")
                    Text("Destroyer of all monkey-like")
                    Text("IP address -- 68.2312")
                    Text("Number of Times arrested -- ∞")
                }
            }
        }
        VStack{
            Spacer()
            if bindedGourmet{
                VStack(spacing:10){
                    Text("You have turned on Government Priveleges!").bold().accentColor(.green).underline()
                    Text("How much do you want to rig this candidate's chance of winning?").bold().accentColor(.green)
                    
                    Slider(value:$sliderValue)
                    Text("You have rigged this person's chance of winning by \(sliderValue * 100)%")
                }
            }else{
                
            }
        }
    }
}

struct optionThree_Previews: PreviewProvider {
    static var previews: some View {
        optionThree(count:.constant(1),sliderValue:.constant(0.0),bindedGourmet: .constant(false))
    }
}
