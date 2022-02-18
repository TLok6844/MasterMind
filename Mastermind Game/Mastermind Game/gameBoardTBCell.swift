import UIKit

class gameBoardTBCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var colorBtn1: UIButton!
    @IBOutlet weak var colorBtn2: UIButton!
    @IBOutlet weak var colorBtn3: UIButton!
    @IBOutlet weak var colorBtn4: UIButton!
    
    @IBOutlet weak var resultImg1: UIImageView!
    @IBOutlet weak var resultImg2: UIImageView!
    @IBOutlet weak var resultImg3: UIImageView!
    @IBOutlet weak var resultImg4: UIImageView!
    
    let redColor = UIColor.red
    let blueColor = UIColor.blue
    let greenColor = UIColor.green
    let yellowColor = UIColor.yellow
    let blackColor = UIColor.purple
    let orangeColor = UIColor.orange
    
    let white = UIColor.white

    let baseKey = UIImage(systemName: "circle.fill")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        colorBtn1.layer.cornerRadius = colorBtn1.frame.width/2
        colorBtn2.layer.cornerRadius = colorBtn2.frame.width/2
        colorBtn3.layer.cornerRadius = colorBtn3.frame.width/2
        colorBtn4.layer.cornerRadius = colorBtn4.frame.width/2

        resultImg1.image = baseKey
        resultImg2.image = baseKey
        resultImg3.image = baseKey
        resultImg4.image = baseKey
        
        
        resultImg1.tintColor = .white
        resultImg2.tintColor = .white
        resultImg3.tintColor = .white
        resultImg4.tintColor = .white
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func colorConfigure(color1: UIColor, color2: UIColor, color3: UIColor, color4: UIColor) {
        colorBtn1.backgroundColor = color1
        colorBtn2.backgroundColor = color2
        colorBtn3.backgroundColor = color3
        colorBtn4.backgroundColor = color4
    }
    
    func Resultconfigure(result1: UIImage, result2: UIImage, result3: UIImage, result4: UIImage, color1: UIColor, color2: UIColor, color3: UIColor, color4: UIColor) {
        resultImg1.image = result1
        resultImg2.image = result2
        resultImg3.image = result3
        resultImg4.image = result4
        
        resultImg1.tintColor = color1
        resultImg2.tintColor = color2
        resultImg3.tintColor = color3
        resultImg4.tintColor = color4
        
    }
    
    @IBAction func colorAction1(_ sender: Any) {
        
        if colorBtn1.backgroundColor != white {
            colorBtn1.backgroundColor = white
        }
    }
    
    @IBAction func colorAction2(_ sender: Any) {
        if colorBtn2.backgroundColor != white {
            colorBtn2.backgroundColor = white
        }

    }
    
    @IBAction func colorAction3(_ sender: Any) {
        if colorBtn3.backgroundColor != white {
            colorBtn3.backgroundColor = white
        }

    }
    
    @IBAction func colorAction4(_ sender: Any) {
        if colorBtn4.backgroundColor != white {
            colorBtn4.backgroundColor = white
        }

    }
    
}
