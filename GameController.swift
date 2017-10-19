//
//  GameController.swift
//  TicTacToe
//
//  Created by Sang Luu on 9/12/17.
//  Copyright © 2017 Sang Luu. All rights reserved.
//

import UIKit

extension ViewController{

    func CheckAdjacentStatus(of cell: CellView){
        CheckHorizontal(of: cell)
        CheckVertical(of: cell)
        CheckDiagonal(of: cell)
    }
    
    func CheckHorizontal(of cell: CellView){
        HorizontalStack = 1
        CheckHorizontal(of: cell, with: 1, and: cell.posX < numViewPerRow)
        CheckHorizontal(of: cell, with: -1, and: cell.posX > 0)
    }
    
    func CheckVertical(of cell: CellView){
        VerticalStack = 1
        CheckVertical(of: cell, with: -1, and: cell.posY > 0)
        CheckVertical(of: cell, with: 1, and: cell.posY < numViewPerCol)
    }
    
    func CheckDiagonal(of cell:CellView){
        LeftDiagonalStack = 1
        CheckLeftDiagonal(of: cell, with: -1, and: cell.posY > 0 && cell.posX > 0)
        CheckLeftDiagonal(of: cell, with: 1, and: cell.posY < numViewPerCol && cell.posX < numViewPerRow)
        
        RightDiagonalStack = 1
        CheckRightDiagonal(of: cell, with: 1, and: cell.posY > 0 && cell.posX < numViewPerRow )
        CheckRightDiagonal(of: cell, with: -1, and: cell.posY > 0 && cell.posX < numViewPerRow)
    }
    
    func CheckHorizontal(of cell: CellView, with iteration: Int, and condition: Bool){
        if condition{
            let key = "\(cell.posX + iteration)|\(cell.posY)"
            guard let cellNext = cells[key] else {
                return
            }
            if iteration > 0 {
                HorizontalPoint1 = CGPoint(x: cell.posX, y: cell.posY)
            } else {
                HorizontalPoint2 = CGPoint(x: cell.posX, y: cell.posY)
            }
            if cellNext.isMarked && cellNext.type == cell.type{
                HorizontalStack += 1
                CheckHorizontal(of: cellNext, with: iteration, and: condition)
            } else{
                return
            }
        }
    }
    
    
    func CheckVertical(of cell: CellView, with iteration: Int, and condition: Bool){
        if condition {
            let key = "\(cell.posX)|\(cell.posY + iteration)"
            guard let cellTop = cells[key] else{
                return
            }
            if iteration > 0 {
                VerticalPoint1 = CGPoint(x: cell.posX, y: cell.posY)
            } else {
                VerticalPoint2 = CGPoint(x: cell.posX, y: cell.posY)
            }
            if cellTop.isMarked && cellTop.type == cell.type{
                VerticalStack += 1
                CheckVertical(of: cellTop, with: iteration, and: condition)
            } else {
                return
            }
        }
    }
    
    
    func CheckLeftDiagonal(of cell: CellView, with iteration: Int, and condition: Bool){
        if condition{
            let key = "\(cell.posX + iteration)|\(cell.posY + iteration)"
            guard let cellLeft = cells[key] else{
                return
            }
            if iteration > 0 {
                LeftDiagonalPoint1 = CGPoint(x: cell.posX, y: cell.posY)
            } else {
                LeftDiagonalPoint2 = CGPoint(x: cell.posX, y: cell.posY)
            }
            if cellLeft.isMarked && cellLeft.type == cell.type{
                LeftDiagonalStack += 1
                CheckLeftDiagonal(of: cellLeft, with: iteration, and: condition)
            } else {
                return
            }
        }
    }
    
    func CheckRightDiagonal(of cell: CellView, with iteration: Int, and condition: Bool){
        if cell.posY > 0 && cell.posX < numViewPerRow{
            let key = "\(cell.posX - iteration)|\(cell.posY + iteration)"
            guard let cellRight = cells[key] else{
                return
            }
            if iteration > 0 {
                RightDiagonalPoint1 = CGPoint(x: cell.posX, y: cell.posY)
            } else {
                RightDiagonalPoint2 = CGPoint(x: cell.posX, y: cell.posY)
            }
            if cellRight.isMarked && cellRight.type == cell.type{
                RightDiagonalStack += 1
                CheckRightDiagonal(of: cellRight, with: iteration, and: condition)
            } else {
                return
            }
        }
    }

}

