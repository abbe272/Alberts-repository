//
//  ContentView.swift
//  RGB
//
//  Created by Albert Hansson on 2023-09-20.
//

import SwiftUI

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}


struct ContentView: View {
    
    
    func färgRGB(röd: Int, grön: Int, blå: Int) -> Color{
        
        return Color(UIColor(red: CGFloat(röd)/255.0, green: CGFloat(grön)/255.0, blue: CGFloat(blå)/255.0, alpha: 1))
    }
    
    
    @State private var röd = 0.0
    @State private var grön = 0.0
    @State private var blå = 0.0
    @State private var r = 0
    @State private var g = 0
    @State private var b = 0
    @State private var ändring = false
    @State private var färg:Color = Color(red: 0, green: 0, blue: 0)
    
    @State private var startaSyns = true
    @State private var likhetSyns = false
    @State private var nojdSyns = false
    
    @State private var proc:Double = 0.0
    
    let userDefaults = UserDefaults()
    @State public var data: [Double]
    
    var nivåer = ["Lätt", "Svårt", "Expert", "Duell"]
    @State private var mode = "Lätt"
    @State private var match: Bool = false
    
    init(){
        data = UserDefaults.standard.value(forKey: "spara") == nil ? [0.0,0.0,0.0,0.0,0.0,0.0] : UserDefaults.standard.value(forKey: "spara") as! [Double]
        
    }
    
