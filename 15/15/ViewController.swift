//
// Skapad av Albert Hansson någon gång i början av augusti.
//

import UIKit

class ViewController: UIViewController {
    
    //struktur
    lazy var ny = storyboard?.instantiateViewController(identifier: "andra") as! AndraVyViewController
    lazy var profil = storyboard?.instantiateViewController(identifier: "profil") as! ProfilViewController
    let userDefaults = UserDefaults()
    var harÖppnats: Bool = false
    
    //stoppur
    var timer = Timer()
    var timerDisplayed: Double = 0
    var tidenHarStartats = false
    
    //spelet
    var ledigPosition: CGPoint = CGPoint(x: 0, y: 0)
    var ettTillSexton: [UIButton] = []
    var standardAntalBlandningsdrag = 1800
    var antalBlandningsdrag = 1800
    let origo: CGPoint = CGPoint(x: 23, y: 352)
    var antalDrag: Double = 0
    
    //design
    var mintgrön: UIColor = UIColor(red: 0.772549, green: 0.827451, blue: 0.8, alpha: 1.0)
    
    //flöde
    var pausat = false
    var harblandat: Bool = false
    var användHaptik: Bool = false
    var återställ: Bool = false
    
    //data
    var ibästTid: Double = 0
    var itotaltid: Double = 0
    var iantalSpel: Double = 0
    var itotaltAntalDrag: Double = 0
    
    var position1: CGPoint = CGPoint(x: 0, y: 0)
    var position2: CGPoint = CGPoint(x: 0, y: 0)
    var position3: CGPoint = CGPoint(x: 0, y: 0)
    var position4: CGPoint = CGPoint(x: 0, y: 0)
    var position5: CGPoint = CGPoint(x: 0, y: 0)
    var position6: CGPoint = CGPoint(x: 0, y: 0)
    var position7: CGPoint = CGPoint(x: 0, y: 0)
    var position8: CGPoint = CGPoint(x: 0, y: 0)
    var position9: CGPoint = CGPoint(x: 0, y: 0)
    var position10: CGPoint = CGPoint(x: 0, y: 0)
    var position11: CGPoint = CGPoint(x: 0, y: 0)
    var position12: CGPoint = CGPoint(x: 0, y: 0)
    var position13: CGPoint = CGPoint(x: 0, y: 0)
    var position14: CGPoint = CGPoint(x: 0, y: 0)
    var position15: CGPoint = CGPoint(x: 0, y: 0)
    var position16: CGPoint = CGPoint(x: 0, y: 0)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let value = userDefaults.value(forKey: "återställning") as? Bool {
            återställ = value
        }
        if återställ{
            Återställ()
        }
        
        if let value = userDefaults.value(forKey: "bästTid") as? Double {
            ibästTid = value
        }
        if let value = userDefaults.value(forKey: "antalSpel") as? Double {
            iantalSpel = value
        }
        if let value = userDefaults.value(forKey: "totaltAntalDrag") as? Double {
            itotaltAntalDrag = value
        }
        if let value = userDefaults.value(forKey: "totaltid") as? Double {
            itotaltid = value
        }
        lblTid.text = ""
        lblDrag.text = ""
        btnoPause.isHidden = true
        btnoStopp.isHidden = true
        bntoProfil.isHidden = true
        btno1.setTitleColor(UIColor.gray, for: .normal)
        btno2.setTitleColor(UIColor.gray, for: .normal)
        btno3.setTitleColor(UIColor.gray, for: .normal)
        btno4.setTitleColor(UIColor.gray, for: .normal)
        btno5.setTitleColor(UIColor.gray, for: .normal)
        btno6.setTitleColor(UIColor.gray, for: .normal)
        btno7.setTitleColor(UIColor.gray, for: .normal)
        btno8.setTitleColor(UIColor.gray, for: .normal)
        btno9.setTitleColor(UIColor.gray, for: .normal)
        btno10.setTitleColor(UIColor.gray, for: .normal)
        btno11.setTitleColor(UIColor.gray, for: .normal)
        btno12.setTitleColor(UIColor.gray, for: .normal)
        btno13.setTitleColor(UIColor.gray, for: .normal)
        btno14.setTitleColor(UIColor.gray, for: .normal)
        btno15.setTitleColor(UIColor.gray, for: .normal)
        
