//
//  GameScene.swift
//  JumpyLlama
//
//  Created by Student on 3/4/19.
//  Copyright © 2019 Jaron. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class GameScene : SKScene {
    let player = SKSpriteNode(imageNamed : "llama")
    var obstacleVelocity: CGFloat = -40.0
    var dt: CGFloat = 0.0
    var lastTime: CGFloat = 0.0
    var space: Int = 12
    var obstacles = [SKShapeNode]()
    var lowerBound = 20
    var upperBound = 200
    var gameLost = false
    
    override func didMove(to view : SKView){
        backgroundColor = UIColor(hue : 146/360, saturation : 20/100, brightness : 69/100, alpha : 1.0)
        player.position = CGPoint(x : size.width * 0.5, y : size.height * 0.5)
        player.size = CGSize(width : size.width * 0.1, height : size.width * 0.1)
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.allowsRotation = false
        let ground = SKShapeNode(rect : CGRect(x : 0, y : 0, width : size.width, height : 30))
        ground.physicsBody = SKPhysicsBody(rectangleOf: ground.frame.size)
        ground.physicsBody?.isDynamic = false
        ground.fillColor = UIColor(red: 23/255, green: 78/255, blue: 123/255, alpha: 1)
        addChild(ground)
        for i in obstacles {
            addChild(i)
        }
        addChild(player)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if player.physicsBody?.velocity.dy == 0 {
            player.physicsBody?.velocity = CGVector(dx: 0.0, dy: 700.0)
        }
        
    }
    override func update(_ currentTime: TimeInterval) {
        print("It updates!")
        if !gameLost {
            if lastTime > 0 {
                dt = CGFloat(currentTime) - lastTime
            } else {
                dt = 0
            }
            let aLocation = size.width + CGFloat(obstacles.count) * size.width / 5
            pushObstacle(xLocation : aLocation)
            popObstacle()
            moveObstacle(dt : dt)
            lastTime = CGFloat(currentTime)
            obstacleVelocity -= 0.1
        }
        
    }
    func pushObstacle(xLocation : CGFloat) {
        print("Jaron is the Jewish Version of Albert Einstein")
        let pint = Int.random(in: lowerBound...upperBound) + 70
        let obstacle = SKShapeNode(rectOf: CGSize(width : Int(size.width / 5), height : /*lowerBound + */pint))
        obstacle.position = CGPoint(x: xLocation, y: 0)
        //
        lowerBound += 10
        upperBound += 10
        obstacle.physicsBody = SKPhysicsBody(rectangleOf: obstacle.frame.size)
        obstacle.physicsBody?.isDynamic = false
        obstacle.fillColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        obstacles.append(obstacle)
        addChild(obstacle)
    }
    func popObstacle(){
        if !intersects(obstacles[0]) {
            print("Let's simliate")
            obstacles.remove(at : 0)
        }
    }
    func moveObstacle(dt : CGFloat) {
        if !intersects(player) {
            gameLost = true
        }
        for obstacle in obstacles{
            obstacle.position.x += obstacleVelocity * dt
//            if player.position.x == obstacle.position.x {
//                player.position.y = obstacle.position.y
//            }
        }
    }
}
