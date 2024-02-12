//
//
//

import UIKit

class AndraVyViewController: UIViewController{

    public var completionHandler: ((Bool) -> Void)?
    let userDefaults = UserDefaults()
    
    var haptik: Bool = false
    var bästTid: Double = 0
    var genomsnittsTid: Double = 0
    var genomsnittDrag: Double = 0
    var totaltid: Double = 0
    var antalSpel: Double = 0
    var totaltAntalDrag: Double = 0
    
    @IBOutlet weak var lblBästTid: UILabel!
    @IBOutlet weak var lblGenomsnittstid: UILabel!
    @IBOutlet weak var lblSnittDrag: UILabel!
    @IBOutlet weak var lblTotaltid: UILabel!
    @IBOutlet weak var lblAntalSpel: UILabel!
    @IBOutlet weak var btnÅterställ: UIButton!
    
    override func viewDidLoad() {
        btnÅterställ.isHidden = true
        super.viewDidLoad()
        Uppstart()
    }
    
    @objc func Uppstart(){
        if haptik{
            swtoHaptik.isOn = true
        }
        else{
            swtoHaptik.isOn = false
        }
        
        if let value = userDefaults.value(forKey: "bästTid") as? Double {
            bästTid = value
        }
        if let value = userDefaults.value(forKey: "antalSpel") as? Double {
            antalSpel = value
        }
        if let value = userDefaults.value(forKey: "totaltAntalDrag") as? Double {
            totaltAntalDrag = value
        }
        if let value = userDefaults.value(forKey: "totaltid") as? Double {
            totaltid = value
        }
        
        if antalSpel == 0{
            genomsnittDrag = 0
            genomsnittsTid = 0
        }
        else{
            genomsnittsTid = totaltid / antalSpel
            genomsnittDrag = totaltAntalDrag / antalSpel
        }
        
        if bästTid == 0{
            lblBästTid.text = "-"
        }
        else{
            let tidIMinuter: Int = Int(bästTid) / 6000
            let tidISekunder: Int = (Int(bästTid) - tidIMinuter * 6000) / 100
            let tidIHundradelar: Int = Int(bästTid) % 100
            lblBästTid.text = String(format: "%02i:%02i,%02i", tidIMinuter, tidISekunder, tidIHundradelar)
        }
        if genomsnittsTid == 0{
            lblGenomsnittstid.text = "-"
        }
        else{
            let tidIMinuter = Int(genomsnittsTid) / 6000
            let tidISekunder = (Int(genomsnittsTid) - tidIMinuter * 6000) / 100
            let tidIHundradelar = Int(genomsnittsTid) % 100
            lblGenomsnittstid.text = String(format: "%02i:%02i,%02i", tidIMinuter, tidISekunder, tidIHundradelar)
        }

        if antalSpel == 0{
            lblSnittDrag.text = "-"
        }
        else{
            lblSnittDrag.text = String(Int(totaltAntalDrag/antalSpel))
        }

        let tidIMinuter = Int(totaltid) / 6000
        let tidISekunder = (Int(totaltid) - tidIMinuter * 6000) / 100
        let tidIHundradelar = Int(totaltid) % 100
        lblTotaltid.text = String(format: "%02i:%02i,%02i", tidIMinuter, tidISekunder, tidIHundradelar)
        
        lblAntalSpel.text = String(Int(antalSpel))
        
        btnÅterställ.layer.cornerRadius = 10
    }
    
    @IBAction func btnÅterställ(_ sender: Any) {
    }
    
    @objc func Rensa(){
        userDefaults.setValue(true, forKey: "återställning")
        lblBästTid.text = "-"
        lblGenomsnittstid.text = "-"
        lblSnittDrag.text = "-"
        lblTotaltid.text = "00:00,00"
        lblAntalSpel.text = "0"
        bästTid = 0
        genomsnittsTid = 0
        genomsnittDrag = 0
        antalSpel = 0
        totaltAntalDrag = 0
        totaltid = 0
    }
    
    @IBOutlet weak var swtoHaptik: UISwitch!
    @IBAction func setHaptik(_ sender: UISwitch) {
        if sender.isOn{
            completionHandler?(true)
        }
        else{
            completionHandler?(false)
        }
    }
}