        btno1.isEnabled = false
        btno2.isEnabled = false
        btno3.isEnabled = false
        btno4.isEnabled = false
        btno5.isEnabled = false
        btno6.isEnabled = false
        btno7.isEnabled = false
        btno8.isEnabled = false
        btno9.isEnabled = false
        btno10.isEnabled = false
        btno11.isEnabled = false
        btno12.isEnabled = false
        btno13.isEnabled = false
        btno14.isEnabled = false
        btno15.isEnabled = false
        
        btno1.layer.cornerRadius = 20
        btno2.layer.cornerRadius = 20
        btno3.layer.cornerRadius = 20
        btno4.layer.cornerRadius = 20
        btno5.layer.cornerRadius = 20
        btno6.layer.cornerRadius = 20
        btno7.layer.cornerRadius = 20
        btno8.layer.cornerRadius = 20
        btno9.layer.cornerRadius = 20
        btno10.layer.cornerRadius = 20
        btno11.layer.cornerRadius = 20
        btno12.layer.cornerRadius = 20
        btno13.layer.cornerRadius = 20
        btno14.layer.cornerRadius = 20
        btno15.layer.cornerRadius = 20
        
        position1 = CGPoint(x: origo.x, y: origo.y)
        position2 = CGPoint(x: origo.x + 88, y: origo.y)
        position3 = CGPoint(x: origo.x + 176, y: origo.y)
        position4 = CGPoint(x: origo.x + 264, y: origo.y)
        
        position5 = CGPoint(x: origo.x, y: origo.y + 88)
        position6 = CGPoint(x: origo.x + 88, y: origo.y + 88)
        position7 = CGPoint(x: origo.x + 176, y: origo.y + 88)
        position8 = CGPoint(x: origo.x + 264, y: origo.y + 88)
        
        position9 = CGPoint(x: origo.x, y: origo.y + 176)
        position10 = CGPoint(x: origo.x + 88, y: origo.y + 176)
        position11 = CGPoint(x: origo.x + 176, y: origo.y + 176)
        position12 = CGPoint(x: origo.x + 264, y: origo.y + 176)
        
        position13 = CGPoint(x: origo.x, y: origo.y + 264)
        position14 = CGPoint(x: origo.x + 88, y: origo.y + 264)
        position15 = CGPoint(x: origo.x + 176, y: origo.y + 264)
        position16 = CGPoint(x: origo.x + 264, y: origo.y + 264)
                    
        ledigPosition = position16;
        
