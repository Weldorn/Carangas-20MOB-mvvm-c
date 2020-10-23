//
//  CarangasSnapshotTests.swift
//  CarangasSnapshotTests
//
//  Created by Welton Dornelas on 22/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import Carangas

class CarangasSnapshotTests: FBSnapshotTestCase {
    
    var sut: CarVisualizationViewController!
    var car: Car = {
        var car = Car()
        car.name = "Civic"
        car.brand = "Honda"
        car.price = 25000
        car.gasType = 0
        return car
    }()
    
    override func setUp() {
        super.setUp()
        recordMode = false
        fileNameOptions = [.device, .screenSize, .OS]
        usesDrawViewHierarchyInRect = true
        sut = CarVisualizationViewController.instantiateFromStoryboard(.visualization)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testView() {
        //Given
        sut.viewModel = CarVisualizationViewModel(car: car)
        
        //When
        sut.beginAppearanceTransition(true, animated: false)
        
        //Then
        FBSnapshotVerifyView(sut.view)
    }

}