    var body: some View {
        
        VStack{
            Picker("", selection: $mode) {
                
                ForEach(nivåer, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            .disabled(nojdSyns)
            .onChange(of: mode, perform: { (value) in
                if (mode == "Duell")
                {
                    match = true
                }
                else
                {
                    match = false
                }
                
            })
            
            ZStack{
                
                
                SwiftUIView()
                    .opacity(match ? 1:0)
                VStack {
                    
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text("Genomsnittligt träffsäkerhet:")
                                .bold()
                            Text((mode == "Lätt") ? String(format: "%.1f", data[0]) + (" %") : (mode == "Svårt") ? String(format: "%.1f", data[2]) + (" %") : String(format: "%.1f", data[4]) + (" %"))
                                .bold()
                                .padding(.leading, 20)
                            
                        }
                        .padding(.top, -60)
                        HStack{
                            Text("Antal spel:")
                                .bold()
                            Text((mode == "Lätt") ? String(format: "%i", (Int)(data[1])) : (mode == "Svårt") ? String(format: "%i", (Int)(data[3])) : String(format: "%i", (Int)(data[5])))
                                .bold()
                                .padding(.leading, 146 + 20)
                        }
                        .padding(.top, -45)
                    }
                    .padding(.top,-10)
                    
                    Text("\(Int(proc))" + " % likhet")
                        .font(.system(size: 30))
                        .bold()
                        .padding([.top, .bottom], 10)
                        .opacity(likhetSyns ? 1:0)
                    
                    HStack(spacing: (mode == "Svårt") ? 170:20){
                        ZStack{
                            Rectangle()
                                .fill(färg)
                                .frame(width: (mode != "Svårt") ? 150 : 40, height: (mode != "Svårt") ? 150 : 40)
                                .cornerRadius((mode == "Svårt") ? 13:40)
                        }
                        .padding(.leading, nojdSyns && (mode == "Expert") ? 100:0)
                        ZStack{
                            Rectangle()
                                .fill(färgRGB(röd: Int(röd), grön: Int(grön), blå: Int(blå)))
                                .frame(width: (mode != "Svårt") ? 150 : 40, height: (mode != "Svårt") ? 150 : 40)
                                .cornerRadius((mode == "Svårt") ? 13:40)
                                .opacity((mode != "Expert") || !nojdSyns ? 1:0)
                                .padding(.leading, nojdSyns && (mode == "Expert") ? -100:0)
                            VStack(spacing: 15){
                                Text("Röd: " + "\(Int(r))")
                                    .foregroundColor((mode == "Svårt") ? .black : .white)
                                    .bold()
                                Text("Grön: " + "\(Int(g))")
                                    .foregroundColor((mode == "Svårt") ? .black : .white)
                                    .bold()
                                Text("Blå: " + "\(Int(b))")
                                    .foregroundColor((mode == "Svårt") ? .black : .white)
                                    .bold()
                            }
                            .opacity(likhetSyns ? 1:0)
                            .padding(.leading, (mode == "Svårt") ? -145 : 0)
                        }
                        
                    }
                    .padding([.top, .bottom], (mode == "Svårt") ? 30:0)
                    
                    Button {
                        //data = userDefaults.value(forKey: "data") as! [String]
                        r = Int.random(in: 0...255)
                        g = Int.random(in: 0...255)
                        b = Int.random(in: 0...255)
                        nojdSyns = true
                        startaSyns = false
                        likhetSyns = false
                        färg = färgRGB(röd: r, grön: g, blå: b)
                        print(r, g, b)
                        
                    }label: {
                        Text("STARTA")
                            .bold()
                            .font(.system(size: 30.0))
                    }
                    .padding()
                    .foregroundColor(.green)
                    .clipShape(Capsule())
                    .opacity(startaSyns ? 1:0)
                    
                    VStack(spacing: 20){
                        HStack(spacing: 15){
                            Slider(
                                value: $röd,
                                in: 0...255,
                                step: 1
                            ) {
                                Text("Speed")
                            } onEditingChanged: { editing in
                                ändring = editing
                            }
                            .accentColor(Color.red)
                            .padding(.leading, 30)
                            Text("\(Int(röd))")
                                .foregroundColor(.black)
                                .frame(width: 40, height: 20, alignment: .leading)
                            
                        }
                        HStack(spacing: 15){
                            Slider(
                                value: $grön,
                                in: 0...255,
                                step: 1
                            ) {
                                Text("Speed")
                            } onEditingChanged: { editing in
                                ändring = editing
                            }
                            .accentColor(Color.green)
                            .padding(.leading, 30)
                            Text("\(Int(grön))")
                                .foregroundColor(.black)
                                .frame(width: 40, height: 20, alignment: .leading)
                            
                        }
                        HStack(spacing: 15){
                            Slider(
                                value: $blå,
                                in: 0...255,
                                step: 1
                            ) {
                                Text("Speed")
                            } onEditingChanged: { editing in
                                ändring = editing
                            }
                            .accentColor(Color.blue)
                            .padding(.leading, 30)
                            Text("\(Int(blå))")
                                .foregroundColor(.black)
                                .frame(width: 40, height: 20, alignment: .leading)
                            
                        }
                        
                    }
                    //.padding(.leading, 50)
                    Button {
                        startaSyns = true
                        nojdSyns = false
                        likhetSyns = true
                        let proc1:Double = abs((röd-Double(r)))/255.0
                        let proc2:Double = abs((grön-Double(g)))/255.0
                        let proc3:Double = abs((blå-Double(b)))/255.0
                        proc = 100 - (100.0/3.0)*(proc1+proc2+proc3)
                        print(proc1,proc2,proc3,proc)
                        if (mode == "Lätt")
                        {
                            data[1] += 1
                            data[0] = (data[0]*(data[1] - 1) + proc) / data[1]
                        }
                        else if (mode == "Svårt")
                        {
                            data[3] += 1
                            data[2] = (data[2]*(data[3] - 1) + proc) / data[3]
                        }
                        else
                        {
                            data[5] += 1
                            data[4] = (data[4]*(data[5] - 1) + proc) / data[5]
                        }
                        userDefaults.setValue(data, forKey: "spara")
                        
                    }label: {
                        Text("NÖJD").bold()
                    }
                    .padding()
                    .foregroundColor((mode == "Expert") ? Color.black : färgRGB(röd: Int(röd), grön: Int(grön), blå: Int(blå)))
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 5)
                    )
                    .padding(.top, 40)
                    .opacity(nojdSyns ? 1:0)
                    
                }
                .opacity(match ? 0:1)
            }
        }
        .padding(.top, 100)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




