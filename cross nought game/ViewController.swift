//
//  ViewController.swift
//  cross nought game
//
//  Created by Hajar Alomari on 01/12/2021.
// layout is not adaptive it only runs on iphone 13

import UIKit

class ViewController: UIViewController {
    
    //declare variables
    
    enum players{
        case cross
        case nought
    }
    
    var xBtn = UIImage(named:"onXbtn2.png")
                       
    var oBtn = UIImage(named: "onO.png")
    var emptyBtn = UIImage(named: "emptyCircle.png")
    
    var currentTurn = players.cross
    
    var board = [UIButton]()
    
    var xScoreCount: Int = 0
    var oScoreCount: Int = 0
    
    //declare UI elements
    @IBOutlet weak var Xplayer: UIImageView!
    
    @IBOutlet weak var Oplayer: UIImageView!
    
    @IBOutlet weak var XScore: UILabel!
    @IBOutlet weak var OScore: UILabel!
    
    @IBOutlet weak var XWins: UILabel!
    @IBOutlet weak var OWins: UILabel!
    
    @IBOutlet weak var XCrown: UIImageView!
    
    @IBOutlet weak var OCrown: UIImageView!
    
    
    @IBOutlet weak var WinnerView: UIView!
    
    @IBOutlet weak var WinnerLabel: UILabel!
    
    //button declarations
    @IBOutlet weak var A1: UIButton!
    @IBOutlet weak var A2: UIButton!
    @IBOutlet weak var A3: UIButton!
    
    
    @IBOutlet weak var B1: UIButton!
    @IBOutlet weak var B2: UIButton!
    @IBOutlet weak var B3: UIButton!
    
    @IBOutlet weak var C1: UIButton!
    @IBOutlet weak var C2: UIButton!
    @IBOutlet weak var C3: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Oplayer.image = UIImage(named: "onO.png")
        board.append(A1)
        board.append(A2)
        board.append(A3)
        
        board.append(B1)
        board.append(B2)
        board.append(B3)
        
        board.append(C1)
        board.append(C2)
        board.append(C3)
        
        
        for button in board{
        button.setImage(UIImage(named: "smallDark.png"), for: .normal)
        }
        XWins.isHidden = true
        OWins.isHidden = true
        XCrown.isHidden = true
        OCrown.isHidden = true
        WinnerView.isHidden = true
     
    }
    
    @IBAction func resetBtn(_ sender: UIButton) {
        for button in board{
        button.setImage(UIImage(named: "smallDark.png"), for: .normal)
            button.isEnabled = true
            XWins.isHidden = true
            OWins.isHidden = true
        }
        WinnerView.isHidden = true
      
    }
    
    @IBAction func CirclePressed(sender: UIButton) {
       // sender.setBackgroundImage(xBtn, for: UIControl.State.normal)
        addToBoard(sender: sender)
        
        if checkVictory(UIImage(named: "onXbtn.png")!){
            //XWins.isHidden = false
            WinnerView.isHidden = false
            WinnerLabel.text = "X Wins"
            xScoreCount += 1
            XScore.text = "Score: \(xScoreCount)"
            XCrown.isHidden = false
            OCrown.isHidden = true
            
            for button in board{
            button.isEnabled = false
            }
        }
        if checkVictory(UIImage(named: "onObtn.png")!){
           // OWins.isHidden = false
           
            oScoreCount += 1
            OScore.text = "Score: \(oScoreCount)"
            
            for button in board{
            button.isEnabled = false
            }
            XCrown.isHidden = true
            OCrown.isHidden = false
            WinnerView.isHidden = false
            WinnerLabel.text = "O Wins"
        }
        if checkIfFull(){
           // XWins.text = "Draw"
            WinnerView.isHidden = false
            WinnerLabel.text = "Draw"
            XCrown.isHidden = true
            OCrown.isHidden = true
        }
       
    }
    
    
    func addToBoard(sender: UIButton)
        {
            if sender.image(for: .normal) == UIImage(named: "smallDark.png"){
                
                if currentTurn == players.cross {
                    sender.setImage(UIImage(named: "onXbtn.png"), for: .normal)
                    
                   // sender.imageView?.contentMode = .scaleAspectFit
                    currentTurn = players.nought
                    Oplayer.image = UIImage(named: "onO.png")
                    Xplayer.image = UIImage(named: "offX.png")
                } else if currentTurn == players.nought{
                    sender.setImage(UIImage(named: "onObtn.png"), for: .normal)
                    Xplayer.image = UIImage(named: "onX.png")
                    Oplayer.image = UIImage(named: "offO.png")
                    currentTurn = players.cross
                }
                sender.isEnabled = false
            }
        }
    
    
    
    func checkVictory(_ image: UIImage) -> Bool{
        //horizontal win
        if checkImage(A1, image) && checkImage(A2, image) && checkImage(A3, image) {
            return true
        }
        
        if checkImage(B1, image) && checkImage(B2, image) && checkImage(B3, image) {
            return true
        }
        
        if checkImage(C1, image) && checkImage(C2, image) && checkImage(C3, image) {
            return true
        }
        
        //vertical wins
        
        if checkImage(A1, image) && checkImage(B1, image) && checkImage(C1, image) {
            return true
        }
        if checkImage(A2, image) && checkImage(B2, image) && checkImage(C2, image) {
            return true
        }
        if checkImage(A3, image) && checkImage(B3, image) && checkImage(C3, image) {
            return true
        }
        
        //diagonal win
        if checkImage(A1, image) && checkImage(B2, image) && checkImage(C3, image) {
            return true
        }
        if checkImage(A3, image) && checkImage(B2, image) && checkImage(C1, image) {
            return true
        }
        
        return false
    }
    
    //check value
    func checkImage(_ button: UIButton, _ image: UIImage) -> Bool
        {
            return button.image(for: .normal) == image
        }
    
    
    // check if board is full for draw
    func checkIfFull() -> Bool{
        for button in board{
            if button.image(for: .normal) == UIImage(named: "smallDark.png"){
                return false
            }
        }
        return true
    }
    

}



