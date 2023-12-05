//
//  GameScene.swift
//  RandomGame
//
//  Created by Matteo Perotta on 05/12/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    //MARK: - Properties
    var ground: SKSpriteNode!
    var player: SKSpriteNode!
    var cameraNode = SKCameraNode()
    
    var cameraMovePointPerSecond: CGFloat = 450.0
    
    var lastUpdateTime: TimeInterval = 0.0
    var dt: TimeInterval = 0.0
    
    var playableRect: CGRect{
        let ratio: CGFloat
        switch UIScreen.main.nativeBounds.height{
        case 2688, 1792, 2436:
            ratio = 2.16
        default:
            ratio = 16/9
        }
        
        let playableHeight = size.width / ratio
        let playableMargin = 
        return CGRect(x: 0.0, y: playableMargin, width: size.width, height: playableHeight)
    }
    
    //MARK: - Systems
    
    override func didMove(to view: SKView) {
        setupNodes()
    }
    
    override func update(_ currentTime: TimeInterval) {
        if lastUpdateTime > 0{
            dt = currentTime - lastUpdateTime
            
        } else {
            dt = 0
        }
        
        lastUpdateTime = currentTime
        moveCamera()
        //print(dt)
    }
    
   
}

//MARK: - Configurations

extension GameScene {
    func setupNodes() {
        createBG()
        createGround()
        createPlayer()
        setupCamera()
    }
    
    func createBG() {
        for i in 0...2{
            let bg = SKSpriteNode(imageNamed: "background")
            bg.name = "BG"
            bg.anchorPoint = .zero
            bg.position = CGPoint(x: CGFloat(i)*bg.frame.width, y: 0.0  )
            bg.zPosition = -1.0
            addChild(bg)
        }
    }
    
    func createGround() {
        for i in 0...2{
            ground = SKSpriteNode(imageNamed: "ground")
            ground.name = "Ground"
            ground.anchorPoint = .zero
            ground.zPosition = 1.0
            ground.position = CGPoint(x: CGFloat(i)*ground.frame.width, y: 0.0)
            addChild(ground)
        }
    }
    
    func createPlayer(){
        player = SKSpriteNode(imageNamed: "ninja")
        player.name = "Player"
        player.zPosition = 5.0
        player.position = CGPoint(x: frame.width/2.0 - 100.0, y: ground.frame.height + player.frame.height / 2.0)
        addChild(player)
    }
    
    func setupCamera(){
        addChild(cameraNode)
        camera = cameraNode
        cameraNode.position = CGPoint(x: frame.midX, y: frame.midY)
    }
    
    func moveCamera(){
        let amountToMove = CGPoint(x: cameraMovePointPerSecond*CGFloat(dt), y:0.0)
        cameraNode.position += amountToMove
        //CGPoint(x: cameraNode.position.x + amountToMove.x, y: cameraNode.position.y + amountToMove.y)
        
        //Background
        enumerateChildNodes(withName: "BG") { (node, _) in
            let node = node as! SKSpriteNode
            
            if node.position.x + node.frame.width < self.cameraNode.frame.origin.x {
                node.position = CGPoint(x: node.position.x + node.frame.width * 2.0, y: node.position.y)
            }
        }
        //Ground
        enumerateChildNodes(withName: "Ground") { (node, _) in
            let node = node as! SKSpriteNode
            
            if node.position.x + node.frame.width < self.cameraNode.frame.origin.x {
                node.position = CGPoint(x: node.position.x + node.frame.width * 2.0, y: node.position.y)
            }
        }
    }
    
}
