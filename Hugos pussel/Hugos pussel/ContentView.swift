//
//  ContentView.swift
//  Hugos pussel
//
//  Created by Albert Hansson on 2022-04-17.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var storlekRuta:CGFloat = 50
    @State private var krökningsradieRuta:CGFloat = 25
    @State private var storlekRutaLiten:CGFloat = 20
    @State private var krökningsradieRutaLiten:CGFloat = 10
    @State private var luftRader:CGFloat = 15
    @State private var luftKolonner:CGFloat = 4
    @State private var göm = true
    @State var spelplan = [false, true, true, true, true, true, true, true, true, true, true, true, true, true, true]
    @State var vald = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
    @State private var pjäs:Int = 0
    @State private var huvudåtkomst:[Int] = []
    @State private var från:Int = 0
    @State private var huvudbort:[Int] = []
    @State private var visaslöst = false
    @State private var visasgo = false
    @State private var visas = false
    @State private var grattis = "Grattis! Pusslet är löst!"
    @State private var go = "GAME OVER"
    @State private var grattisOK = "OK"
    //@State private var pluppfärg = Color(UIColor(red: CGFloat(0/255), green: CGFloat(0/255), blue: CGFloat(0/255), alpha: 1))
    @State private var pluppfärg = Color.cyan
    
    @State private var röd = 79.0
    @State private var grön = 177.0
    @State private var blå = 132.0
    @State private var isEditing = false
    //@State private var förstaDragetGjort
    
    //init() {
            //self.pluppfärg = pluppfärg = Color(UIColor(red: CGFloat(speed/255), green: CGFloat(0/255), blue: CGFloat(0/255), alpha: 1))
        //}

    func flytta(nummer: Int){
        var åtkomst:[Int] = []
        var bort:[Int] = []
        if nummer == 1{
            let näraNummer = [1,2]
            let flyttNummer = [3,5]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 2{
            let näraNummer = [3,4]
            let flyttNummer = [6,8]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 3{
            let näraNummer = [4,5]
            let flyttNummer = [7,9]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 4{
            let näraNummer = [1,4,7,6]
            let flyttNummer = [0,5,12,10]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]], spelplan[näraNummer[2]], spelplan[näraNummer[3]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]],spelplan[flyttNummer[2]], spelplan[flyttNummer[3]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 5{
            let näraNummer = [7,8]
            let flyttNummer = [11,13]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 6{
            let näraNummer = [2,4,8,9]
            let flyttNummer = [0,3,12,14]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]], spelplan[näraNummer[2]], spelplan[näraNummer[3]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]],spelplan[flyttNummer[2]], spelplan[flyttNummer[3]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 7{
            let näraNummer = [3,7]
            let flyttNummer = [1,8]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 8{
            let näraNummer = [4,8]
            let flyttNummer = [2,9]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 9{
            let näraNummer = [4,7]
            let flyttNummer = [1,6]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 10{
            let näraNummer = [5,8]
            let flyttNummer = [2,7]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 11{
            let näraNummer = [6,11]
            let flyttNummer = [3,12]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 12{
            let näraNummer = [7,12]
            let flyttNummer = [4,13]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 13{
            let näraNummer = [11,7,8,13]
            let flyttNummer = [10,3,5,14]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]], spelplan[näraNummer[2]], spelplan[näraNummer[3]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]],spelplan[flyttNummer[2]], spelplan[flyttNummer[3]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 14{
            let näraNummer = [8,12]
            let flyttNummer = [4,11]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 15{
            let näraNummer = [9,13]
            let flyttNummer = [5,12]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        huvudbort = bort
        huvudåtkomst = åtkomst
        från = nummer
    }
    func flyttas(nummer: Int) -> Bool{
        var åtkomst:[Int] = []
        var bort:[Int] = []
        if nummer == 1{
            let näraNummer = [1,2]
            let flyttNummer = [3,5]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 2{
            let näraNummer = [3,4]
            let flyttNummer = [6,8]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 3{
            let näraNummer = [4,5]
            let flyttNummer = [7,9]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 4{
            let näraNummer = [1,4,7,6]
            let flyttNummer = [0,5,12,10]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]], spelplan[näraNummer[2]], spelplan[näraNummer[3]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]],spelplan[flyttNummer[2]], spelplan[flyttNummer[3]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 5{
            let näraNummer = [7,8]
            let flyttNummer = [11,13]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 6{
            let näraNummer = [2,4,8,9]
            let flyttNummer = [0,3,12,14]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]], spelplan[näraNummer[2]], spelplan[näraNummer[3]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]],spelplan[flyttNummer[2]], spelplan[flyttNummer[3]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 7{
            let näraNummer = [3,7]
            let flyttNummer = [1,8]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 8{
            let näraNummer = [4,8]
            let flyttNummer = [2,9]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 9{
            let näraNummer = [4,7]
            let flyttNummer = [1,6]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 10{
            let näraNummer = [5,8]
            let flyttNummer = [2,7]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 11{
            let näraNummer = [6,11]
            let flyttNummer = [3,12]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 12{
            let näraNummer = [7,12]
            let flyttNummer = [4,13]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 13{
            let näraNummer = [11,7,8,13]
            let flyttNummer = [10,3,5,14]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]], spelplan[näraNummer[2]], spelplan[näraNummer[3]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]],spelplan[flyttNummer[2]], spelplan[flyttNummer[3]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 14{
            let näraNummer = [8,12]
            let flyttNummer = [4,11]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        if nummer == 15{
            let näraNummer = [9,13]
            let flyttNummer = [5,12]
            let näraGrupp = [spelplan[näraNummer[0]], spelplan[näraNummer[1]]]
            let flyttGrupp = [spelplan[flyttNummer[0]], spelplan[flyttNummer[1]]]
            for i in (0..<näraGrupp.count){
                if näraGrupp[i] && !flyttGrupp[i]{
                    åtkomst.append(flyttNummer[i])
                    bort.append(näraNummer[i])
                }
            }
        }
        huvudbort = bort
        från = nummer
        if åtkomst.count == 0{
            return true
        }
        return false
    }
    func klar(){
        var klar = true
        for i in (0..<spelplan.count){
            if spelplan[i]{
                if flyttas(nummer: (i+1)){
                    klar = true
                }
                else{
                    klar = false
                    break
                }
            }
        }
        if klar{
            print("klarklar")
            var antalKvar = 0
            for i in (0..<spelplan.count){
                if spelplan[i]{
                    antalKvar += 1
                }
            }
            if antalKvar == 1{
                visaslöst = true
                visas = true
                print("löst")
            }
            else{
                visasgo = true
                visas = true
                print("go")
            }
        }
    }
    func färgRGB(röd: CGFloat, grön: CGFloat, blå: CGFloat) -> Color{
        
        return Color(UIColor(red: CGFloat(röd/255), green: CGFloat(grön/255), blue: CGFloat(blå/255), alpha: 1))
    }
    
    var body: some View {
        ZStack{
        
        VStack(spacing: luftKolonner){
            VStack(spacing: 0){
                HStack(spacing: 15){
                    Slider(
                            value: $röd,
                            in: 0...250,
                            step: 1
                        ) {
                            Text("Speed")
                        } onEditingChanged: { editing in
                            isEditing = editing
                        }
                        .accentColor(Color.red)
                    Text("\(Int(röd))")
                        .foregroundColor(.black)
                        .padding()
                }
                HStack(spacing: 15){
                    Slider(
                            value: $grön,
                            in: 0...250,
                            step: 1
                        ) {
                            Text("Speed")
                        } onEditingChanged: { editing in
                            isEditing = editing
                        }
                        .accentColor(Color.green)
                    Text("\(Int(grön))")
                        .foregroundColor(.black)
                        .padding()
                }
                HStack(spacing: 15){
                    Slider(
                            value: $blå,
                            in: 0...250,
                            step: 1
                        ) {
                            Text("Speed")
                        } onEditingChanged: { editing in
                            isEditing = editing
                        }
                        .accentColor(Color.blue)
                    Text("\(Int(blå))")
                        .foregroundColor(.black)
                        .padding()
                }
            }.frame(width: 300, height: 200)
            
            Button(action:{
                vald = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
                if spelplan[0]{
                    vald[0] = true
                    flytta(nummer: 1)
                }
                else {
                    vald[0] = false
                    if huvudåtkomst.contains(0){
                        
                        spelplan[0] = true
                        spelplan[från-1] = false
                        let ind = huvudåtkomst.firstIndex(of: 0)
                        let bort = huvudbort[ind ?? -1]
                        spelplan[bort] = false
                        
                        klar()
                    }
                    else {
                        spelplan[0] = false
                    }
                }
                print(huvudåtkomst)
            }){
                Text(spelplan[0] ? "" : "O")
                    .padding()
                    .frame(width: storlekRuta, height: storlekRuta, alignment: .center)
                    .foregroundColor(Color.black)
                    .background(spelplan[0] ? vald[0] ? Color.green : färgRGB(röd: CGFloat(röd), grön: CGFloat(grön), blå: CGFloat(blå)) : Color.gray)
                    .cornerRadius(krökningsradieRuta)
                    
            }
            .alert(grattis, isPresented: $visaslöst) {
                        Button("OK", role: .cancel) { }
                    }
            .alert(go, isPresented: $visasgo) {
                        Button("OK", role: .cancel) { }
                    }

        HStack(spacing: luftRader){
            Button(action:{
                vald = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
                if spelplan[1]{
                    vald[1] = true
                    flytta(nummer: 2)
                }
                else {
                    vald[1] = false
                    if huvudåtkomst.contains(1){
                        spelplan[1] = true
                        spelplan[från-1] = false
                        let ind = huvudåtkomst.firstIndex(of: 1)
                        let bort = huvudbort[ind ?? -1]
                        spelplan[bort] = false
                        
                        klar()
                    }
                    else {
                        spelplan[1] = false
                    }
                }
                print(huvudåtkomst)
            }){
                Text(spelplan[1] ? "" : "O")
                    .padding()
                    .frame(width: storlekRuta, height: storlekRuta, alignment: .center)
                    .foregroundColor(Color.black)
                    .background(spelplan[1] ? vald[1] ? Color.green : färgRGB(röd: CGFloat(röd), grön: CGFloat(grön), blå: CGFloat(blå)) : Color.gray)
                    .cornerRadius(krökningsradieRuta)
                    
            }
            .alert(grattis, isPresented: $visaslöst) {
                        Button("OK", role: .cancel) { }
                    }
            .alert(go, isPresented: $visasgo) {
                        Button("OK", role: .cancel) { }
                    }
            Button(action:{
                vald = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
                if spelplan[2]{
                    vald[2] = true
                    flytta(nummer: 3)
                }
                else {
                    vald[2] = false
                    if huvudåtkomst.contains(2){
                        spelplan[2] = true
                        spelplan[från-1] = false
                        let ind = huvudåtkomst.firstIndex(of: 2)
                        let bort = huvudbort[ind ?? -1]
                        spelplan[bort] = false
                        
                        klar()
                    }
                    else {
                        spelplan[2] = false
                    }
                }
                print(huvudåtkomst)
            }){
                Text(spelplan[2] ? "" : "O")
                    .padding()
                    .frame(width: storlekRuta, height: storlekRuta, alignment: .center)
                    .foregroundColor(Color.black)
                    .background(spelplan[2] ? vald[2] ? Color.green : färgRGB(röd: CGFloat(röd), grön: CGFloat(grön), blå: CGFloat(blå)) : Color.gray)
                    .cornerRadius(krökningsradieRuta)
                    
            }
            .alert(grattis, isPresented: $visaslöst) {
                        Button("OK", role: .cancel) { }
                    }
            .alert(go, isPresented: $visasgo) {
                        Button("OK", role: .cancel) { }
                    }
        }
            HStack(spacing: luftRader){
                Button(action:{
                    vald = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
                    if spelplan[3]{
                        vald[3] = true
                        flytta(nummer: 4)
                    }
                    else {
                        vald[3] = false
                        if huvudåtkomst.contains(3){
                            spelplan[3] = true
                            spelplan[från-1] = false
                            
                            let ind = huvudåtkomst.firstIndex(of: 3)
                            let bort = huvudbort[ind ?? -1]
                            spelplan[bort] = false
                            
                            klar()
                        }
                        else {
                            spelplan[3] = false
                        }
                    }
                    print(huvudåtkomst)
                }){
                    Text(spelplan[3] ? "" : "O")
                        .padding()
                        .frame(width: storlekRuta, height: storlekRuta, alignment: .center)
                        .foregroundColor(Color.black)
                        .background(spelplan[3] ? vald[3] ? Color.green : färgRGB(röd: CGFloat(röd), grön: CGFloat(grön), blå: CGFloat(blå)) : Color.gray)
                        .cornerRadius(krökningsradieRuta)
                        
                }
                .alert(grattis, isPresented: $visaslöst) {
                            Button("OK", role: .cancel) { }
                        }
                .alert(go, isPresented: $visasgo) {
                            Button("OK", role: .cancel) { }
                        }
                Button(action:{
                    vald = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
                    if spelplan[4]{
                        vald[4] = true
                        flytta(nummer: 5)
                    }
                    else {
                        vald[4] = false
                        if huvudåtkomst.contains(4){
                            spelplan[4] = true
                            spelplan[från-1] = false
                            let ind = huvudåtkomst.firstIndex(of: 4)
                            let bort = huvudbort[ind ?? -1]
                            spelplan[bort] = false
                            
                            klar()
                        }
                        else {
                            spelplan[4] = false
                        }
                    }
                    print(huvudåtkomst)
                }){
                    Text(spelplan[4] ? "" : "O")
                        .padding()
                        .frame(width: storlekRuta, height: storlekRuta, alignment: .center)
                        .foregroundColor(Color.black)
                        .background(spelplan[4] ? vald[4] ? Color.green : färgRGB(röd: CGFloat(röd), grön: CGFloat(grön), blå: CGFloat(blå)) : Color.gray)
                        .cornerRadius(krökningsradieRuta)
                        
                }
                .alert(grattis, isPresented: $visaslöst) {
                            Button("OK", role: .cancel) { }
                        }
                .alert(go, isPresented: $visasgo) {
                            Button("OK", role: .cancel) { }
                        }
                Button(action:{
                    vald = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
                    if spelplan[5]{
                        vald[5] = true
                        flytta(nummer: 6)
                    }
                    else {
                        vald[5] = false
                        if huvudåtkomst.contains(5){
                            spelplan[5] = true
                            spelplan[från-1] = false
                            let ind = huvudåtkomst.firstIndex(of: 5)
                            let bort = huvudbort[ind ?? -1]
                            spelplan[bort] = false
                            
                            klar()
                        }
                        else {
                            spelplan[5] = false
                        }
                    }
                    print(huvudåtkomst)
                }){
                    Text(spelplan[5] ? "" : "O")
                        .padding()
                        .frame(width: storlekRuta, height: storlekRuta, alignment: .center)
                        .foregroundColor(Color.black)
                        .background(spelplan[5] ? vald[5] ? Color.green : färgRGB(röd: CGFloat(röd), grön: CGFloat(grön), blå: CGFloat(blå)) : Color.gray)
                        .cornerRadius(krökningsradieRuta)
                        
                }
                .alert(grattis, isPresented: $visaslöst) {
                            Button("OK", role: .cancel) { }
                        }
                .alert(go, isPresented: $visasgo) {
                            Button("OK", role: .cancel) { }
                        }
            }
            HStack(spacing: luftRader){
                Button(action:{
                    vald = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
                    if spelplan[6]{
                        vald[6] = true
                        flytta(nummer: 7)
                    }
                    else {
                        vald[6] = false
                        if huvudåtkomst.contains(6){
                            spelplan[6] = true
                            spelplan[från-1] = false
                            let ind = huvudåtkomst.firstIndex(of: 6)
                            let bort = huvudbort[ind ?? -1]
                            spelplan[bort] = false
                            
                            klar()
                        }
                        else {
                            spelplan[6] = false
                        }
                    }
                    print(huvudåtkomst)
                }){
                    Text(spelplan[6] ? "" : "O")
                        .padding()
                        .frame(width: storlekRuta, height: storlekRuta, alignment: .center)
                        .foregroundColor(Color.black)
                        .background(spelplan[6] ? vald[6] ? Color.green : färgRGB(röd: CGFloat(röd), grön: CGFloat(grön), blå: CGFloat(blå)) : Color.gray)
                        .cornerRadius(krökningsradieRuta)
                        
                }
                .alert(grattis, isPresented: $visaslöst) {
                            Button("OK", role: .cancel) { }
                        }
                .alert(go, isPresented: $visasgo) {
                            Button("OK", role: .cancel) { }
                        }
                Button(action:{
                    vald = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
                    if spelplan[7]{
                        vald[7] = true
                        flytta(nummer: 8)
                    }
                    else {
                        vald[7] = false
                        if huvudåtkomst.contains(7){
                            spelplan[7] = true
                            spelplan[från-1] = false
                            let ind = huvudåtkomst.firstIndex(of: 7)
                            let bort = huvudbort[ind ?? -1]
                            spelplan[bort] = false
                            
                            klar()
                        }
                        else {
                            spelplan[7] = false
                        }
                    }
                    print(huvudåtkomst)
                }){
                    Text(spelplan[7] ? "" : "O")
                        .padding()
                        .frame(width: storlekRuta, height: storlekRuta, alignment: .center)
                        .foregroundColor(Color.black)
                        .background(spelplan[7] ? vald[7] ? Color.green : färgRGB(röd: CGFloat(röd), grön: CGFloat(grön), blå: CGFloat(blå)) : Color.gray)
                        .cornerRadius(krökningsradieRuta)
                        
                }
                .alert(grattis, isPresented: $visaslöst) {
                            Button("OK", role: .cancel) { }
                        }
                .alert(go, isPresented: $visasgo) {
                            Button("OK", role: .cancel) { }
                        }
                Button(action:{
                    vald = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
                    if spelplan[8]{
                        vald[8] = true
                        flytta(nummer: 9)
                    }
                    else {
                        vald[8] = false
                        if huvudåtkomst.contains(8){
                            spelplan[8] = true
                            spelplan[från-1] = false
                            let ind = huvudåtkomst.firstIndex(of: 8)
                            let bort = huvudbort[ind ?? -1]
                            spelplan[bort] = false
                            
                            klar()
                        }
                        else {
                            spelplan[8] = false
                        }
                    }
                    print(huvudåtkomst)
                }){
                    Text(spelplan[8] ? "" : "O")
                        .padding()
                        .frame(width: storlekRuta, height: storlekRuta, alignment: .center)
                        .foregroundColor(Color.black)
                        .background(spelplan[8] ? vald[8] ? Color.green : färgRGB(röd: CGFloat(röd), grön: CGFloat(grön), blå: CGFloat(blå)) : Color.gray)
                        .cornerRadius(krökningsradieRuta)
                        
                }
                .alert(grattis, isPresented: $visaslöst) {
                            Button("OK", role: .cancel) { }
                        }
                .alert(go, isPresented: $visasgo) {
                            Button("OK", role: .cancel) { }
                        }
                Button(action:{
                    vald = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
                    if spelplan[9]{
                        vald[9] = true
                        flytta(nummer: 10)
                    }
                    else {
                        vald[9] = false
                        if huvudåtkomst.contains(9){
                            spelplan[9] = true
                            spelplan[från-1] = false
                            let ind = huvudåtkomst.firstIndex(of: 9)
                            let bort = huvudbort[ind ?? -1]
                            spelplan[bort] = false
                            
                            klar()
                        }
                        else {
                            spelplan[9] = false
                        }
                    }
                    print(huvudåtkomst)
                }){
                    Text(spelplan[9] ? "" : "O")
                        .padding()
                        .frame(width: storlekRuta, height: storlekRuta, alignment: .center)
                        .foregroundColor(Color.black)
                        .background(spelplan[9] ? vald[9] ? Color.green : färgRGB(röd: CGFloat(röd), grön: CGFloat(grön), blå: CGFloat(blå)) : Color.gray)
                        .cornerRadius(krökningsradieRuta)
                        
                }
                .alert(grattis, isPresented: $visaslöst) {
                            Button("OK", role: .cancel) { }
                        }
                .alert(go, isPresented: $visasgo) {
                            Button("OK", role: .cancel) { }
                        }
            }
            HStack(spacing: luftRader){
                
                Button(action:{
                    vald = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
                    if spelplan[10]{
                        vald[10] = true
                        flytta(nummer: 11)
                    }
                    else {
                        vald[10] = false
                        if huvudåtkomst.contains(10){
                            spelplan[10] = true
                            spelplan[från-1] = false
                            let ind = huvudåtkomst.firstIndex(of: 10)
                            let bort = huvudbort[ind ?? -1]
                            spelplan[bort] = false
                            
                            klar()
                        }
                        else {
                            spelplan[10] = false
                        }
                    }
                    print(huvudåtkomst)
                }){
                    Text(spelplan[10] ? "" : "O")
                        .padding()
                        .frame(width: storlekRuta, height: storlekRuta, alignment: .center)
                        .foregroundColor(Color.black)
                        .background(spelplan[10] ? vald[10] ? Color.green : färgRGB(röd: CGFloat(röd), grön: CGFloat(grön), blå: CGFloat(blå)) : Color.gray)
                        .cornerRadius(krökningsradieRuta)
                        
                }
                .alert(grattis, isPresented: $visaslöst) {
                            Button("OK", role: .cancel) { }
                        }
                .alert(go, isPresented: $visasgo) {
                            Button("OK", role: .cancel) { }
                        }
                Button(action:{
                    vald = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
                    if spelplan[11]{
                        vald[11] = true
                        flytta(nummer: 12)
                    }
                    else {
                        vald[11] = false
                        if huvudåtkomst.contains(11){
                            spelplan[11] = true
                            spelplan[från-1] = false
                            let ind = huvudåtkomst.firstIndex(of: 11)
                            let bort = huvudbort[ind ?? -1]
                            spelplan[bort] = false
                            
                            klar()
                        }
                        else {
                            spelplan[11] = false
                        }
                    }
                    print(huvudåtkomst)
                }){
                    Text(spelplan[11] ? "" : "O")
                        .padding()
                        .frame(width: storlekRuta, height: storlekRuta, alignment: .center)
                        .foregroundColor(Color.black)
                        .background(spelplan[11] ? vald[11] ? Color.green : färgRGB(röd: CGFloat(röd), grön: CGFloat(grön), blå: CGFloat(blå)) : Color.gray)
                        .cornerRadius(krökningsradieRuta)
                        
                }
                .alert(grattis, isPresented: $visaslöst) {
                            Button("OK", role: .cancel) { }
                        }
                .alert(go, isPresented: $visasgo) {
                            Button("OK", role: .cancel) { }
                        }
                Button(action:{
                    vald = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
                    if spelplan[12]{
                        vald[12] = true
                        flytta(nummer: 13)
                    }
                    else {
                        vald[12] = false
                        if huvudåtkomst.contains(12){
                            spelplan[12] = true
                            spelplan[från-1] = false
                            let ind = huvudåtkomst.firstIndex(of: 12)
                            let bort = huvudbort[ind ?? -1]
                            spelplan[bort] = false
                            
                            klar()
                        }
                        else {
                            spelplan[12] = false
                        }
                    }
                    print(huvudåtkomst)
                }){
                    Text(spelplan[12] ? "" : "O")
                        .padding()
                        .frame(width: storlekRuta, height: storlekRuta, alignment: .center)
                        .foregroundColor(Color.black)
                        .background(spelplan[12] ? vald[12] ? Color.green : färgRGB(röd: CGFloat(röd), grön: CGFloat(grön), blå: CGFloat(blå)) : Color.gray)
                        .cornerRadius(krökningsradieRuta)
                        
                }
                .alert(go, isPresented: $visasgo) {
                            Button("OK", role: .cancel) { }
                        }
                .alert(grattis, isPresented: $visaslöst) {
                            Button("OK", role: .cancel) { }
                        }
                Button(action:{
                    vald = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
                    if spelplan[13]{
                        vald[13] = true
                        flytta(nummer: 14)
                    }
                    else {
                        vald[13] = false
                        if huvudåtkomst.contains(13){
                            spelplan[13] = true
                            spelplan[från-1] = false
                            let ind = huvudåtkomst.firstIndex(of: 13)
                            let bort = huvudbort[ind ?? -1]
                            spelplan[bort] = false
                            
                            klar()
                        }
                        else {
                            spelplan[13] = false
                        }
                    }
                    print(huvudåtkomst)
                }){
                    Text(spelplan[13] ? "" : "O")
                        .padding()
                        .frame(width: storlekRuta, height: storlekRuta, alignment: .center)
                        .foregroundColor(Color.black)
                        .background(spelplan[13] ? vald[13] ? Color.green : färgRGB(röd: CGFloat(röd), grön: CGFloat(grön), blå: CGFloat(blå)) : Color.gray)
                        .cornerRadius(krökningsradieRuta)
                        
                }
                .alert(grattis, isPresented: $visaslöst) {
                            Button("OK", role: .cancel) { }
                        }
                .alert(go, isPresented: $visasgo) {
                            Button("OK", role: .cancel) { }
                        }
                Button(action:{
                    vald = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
                    if spelplan[14]{
                        vald[14] = true
                        flytta(nummer: 15)
                    }
                    else {
                        vald[14] = false
                        if huvudåtkomst.contains(14){
                            spelplan[14] = true
                            spelplan[från-1] = false
                            let ind = huvudåtkomst.firstIndex(of: 14)
                            let bort = huvudbort[ind ?? -1]
                            spelplan[bort] = false
                            
                            klar()
                        }
                        else {
                            spelplan[14] = false
                        }
                    }
                    print(huvudåtkomst)
                }){
                    Text(spelplan[14] ? "" : "O")
                        .padding()
                        .frame(width: storlekRuta, height: storlekRuta, alignment: .center)
                        .foregroundColor(Color.black)
                        .background(spelplan[14] ? vald[14] ? Color.green : färgRGB(röd: CGFloat(röd), grön: CGFloat(grön), blå: CGFloat(blå)) : Color.gray)
                        .cornerRadius(krökningsradieRuta)
                        
                }
                .alert(grattis, isPresented: $visaslöst) {
                            Button("OK", role: .cancel) { }
                        }
                .alert(go, isPresented: $visasgo) {
                            Button("OK", role: .cancel) { }
                        }
            }
            Spacer()
                .frame(height: 80)
            Button(action:{
                göm = true
                spelplan = [false, true, true, true, true, true, true, true, true, true, true, true, true, true, true]
                vald = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
                pjäs = 0
                huvudåtkomst = []
                från = 0
                huvudbort = []
                visaslöst = false
                visasgo = false
                visas = false
            }){
                Text("Starta om")
                    .padding()
                    .frame(width: 140, height: 40, alignment: .center)
                    .foregroundColor(Color.white)
                    .background(visas ? Color.blue : Color.white)
                    .cornerRadius(20)
            }
        }
        }
        
        
        .ignoresSafeArea()
        
        
    }
        
        
        
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
