//
//  finalScreen.swift
//  lesson 6 projecc
//
//  Created by Balasaravanan Dhanwin Basil on 20/8/23.
 
//NOT THE FINAL SCREEN, JUST THE NO SCREEN

import SwiftUI

struct finalScreen: View {
    @Binding var bindedGourmet:Bool
    
    //Slider
    @Binding var jesusSliderValue:Double
    @Binding var ligmaJohnsonSliderValue:Double
    @Binding var mcBobbersonSliderValue:Double
    
    var body: some View {
        VStack(spacing:50){
            if bindedGourmet{
                
            }else{
                Text("Ummm akstually not voting is kinda illegal...").padding().accentColor(.black).background(Color.yellow
                    .cornerRadius(10))
                Text("As a citizen of the wonderful state of Oklahoma, you must vote. There are no exceptions.").accentColor(.red)
                Text("Hence, by not voting, you will now perish. The FBI is already tracking you as we speak.").accentColor(.red)
                Text("Goodbye, unworthy citizen of Oklahoma. Your fate is coming... Accept your fate.").padding().accentColor(.black).background(Color.orange
                    .cornerRadius(10))
            }
            }
        }
    }

struct finalScreen_Previews: PreviewProvider {
    static var previews: some View {
        finalScreen(bindedGourmet: .constant(false),jesusSliderValue: .constant(0.0),ligmaJohnsonSliderValue: .constant(0.0),mcBobbersonSliderValue: .constant(0.0))
    }
}

