//
//  SwiftUIView.swift
//  RGB
//
//  Created by Albert Hansson on 2023-09-21.
//

import SwiftUI



struct SwiftUIView: View {
    func färgRGB(röd: Int, grön: Int, blå: Int) -> Color{
        
        return Color(UIColor(red: CGFloat(röd)/255.0, green: CGFloat(grön)/255.0, blue: CGFloat(blå)/255.0, alpha: 1))
    }
    @State var tvm = "hej"
    var nivåer = ["hej", "Svårt", "Expert"]
    @State private var röd1 = 0.0
    @State private var grön1 = 0.0
    @State private var blå1 = 0.0
    @State private var röd2 = 0.0
    @State private var grön2 = 0.0
    @State private var blå2 = 0.0
    @State private var r = 0
    @State private var g = 0
    @State private var b = 0
    @State private var ändring = false
    @State private var start: Bool = true
    @State private var färg: Color = Color(red: 0, green: 0, blue: 0)
    @State private var vinn1: Color = Color.black
    @State private var vinn2: Color = Color.black

        var body: some View {
            
            VStack{
                VStack{
                    HStack(spacing: 15){
                        Slider(
                            value: $röd1,
                            in: 0...255,
                            step: 1
                        ) {
                            Text("Speed")
                        } onEditingChanged: { editing in
                            ändring = editing
                        }
                        .accentColor(Color.red)
                        .padding(.leading, 30)
                        Text("\(Int(röd1))")
                            .foregroundColor(.black)
                            .frame(width: 40, height: 20, alignment: .leading)
                            .padding()
                    }
                    HStack(spacing: 15){
                        Slider(
                            value: $grön1,
                            in: 0...255,
                            step: 1
                        ) {
                            Text("Speed")
                        } onEditingChanged: { editing in
                            ändring = editing
                        }
                        .accentColor(Color.green)
                        .padding(.leading, 30)
                        Text("\(Int(grön1))")
                            .foregroundColor(.black)
                            .frame(width: 40, height: 20, alignment: .leading)
                            .padding()
                    }
                    HStack(spacing: 15){
                        Slider(
                            value: $blå1,
                            in: 0...255,
                            step: 1
                        ) {
                            Text("Speed")
                        } onEditingChanged: { editing in
                            ändring = editing
                        }
                        .accentColor(Color.blue)
                        .padding(.leading, 30)
                        Text("\(Int(blå1))")
                            .foregroundColor(.black)
                            .frame(width: 40, height: 20, alignment: .leading)
                            .padding()
                    }
                }
                .rotationEffect(.degrees(180.0))
                VStack{
                    Rectangle()
                        .fill(färgRGB(röd: Int(röd1), grön: Int(grön1), blå: Int(blå1)))
                        .frame(width: 80, height: 80)
                        .cornerRadius(27)
                        .overlay(
                            RoundedRectangle(cornerRadius: 27)
                                .stroke(!start ? färgRGB(röd: Int(röd1), grön: Int(grön1), blå: Int(blå1)) : vinn1, lineWidth: 5)
                        )
                        .padding(.bottom, -41)
                        .opacity(start ? 1:0)
                    ZStack{
                        Rectangle()
                            .fill(färg)
                            .frame(width: 150, height: 150)
                            .cornerRadius(40)
                            
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color.black, lineWidth: 5)
                            )
                            .padding([.top, .bottom], 20)
                        Button(){
                            
                            if (start)
                            {
                                r = Int.random(in: 0...255)
                                g = Int.random(in: 0...255)
                                b = Int.random(in: 0...255)
                                
                                färg = färgRGB(röd: r, grön: g, blå: b)
                                start = !start
                            }
                            else
                            {
                                let proc11:Double = abs((röd1-Double(r)))/255.0
                                let proc21:Double = abs((grön1-Double(g)))/255.0
                                let proc31:Double = abs((blå1-Double(b)))/255.0
                                let proc1 = 100 - (100.0/3.0)*(proc11+proc21+proc31)
                                
                                let proc12:Double = abs((röd2-Double(r)))/255.0
                                let proc22:Double = abs((grön2-Double(g)))/255.0
                                let proc32:Double = abs((blå2-Double(b)))/255.0
                                let proc2 = 100 - (100.0/3.0)*(proc12+proc22+proc32)
                                
                                if (proc1 > proc2){
                                    vinn1 = Color.green
                                    vinn2 = Color.red
                                }
                                else if (proc1 < proc2){
                                    vinn1 = Color.red
                                    vinn2 = Color.green
                                }
                                else{
                                    vinn1 = Color.green
                                    vinn2 = Color.green
                                }
                                
                                start = !start
                            }
                        }
                        //.buttonStyle(PlainButtonStyle())
                        
                        label: {
                            Text("      ")
                                .font(.system(size: 100))
                                .foregroundColor(färg)
                        }
                        
                    }
                    
                    Rectangle()
                        .fill(färgRGB(röd: Int(röd2), grön: Int(grön2), blå: Int(blå2)))
                        .frame(width: 80, height: 80)
                        .cornerRadius(27)
                        .overlay(
                            RoundedRectangle(cornerRadius: 27)
                                .stroke(!start ? färgRGB(röd: Int(röd2), grön: Int(grön2), blå: Int(blå2)) : vinn2, lineWidth: 5)
                        )
                        .padding(.top, -64)
                        .opacity(start ? 1:0)
                }
                
                HStack(spacing: 15){
                    Slider(
                        value: $röd2,
                        in: 0...255,
                        step: 1
                    ) {
                        Text("Speed")
                    } onEditingChanged: { editing in
                        ändring = editing
                    }
                    .accentColor(Color.red)
                    .padding(.leading, 30)
                    Text("\(Int(röd2))")
                        .foregroundColor(.black)
                        .frame(width: 40, height: 20, alignment: .leading)
                        .padding()
                }
                HStack(spacing: 15){
                    Slider(
                        value: $grön2,
                        in: 0...255,
                        step: 1
                    ) {
                        Text("Speed")
                    } onEditingChanged: { editing in
                        ändring = editing
                    }
                    .accentColor(Color.green)
                    .padding(.leading, 30)
                    Text("\(Int(grön2))")
                        .foregroundColor(.black)
                        .frame(width: 40, height: 20, alignment: .leading)
                        .padding()
                }
                HStack(spacing: 15){
                    Slider(
                        value: $blå2,
                        in: 0...255,
                        step: 1
                    ) {
                        Text("Speed")
                    } onEditingChanged: { editing in
                        ändring = editing
                    }
                    .accentColor(Color.blue)
                    .padding(.leading, 30)
                    Text("\(Int(blå2))")
                        .foregroundColor(.black)
                        .frame(width: 40, height: 20, alignment: .leading)
                        .padding()
                }
            }
        }
        
}


#Preview {
    SwiftUIView()
}
