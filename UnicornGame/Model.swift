//
//  Model.swift
//  UnicornGame
//
//  Created by Irwin Gonzales on 11/29/21.
//

import Foundation
import UIKit
import RealityKit
import Combine

class Model {
    var modelName: String
    var image: UIImage
    var modelEntity: ModelEntity?
    
    private var cancellable: AnyCancellable? = nil
    
    init(modelName: String) {
        self.modelName = modelName
        
        self.image = UIImage(named: modelName)!
        
        let fileName = modelName + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: fileName).sink(receiveCompletion: { loadCompletion in
            // Handle Error
        }, receiveValue: { modelEntity in
            // Get entity
            self.modelEntity = modelEntity
            print("DEBUG: Succescfully loaded modelEntity for modelName: \(self.modelEntity)")
        })
    }
}
