import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var mainContentView: UIView!
    @IBOutlet weak var resultContentView: UIView!
    @IBOutlet weak var selectContentView: UIView!
    
    @IBOutlet weak var gameBoardTBView: UITableView!
    
    @IBOutlet weak var mainTitleLB: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    
    let baseKey = UIImage(systemName: "circle.fill")
    
    let whiteKey = UIImage(systemName: "circle")
    
    let blackKey = UIImage(systemName: "circle.fill")
    
    private let COLORS = [UIColor.black, UIColor.black, UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow, UIColor.purple, UIColor.orange]
    
    private var selectColorArr = [
        [UIColor.white, UIColor.white, UIColor.white, UIColor.white],
        [UIColor.white, UIColor.white, UIColor.white, UIColor.white],
        [UIColor.white, UIColor.white, UIColor.white, UIColor.white],
        [UIColor.white, UIColor.white, UIColor.white, UIColor.white],
        [UIColor.white, UIColor.white, UIColor.white, UIColor.white],
        [UIColor.white, UIColor.white, UIColor.white, UIColor.white],
        [UIColor.white, UIColor.white, UIColor.white, UIColor.white]
    ]
    
    private var answerImageArr = [
        [UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill")],
        [UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill")],
        [UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill")],
        [UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill")],
        [UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill")],
        [UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill")],
        [UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill")]
    ]
    
    private var answerColorArr = [
        [UIColor.white, UIColor.white, UIColor.white, UIColor.white],
        [UIColor.white, UIColor.white, UIColor.white, UIColor.white],
        [UIColor.white, UIColor.white, UIColor.white, UIColor.white],
        [UIColor.white, UIColor.white, UIColor.white, UIColor.white],
        [UIColor.white, UIColor.white, UIColor.white, UIColor.white],
        [UIColor.white, UIColor.white, UIColor.white, UIColor.white],
        [UIColor.white, UIColor.white, UIColor.white, UIColor.white]
    ]
    
    var x = 0  // for selectColorArr 2D array
    
    var y = 0  // for selectColorArr 2D array
    
    var result = [UIColor.white, UIColor.white, UIColor.white, UIColor.white]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseSetting()
    }
    
    // load the deafult setting
    private func baseSetting() {

        newGame()
        
        mainTitleLB.text = "Mastermind"
        
        button1.backgroundColor = COLORS[2]
        button2.backgroundColor = COLORS[3]
        button3.backgroundColor = COLORS[4]
        button4.backgroundColor = COLORS[5]
        button5.backgroundColor = COLORS[6]
        button6.backgroundColor = COLORS[7]
       
        
        button1.layer.cornerRadius = 25
        button2.layer.cornerRadius = 25
        button3.layer.cornerRadius = 25
        button4.layer.cornerRadius = 25
        button5.layer.cornerRadius = 25
        button6.layer.cornerRadius = 25
        
        gameBoardTBView.dataSource = self
        gameBoardTBView.delegate = self
        gameBoardTBView.backgroundColor = .white
        gameBoardTBView.register(UINib(nibName: "gameBoardTBCell", bundle: nil), forCellReuseIdentifier: "gameBoardTBCell")
                
    }
    
    @IBAction func buttonAction1(_ sender: Any) {
        
        selectColor(UIColor.red)
    }
    
    @IBAction func buttonAction2(_ sender: Any) {
        
        selectColor(UIColor.blue)
    }
    
    @IBAction func buttonAction3(_ sender: Any) {

        selectColor(UIColor.green)
    }
    
    @IBAction func buttonAction4(_ sender: Any) {
        
        selectColor(UIColor.yellow)
    }
    
    @IBAction func buttonAction5(_ sender: Any) {

        selectColor(UIColor.purple)
    }
    
    @IBAction func buttonAction6(_ sender: Any) {

        selectColor(UIColor.orange)
    }
    
    // select the color of the button and then refresh the ui
    private func selectColor(_ color : UIColor) {
        
        selectColorArr[x][y] = color
        
        y = y + 1
        
        if (y == 4) {
            
            checkGame()
            y = 0
            
            x = x + 1
            
            if (x == 7) {
                endGame("LOSE")
            }
        }
        
        gameBoardTBView.reloadData()
    }
    
    private func newGame() {
        
//        var a = Int.random(in: 2..<8)
//        var b = Int.random(in: 2..<8)
//        var c = Int.random(in: 2..<8)
//        var d = Int.random(in: 2..<8)
//
//        result[0] = COLORS[a]
//        result[1] = COLORS[b]
//        result[2] = COLORS[c]
//        result[3] = COLORS[d]
        
        result[0] = COLORS[Int.random(in: 2..<8)]
        result[1] = COLORS[Int.random(in: 2..<8)]
        result[2] = COLORS[Int.random(in: 2..<8)]
        result[3] = COLORS[Int.random(in: 2..<8)]
        
        selectColorArr = [
            [UIColor.white, UIColor.white, UIColor.white, UIColor.white],
            [UIColor.white, UIColor.white, UIColor.white, UIColor.white],
            [UIColor.white, UIColor.white, UIColor.white, UIColor.white],
            [UIColor.white, UIColor.white, UIColor.white, UIColor.white],
            [UIColor.white, UIColor.white, UIColor.white, UIColor.white],
            [UIColor.white, UIColor.white, UIColor.white, UIColor.white],
            [UIColor.white, UIColor.white, UIColor.white, UIColor.white]
        ]
        
        answerImageArr = [
            [UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill")],
            [UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill")],
            [UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill")],
            [UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill")],
            [UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill")],
            [UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill")],
            [UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill"), UIImage(systemName: "circle.fill")]
        ]
        
        answerColorArr = [
            [UIColor.white, UIColor.white, UIColor.white, UIColor.white],
            [UIColor.white, UIColor.white, UIColor.white, UIColor.white],
            [UIColor.white, UIColor.white, UIColor.white, UIColor.white],
            [UIColor.white, UIColor.white, UIColor.white, UIColor.white],
            [UIColor.white, UIColor.white, UIColor.white, UIColor.white],
            [UIColor.white, UIColor.white, UIColor.white, UIColor.white],
            [UIColor.white, UIColor.white, UIColor.white, UIColor.white]
        ]
        
        x = 0
        y = 0
        
        gameBoardTBView.reloadData()
        
        //print("result: \(a) \(b) \(c) \(d)")
    }
    
    private func checkGame() {
        
        var checking = [false,false,false,false]
        
        // check the first time if correct position and color
        for (i, _) in result.enumerated() {
                    
            for (j, _) in result.enumerated() {
                
                if (selectColorArr[x][i] == result[j] && i == j) {
                    answerImageArr[x][i] = blackKey
                    answerColorArr[x][i] = COLORS[1]
                    checking[i] = true
                    break
                }
            }
        }
        
        // check the second time if correct color but incorrect position
        for (i, _) in result.enumerated() {

            if(!checking[i]) {
                
                for (j, _) in result.enumerated() {

                    if(!checking[j]) {
                        if (selectColorArr[x][i] == result[j]) {
                            answerImageArr[x][i] = whiteKey
                            answerColorArr[x][i] = COLORS[0]
                            break
                        }
                    }
                }
            }

            
        }
        
        if (checking == [true,true,true,true]) {
            endGame("Win")
        }
    }
    
    // when game is end, show the result
    private func endGame(_ result : String) {
        
        let alert = UIAlertController(title: "Mastermind", message: result, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default, handler: { [self]_ in baseSetting()}))

        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameBoardTBCell", for: indexPath) as! gameBoardTBCell
        
        print("cellForRowAt indexPath.row -> \(indexPath.row)")
        
        cell.colorConfigure(color1: selectColorArr[indexPath.row][0], color2: selectColorArr[indexPath.row][1], color3: selectColorArr[indexPath.row][2], color4: selectColorArr[indexPath.row][3])
        
        cell.Resultconfigure(result1: answerImageArr[indexPath.row][0]!, result2: answerImageArr[indexPath.row][1]!, result3: answerImageArr[indexPath.row][2]!, result4: answerImageArr[indexPath.row][3]!, color1: answerColorArr[indexPath.row][0], color2: answerColorArr[indexPath.row][1], color3: answerColorArr[indexPath.row][2], color4: answerColorArr[indexPath.row][3])
                        
        
        return cell
        
    }
    
}