        ettTillSexton.append(btno1)
        ettTillSexton.append(btno2)
        ettTillSexton.append(btno3)
        ettTillSexton.append(btno4)
        ettTillSexton.append(btno5)
        ettTillSexton.append(btno6)
        ettTillSexton.append(btno7)
        ettTillSexton.append(btno8)
        ettTillSexton.append(btno9)
        ettTillSexton.append(btno10)
        ettTillSexton.append(btno11)
        ettTillSexton.append(btno12)
        ettTillSexton.append(btno13)
        ettTillSexton.append(btno14)
        ettTillSexton.append(btno15)
        
//        userDefaults.setValue(0, forKey: "bästTid")
//        userDefaults.setValue(0, forKey: "antalSpel")
//        userDefaults.setValue(0, forKey: "totaltAntalDrag")
//        userDefaults.setValue(0, forKey: "totaltid")
    }
    
    @IBAction func btnProfil(_ sender: Any) {
        if användHaptik{
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        }
        present(profil, animated: true)
        
    }
    
    @IBAction func btnPause(_ sender: Any) {
        if användHaptik{
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        }
        pausat = true
        timer.invalidate()
        btnoPause.isEnabled = false
        btnoPause.setTitleColor(UIColor.gray, for: .normal)
    }
    
    @IBAction func btnMeny(_ sender: Any) {
        if användHaptik{
            ny.haptik = true
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        }
        else{
            ny.haptik = false
        }
        
        ny.completionHandler = { text in
            self.användHaptik = text
        }
        
        if let value = userDefaults.value(forKey: "återställning") as? Bool {
            återställ = value
        }
        if återställ{
            Återställ()
        }
        
        Spara(tid: 0, drag: 0, antalNyaSpel: 0)
        
        if harÖppnats{
            ny.Uppstart()
            present(ny, animated: true)
        }
        else{
            harÖppnats = true
            present(ny, animated: true)
        }
        
    }
    
    @IBAction func btnStopp(_ sender: Any) {
        
        if användHaptik{
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        }
        
        btno1.setTitleColor(UIColor.gray, for: .normal)
        btno2.setTitleColor(UIColor.gray, for: .normal)
        btno3.setTitleColor(UIColor.gray, for: .normal)
        btno4.setTitleColor(UIColor.gray, for: .normal)
        btno5.setTitleColor(UIColor.gray, for: .normal)
        btno6.setTitleColor(UIColor.gray, for: .normal)
        btno7.setTitleColor(UIColor.gray, for: .normal)
        btno8.setTitleColor(UIColor.gray, for: .normal)
        btno9.setTitleColor(UIColor.gray, for: .normal)
        btno10.setTitleColor(UIColor.gray, for: .normal)
        btno11.setTitleColor(UIColor.gray, for: .normal)
        btno12.setTitleColor(UIColor.gray, for: .normal)
        btno13.setTitleColor(UIColor.gray, for: .normal)
        btno14.setTitleColor(UIColor.gray, for: .normal)
        btno15.setTitleColor(UIColor.gray, for: .normal)
        btnoStopp.isHidden = true
        btnoPause.isHidden = true
        btnoBlanda.isHidden = false
        lblTid.text = ""
        lblDrag.text = ""
        antalDrag = 0
        timerDisplayed = 0
        tidenHarStartats = false
        timer.invalidate()
        btnoMeny.isHidden = false
        btnoBlanda.isEnabled = true
        harblandat = false
        
        btno1.frame.origin = position1
        btno2.frame.origin = position2
        btno3.frame.origin = position3
        btno4.frame.origin = position4
        btno5.frame.origin = position5
        btno6.frame.origin = position6
        btno7.frame.origin = position7
        btno8.frame.origin = position8
        btno9.frame.origin = position9
        btno10.frame.origin = position10
        btno11.frame.origin = position11
        btno12.frame.origin = position12
        btno13.frame.origin = position13
        btno14.frame.origin = position14
        btno15.frame.origin = position15
        
        btno1.isEnabled = false
        btno2.isEnabled = false
        btno3.isEnabled = false
        btno4.isEnabled = false
        btno5.isEnabled = false
        btno6.isEnabled = false
        btno7.isEnabled = false
        btno8.isEnabled = false
        btno9.isEnabled = false
        btno10.isEnabled = false
        btno11.isEnabled = false
        btno12.isEnabled = false
        btno13.isEnabled = false
        btno14.isEnabled = false
        btno15.isEnabled = false
        ledigPosition = position16
    }
    
    @IBAction func btnBlanda(_ sender: Any) {
        if användHaptik{
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        }
        
        if let value = userDefaults.value(forKey: "återställning") as? Bool {
            återställ = value
        }
        if återställ{
            Återställ()
        }
        
        if harblandat{
            return;
        }
        btno1.setTitleColor(UIColor.black, for: .normal)
        btno2.setTitleColor(UIColor.black, for: .normal)
        btno3.setTitleColor(UIColor.black, for: .normal)
        btno4.setTitleColor(UIColor.black, for: .normal)
        btno5.setTitleColor(UIColor.black, for: .normal)
        btno6.setTitleColor(UIColor.black, for: .normal)
        btno7.setTitleColor(UIColor.black, for: .normal)
        btno8.setTitleColor(UIColor.black, for: .normal)
        btno9.setTitleColor(UIColor.black, for: .normal)
        btno10.setTitleColor(UIColor.black, for: .normal)
        btno11.setTitleColor(UIColor.black, for: .normal)
        btno12.setTitleColor(UIColor.black, for: .normal)
        btno13.setTitleColor(UIColor.black, for: .normal)
        btno14.setTitleColor(UIColor.black, for: .normal)
        btno15.setTitleColor(UIColor.black, for: .normal)
        btno1.isEnabled = true
        btno2.isEnabled = true
        btno3.isEnabled = true
        btno4.isEnabled = true
        btno5.isEnabled = true
        btno6.isEnabled = true
        btno7.isEnabled = true
        btno8.isEnabled = true
        btno9.isEnabled = true
        btno10.isEnabled = true
        btno11.isEnabled = true
        btno12.isEnabled = true
        btno13.isEnabled = true
        btno14.isEnabled = true
        btno15.isEnabled = true
        
        btnoBlanda.isEnabled = false
        harblandat = true
        self.view.backgroundColor = mintgrön
        antalDrag = 0
        timerDisplayed = 0
        lblTid.text = ""
        lblDrag.text = ""
        if (tidenHarStartats)
        {
            return
        }
        var drag: [Int] = []
        while antalBlandningsdrag > 0
        {
            let nyttDrag: Int = Int.random(in: 1..<16)
            drag.append(nyttDrag)
            antalBlandningsdrag -= 1
        }
        antalBlandningsdrag = standardAntalBlandningsdrag
        
        for draget in drag
        {
            if (draget == 1)
            {
                flytta2(btn: btno1)
            }
            else if (draget == 2)
            {
                flytta2(btn: btno2)
            }
            else if (draget == 3)
            {
                flytta2(btn: btno3)
            }
            else if (draget == 4)
            {
                flytta2(btn: btno4)
            }
            else if (draget == 5)
            {
                flytta2(btn: btno5)
            }
            else if (draget == 6)
            {
                flytta2(btn: btno6)
            }
            else if (draget == 7)
            {
                flytta2(btn: btno7)
            }
            else if (draget == 8)
            {
                flytta2(btn: btno8)
            }
            else if (draget == 9)
            {
                flytta2(btn: btno9)
            }
            else if (draget == 10)
            {
                flytta2(btn: btno10)
            }
            else if (draget == 11)
            {
                flytta2(btn: btno11)
            }
            else if (draget == 12)
            {
                flytta2(btn: btno12)
            }
            else if (draget == 13)
            {
                flytta2(btn: btno13)
            }
            else if (draget == 14)
            {
                flytta2(btn: btno14)
            }
            else if (draget == 15)
            {
                flytta2(btn: btno15)
            }
            
            tidenHarStartats = false;
        }
    }
    
    func flytta2(btn: UIButton){
        let avståndX: Int = Int(pow((ledigPosition.x - btn.frame.origin.x), 2))
        let avståndY: Int = Int(pow((ledigPosition.y - btn.frame.origin.y), 2))
        let avstånd: Int = Int(sqrt(Double(avståndX + avståndY)))
        
        if (avstånd == 88)
        {
            let temporär: CGPoint = btn.frame.origin
            btn.frame.origin = ledigPosition
            ledigPosition = temporär
        }
    }
    func flytta(btn: UIButton){
        
        let avståndX: Int = Int(pow((ledigPosition.x - btn.frame.origin.x), 2))
        let avståndY: Int = Int(pow((ledigPosition.y - btn.frame.origin.y), 2))
        let avstånd: Int = Int(sqrt(Double(avståndX + avståndY)))
        
        if (avstånd % 88 == 0)
        {
            if användHaptik{
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()
            }
            
//            if let value = userDefaults.value(forKey: "återställning") as? Bool {
//                återställ = value
//            }
//            if återställ{
//                Återställ()
//            }
            
            if pausat{
                timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(Räkna), userInfo: nil, repeats: true)
                tidenHarStartats = true
                pausat = false
                btnoPause.isEnabled = true
                btnoPause.setTitleColor(UIColor.black, for: .normal)
            }
            btnoMeny.isHidden = true
            antalDrag += 1
            lblDrag.text = String(Int(antalDrag)) + " drag"
            if !tidenHarStartats{
                btnoBlanda.isHidden = false
                lblTid.text = "00:00,00"
                timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(Räkna), userInfo: nil, repeats: true)
                tidenHarStartats = true
                btnoPause.isHidden = false
                btnoBlanda.isHidden = true
                btnoStopp.isHidden = false
            }
            else{
                
            }
            if (avstånd == 88)
            {
                let temporär: CGPoint = btn.frame.origin;
                btn.frame.origin = ledigPosition;
                ledigPosition = temporär;
            }
            else if (avstånd == 176 || avstånd == 264)
            {
                let temporär: CGPoint = btn.frame.origin;
                if (ledigPosition.x - btn.frame.origin.x > 0)
                {
                    for position in ettTillSexton
                    {
                        if(position.frame.origin.y == btn.frame.origin.y &&
                            position.frame.origin.x > btn.frame.origin.x &&
                            position.frame.origin.x < ledigPosition.x)
                        {
                            let nyPosition: CGPoint = CGPoint(x: position.frame.origin.x + 88, y: position.frame.origin.y)
                            position.frame.origin = nyPosition
                        }
                    }
                    
                    btn.frame.origin = CGPoint(x: btn.frame.origin.x + 88, y: btn.frame.origin.y)
                    ledigPosition = temporär;
                    
                }
                else if (ledigPosition.x - btn.frame.origin.x < 0)
                {
                    for position in ettTillSexton
                    {
                        if(position.frame.origin.y == btn.frame.origin.y &&
                            position.frame.origin.x < btn.frame.origin.x &&
                            position.frame.origin.x > ledigPosition.x)
                        {
                            
                            position.frame.origin = CGPoint(x: position.frame.origin.x - 88, y: position.frame.origin.y)
                        }
                    }

                    btn.frame.origin = CGPoint(x: btn.frame.origin.x - 88, y: btn.frame.origin.y)
                    ledigPosition = temporär;
                }


                else if (ledigPosition.y - btn.frame.origin.y > 0)
                {
                    for position in ettTillSexton
                    {
                        if (position.frame.origin.x == btn.frame.origin.x &&
                                position.frame.origin.y > btn.frame.origin.y &&
                                position.frame.origin.y < ledigPosition.y)
                        {
                            position.frame.origin = CGPoint(x: position.frame.origin.x, y: position.frame.origin.y + 88);
                        }
                    }

                    btn.frame.origin = CGPoint(x: btn.frame.origin.x, y: btn.frame.origin.y + 88);
                    ledigPosition = temporär;
                }
                else if (ledigPosition.y - btn.frame.origin.y < 0)
                {
                    for position in ettTillSexton
                    {
                        if (position.frame.origin.x == btn.frame.origin.x &&
                                position.frame.origin.y < btn.frame.origin.y &&
                                position.frame.origin.y > ledigPosition.y)
                        {
                            position.frame.origin = CGPoint(x: position.frame.origin.x, y: position.frame.origin.y - 88);
                        }
                    }

                    btn.frame.origin = CGPoint(x: btn.frame.origin.x, y: btn.frame.origin.y - 88);
                    ledigPosition = temporär;
                }
            }
        }
        if (klar()){
            timer.invalidate()
            tidenHarStartats = false
            self.view.backgroundColor = UIColor.green
            btnoPause.isHidden = true
            btnoStopp.isHidden = true
            btnoBlanda.isHidden = false
            btnoBlanda.isEnabled = true
            btnoMeny.isHidden = false
            harblandat = false
            
            
            Spara(tid: timerDisplayed, drag: antalDrag, antalNyaSpel: 1)
            antalDrag = 0
            btno1.isEnabled = false
            btno2.isEnabled = false
            btno3.isEnabled = false
            btno4.isEnabled = false
            btno5.isEnabled = false
            btno6.isEnabled = false
            btno7.isEnabled = false
            btno8.isEnabled = false
            btno9.isEnabled = false
            btno10.isEnabled = false
            btno11.isEnabled = false
            btno12.isEnabled = false
            btno13.isEnabled = false
            btno14.isEnabled = false
            btno15.isEnabled = false
            btno1.setTitleColor(UIColor.gray, for: .normal)
            btno2.setTitleColor(UIColor.gray, for: .normal)
            btno3.setTitleColor(UIColor.gray, for: .normal)
            btno4.setTitleColor(UIColor.gray, for: .normal)
            btno5.setTitleColor(UIColor.gray, for: .normal)
            btno6.setTitleColor(UIColor.gray, for: .normal)
            btno7.setTitleColor(UIColor.gray, for: .normal)
            btno8.setTitleColor(UIColor.gray, for: .normal)
            btno9.setTitleColor(UIColor.gray, for: .normal)
            btno10.setTitleColor(UIColor.gray, for: .normal)
            btno11.setTitleColor(UIColor.gray, for: .normal)
            btno12.setTitleColor(UIColor.gray, for: .normal)
            btno13.setTitleColor(UIColor.gray, for: .normal)
            btno14.setTitleColor(UIColor.gray, for: .normal)
            btno15.setTitleColor(UIColor.gray, for: .normal)
            
            timerDisplayed = 0
        }
    }
    
    func klar() -> Bool {
        if (btno1.frame.origin == position1 &&
            btno2.frame.origin == position2 &&
            btno3.frame.origin == position3 &&
            btno4.frame.origin == position4 &&
            btno5.frame.origin == position5 &&
            btno6.frame.origin == position6 &&
            btno7.frame.origin == position7 &&
            btno8.frame.origin == position8 &&
            btno9.frame.origin == position9 &&
            btno10.frame.origin == position10 &&
            btno11.frame.origin == position11 &&
            btno12.frame.origin == position12 &&
            btno13.frame.origin == position13 &&
            btno14.frame.origin == position14 &&
            btno15.frame.origin == position15)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    @objc func Räkna(){
        timerDisplayed += 1
        
        let tidIMinuter: Int = Int(timerDisplayed) / 6000
        let tidISekunder: Int = (Int(timerDisplayed) - tidIMinuter * 6000) / 100
        let tidIHundradelar: Int = Int(timerDisplayed) % 100
        lblTid.text = String(format: "%02i:%02i,%02i", tidIMinuter, tidISekunder, tidIHundradelar)
    }
    @objc func Återställ(){
        
        återställ = false
        userDefaults.setValue(false, forKey: "återställning")
        iantalSpel = 0
        ibästTid = 0
        itotaltid = 0
        itotaltAntalDrag = 0
        Spara(tid: 0,drag: 0,antalNyaSpel: 0)
    }
    @objc func Spara(tid: Double, drag: Double, antalNyaSpel: Double){
        if tid == 0{
            
        }
        else if tid < ibästTid || ibästTid == 0{
            ibästTid = tid
        }
        iantalSpel = iantalSpel + antalNyaSpel
        itotaltAntalDrag += drag
        itotaltid += tid
        
        userDefaults.setValue(ibästTid, forKey: "bästTid")
        userDefaults.setValue(iantalSpel, forKey: "antalSpel")
        userDefaults.setValue(itotaltAntalDrag, forKey: "totaltAntalDrag")
        userDefaults.setValue(itotaltid, forKey: "totaltid")
    }
    
    @IBAction func btn1(_ sender: Any) {
        flytta(btn: btno1)
    }
    @IBAction func btn2(_ sender: Any) {
        flytta(btn: btno2)
    }
    @IBAction func btn3(_ sender: Any) {
        flytta(btn: btno3)
    }
    @IBAction func btn4(_ sender: Any) {
        flytta(btn: btno4)
    }
    @IBAction func btn5(_ sender: Any) {
        flytta(btn: btno5)
    }
    @IBAction func btn6(_ sender: Any) {
        flytta(btn: btno6)
    }
    @IBAction func btn7(_ sender: Any) {
        flytta(btn: btno7)
    }
    @IBAction func btn8(_ sender: Any) {
        flytta(btn: btno8)
    }
    @IBAction func btn9(_ sender: Any) {
        flytta(btn: btno9)
    }
    @IBAction func btn10(_ sender: Any) {
        flytta(btn: btno10)
    }
    @IBAction func btn11(_ sender: Any) {
        flytta(btn: btno11)
    }
    @IBAction func btn12(_ sender: Any) {
        flytta(btn: btno12)
    }
    @IBAction func btn13(_ sender: Any) {
        flytta(btn: btno13)
    }
    @IBAction func btn14(_ sender: Any) {
        flytta(btn: btno14)
    }
    @IBAction func btn15(_ sender: Any) {
        flytta(btn: btno15)
    }
    
    @IBOutlet weak var lblDrag: UILabel!
    @IBOutlet weak var lblTid: UILabel!
    @IBOutlet weak var btno1: UIButton!
    @IBOutlet weak var btno2: UIButton!
    @IBOutlet weak var btno3: UIButton!
    @IBOutlet weak var btno4: UIButton!
    @IBOutlet weak var btno5: UIButton!
    @IBOutlet weak var btno6: UIButton!
    @IBOutlet weak var btno7: UIButton!
    @IBOutlet weak var btno8: UIButton!
    @IBOutlet weak var btno9: UIButton!
    @IBOutlet weak var btno10: UIButton!
    @IBOutlet weak var btno11: UIButton!
    @IBOutlet weak var btno12: UIButton!
    @IBOutlet weak var btno13: UIButton!
    @IBOutlet weak var btno14: UIButton!
    @IBOutlet weak var btno15: UIButton!
    @IBOutlet weak var btnoPause: UIButton!
    @IBOutlet weak var btnoBlanda: UIButton!
    @IBOutlet weak var btnoStopp: UIButton!
    @IBOutlet weak var btnoMeny: UIButton!
    @IBOutlet weak var bntoProfil: UIButton!
}
