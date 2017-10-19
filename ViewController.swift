//
//  ViewController.swift
//  TicTacToe
//
//  Created by Sang Luu on 9/10/17.
//  Copyright © 2017 Sang Luu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let numViewPerRow = 9
    
    var numViewPerCol = Int()
    
    var count = Int()
    
    var width = CGFloat()
    
    var HorizontalStack = Int()
    
    var HorizontalPoint1 = CGPoint()
    
    var HorizontalPoint2 = CGPoint()
    
    
    var VerticalStack = Int()
    
    var VerticalPoint1 = CGPoint()
    
    var VerticalPoint2 = CGPoint()

    
    var LeftDiagonalStack = Int()
    
    var LeftDiagonalPoint1 = CGPoint()
    
    var LeftDiagonalPoint2 = CGPoint()

    
    var RightDiagonalStack = Int()
    
    var RightDiagonalPoint1 = CGPoint()
    
    var RightDiagonalPoint2 = CGPoint()

    
    var cells = [String: CellView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        width = CGFloat(view.frame.width / CGFloat(numViewPerRow))
        numViewPerCol = Int(view.frame.height / width)
        count = 0
        
        for j in 0...numViewPerCol{
            for i in 0...numViewPerRow{
                let cellView = CellView(frame: CGRect(x: CGFloat(i) * width, y: CGFloat(j) * width, width: width, height: width))
                cellView.backgroundColor = UIColor.clear
                cellView.layer.borderColor = UIColor.black.cgColor
                cellView.layer.borderWidth = CGFloat(0.5)
                cellView.posX = i
                cellView.posY = j

                let key = "\(i)|\(j)"
                cells[key] = cellView
                
                view.addSubview(cellView)
            }
        }
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc func handleTap(gesture: UITapGestureRecognizer){
        let location = gesture.location(in: view)
        
        let i = Int(location.x / width)
        let j = Int(location.y / width)
        
        let key = "\(i)|\(j)"
        guard let cellView = cells[key] else {
            return
        }
        
        if !cellView.isMarked{
            if count % 2 == 0{
                let nought = Nought(frame: cellView.frame)
                nought.tag = i + j * numViewPerRow
                view.addSubview(nought)
                cellView.type = 0 // 0 for nought
            }else{
                let cross = Cross(frame: cellView.frame)
                cross.tag = i + j * numViewPerRow
                view.addSubview(cross)
                cellView.type = 1 // 1 for cross
            }
            cellView.isMarked = true
            
            count += 1
            CheckGameState(with: cellView)
        }
    }
    
    func CheckGameState(with cell: CellView){
        CheckAdjacentStatus(of: cell)
        if HorizontalStack >= 5 || VerticalStack >= 5 || LeftDiagonalStack >= 5 || RightDiagonalStack >= 5 {
            
            
            
            let alertController = UIAlertController(title: "Hurray", message: "\(cell.type == 0 ? "O" : "X") wins!", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "Again", style: .default) { (_) in
                self.resetGame()
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
            
            alertController.addAction(confirmAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func drawOverWiningStack(){
        
    }
    
       
    func resetGame(){
        for j in 0...numViewPerCol{
            for i in 0...numViewPerRow{
                
                let key = "\(i)|\(j)"
                guard let cellView = cells[key] else{
                    return
                }
                
                if cellView.isMarked{
                    
                    if let viewWithTag = view.viewWithTag(i + j * numViewPerRow){
                        viewWithTag.removeFromSuperview()
                    }
                    
                    let newCell = CellView(frame: CGRect(x: CGFloat(i) * width, y: CGFloat(j) * width, width: width, height: width))
                    newCell.backgroundColor = UIColor.clear
                    newCell.layer.borderColor = UIColor.black.cgColor
                    newCell.layer.borderWidth = CGFloat(0.5)
                    newCell.posX = i
                    newCell.posY = j
                    
                    cells[key] = newCell
                    
                    view.addSubview(newCell)

                }
                
            }
        }

    }

}

class CellView: UIView{

    var isMarked = false
    
    var type = Int()
    
    var posX = Int()
    var posY = Int()

}
















