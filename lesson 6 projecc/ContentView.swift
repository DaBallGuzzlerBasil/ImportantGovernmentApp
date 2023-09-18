//
//  ContentView.swift
//  Anime Girl Simulator
//
//  Created by Balasaravanan Dhanwin Basil on 14/8/23.
//

import SwiftUI

struct ContentView: View {
    @State var backgroundColourText="Pink"
    @State var backgroundColour:Color=Color.pink
    @State var passcode=""
    @State var alertShown=false
    
    @State var sheetShown = false
    @State var votingSheetShown=false
    
    //Option 1
    @State var cheeseAmount=0.0
    @State var cheeseSliderValue=0.0
    
    //Option 2
    @State var milkAmount=0.0
    @State var milkSliderValue=0.0
    
    //Option 3
    @State var tacoAmount=0.0
    @State var tacoSliderValue=0.0
    
    //Others
    @State var Gourmet=false
    
    //For the Voting
    @State var selectedOption=""
    var pickerOptions=["Yes", "No"]
    
    //Voting Variables
    @State var jesusChristVotes=0
    @State var ligmaJohnsonVotes=0
    @State var mcBobbersonVotes=0
    
    var body: some View {
        ZStack{
            backgroundColour .edgesIgnoringSafeArea(.all)
            NavigationStack{
                VStack(spacing:20){
                    Text("Candidate Erections").font(.title) .bold().accentColor(.red).padding()
                    Text("The Official Government App!!! (trust)").accentColor(.green).font(.title).padding()
                    List{
                        NavigationLink {
                            optionOne(count: $cheeseAmount, sliderValue: $cheeseSliderValue, bindedGourmet: $Gourmet)
                        } label: {
                            VStack(spacing:15){
                                HStack(spacing:30){
                                    VStack{
                                        Text("Jesus Christ").accentColor(.purple)
                                            .bold()
                                        Text("Biden Blast Ability: \(cheeseAmount)")
                                    }
                                    VStack{
                                        Text("Worthiness Meter:")
                                        Text("\(cheeseAmount*100)%")
                                    }
                                }
                            }
                        }
                        NavigationLink{
                            optionTwo(count: $milkAmount, sliderValue: $milkSliderValue, bindedGourmet: $Gourmet)
                        }label:{
                            VStack(spacing:15){
                                HStack(spacing:30){
                                    VStack{
                                        Text("Ligma Johnson").accentColor(.purple)
                                            .bold()
                                        Text("Biden Blast Ability: \(milkAmount)")
                                    }
                                    VStack{
                                        Text("Worthiness Meter:")
                                        Text("\(milkAmount*100)%")
                                    }
                                }
                            }
                        }
                        NavigationLink{
                            optionThree(count: $tacoAmount, sliderValue: $tacoSliderValue, bindedGourmet: $Gourmet)
                        }label:{
                            VStack(spacing:15){
                                HStack(spacing:30){
                                    VStack{
                                        Text("McBobberson").accentColor(.purple)
                                            .bold()
                                        Text("Biden Blast Ability: \(tacoAmount)")
                                    }
                                    VStack{
                                        Text("Worthiness Meter:")
                                        Text("\(tacoAmount*100)%")
                                    }
                                }
                            }
                        }
                    }
                    if Gourmet{
                        VStack (spacing:0){
                            Text("Gain access to the results! (123)").padding().bold()
                            TextField("Enter the 3-digit pin here (123)", text:$passcode).padding()
                            Button(){
                                if passcode=="123"{
                                    print("Answer is correct")
                                    alertShown=true
                                }
                                }label:{
                                    VStack{
                                        Text("You entered '\(passcode)'.").accentColor(.red)
                                        Text("Submit?").accentColor(.green).bold()
                                    }
                                }.alert(Text("Are you sure? Accessing this information while not being a government official is highly illegal. Are you sure you want to proceed?"), isPresented: $alertShown){
                                    Button(role:.destructive){
                                       votingSheetShown=true
                                    }label: {
                                        Text("Proceed.")
                                    }
                                }
                            }
                        }else{
                            VStack{
                                Text("Vote?")
                                Picker("pick an option", selection: $selectedOption){
                                    ForEach(pickerOptions,id: \.self){
                                        option in Text(option)
                                    }
                                }.pickerStyle(.segmented)
                                Button{
                                    if selectedOption == "Yes"{
                                        votingSheetShown=true
                                    }else if selectedOption == "No"{
                                        sheetShown=true
                                    }
                                }label: {
                                    Text("Confirm").padding()
                                        .accentColor(.white).background(Color.green
                                            .cornerRadius(10))
                                }
                            }
                        }
                        
                        VStack(){
                            Text("Customisation").underline()
                            Toggle ("Government Priveleges",isOn: $Gourmet)
                                .padding (.horizontal)
                            
                            Button{
                                var q=Int.random(in: 1..<7)
                                if q==1{
                                    backgroundColour=Color.red
                                    backgroundColourText="Red"
                                    q=0
                                }else if q==2{
                                    backgroundColour=Color.cyan
                                    backgroundColourText="Cyan"
                                    q=0
                                }else if q==3{
                                    backgroundColour=Color.green
                                    backgroundColourText="Green"
                                    q=0
                                }else if q==4{
                                    backgroundColour=Color.yellow
                                    backgroundColourText="Yellow"
                                    q=0
                                }else if q==5{
                                    backgroundColour=Color.purple
                                    backgroundColourText="Purple"
                                    q=0
                                }else if q==6{
                                    backgroundColour=Color.black
                                    backgroundColourText="Black"
                                }
                            }label:{
                                VStack (spacing:5){
                                    Text("Your Background Colour is: \(backgroundColourText)")
                                        .padding()
                                        .accentColor(.white).background(backgroundColour
                                            .cornerRadius(10))
                                }
                                .sheet(isPresented: $sheetShown) {
                                    finalScreen(bindedGourmet: $Gourmet, jesusSliderValue: $cheeseSliderValue,ligmaJohnsonSliderValue: $milkSliderValue,
                                                mcBobbersonSliderValue: $tacoSliderValue)
                                }
                                .sheet(isPresented: $votingSheetShown){
                                    votingScreen(bindedGourmet: $Gourmet, jesusChristVotes: $jesusChristVotes, ligmaJohnsonVotes: $ligmaJohnsonVotes, mcBobbersonVotes: $mcBobbersonVotes, jesusSliderValue: $cheeseSliderValue, ligmaJohnsonSliderValue: $milkSliderValue, mcBobbersonSliderValue: $tacoSliderValue)
                                }
                            }
                        }.padding()
                    }
                }.padding()
            }
        }
    }
        struct ContentView_Preview: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }

