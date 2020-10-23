//
//  CarsListingViewModelTests.swift
//  CarangasTests
//
//  Created by Welton Dornelas on 22/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import XCTest
@testable import Carangas

class CarsListingViewModelTests: XCTestCase {
    
    //System Under Test
    var sut: CarsListingViewModel!
    
    override func setUp() {
        super.setUp()
        sut = CarsListingViewModel(service: CarApiStub())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testCount() {
        //Given
        
        
        //When
        sut.loadCars()
        
        //Then
        let expectedResult = 8
        XCTAssertEqual(sut.count, expectedResult, "Total de carros diferente do esperado")
    }
    
    func testFirstCarInfo() {
        //Given
        let indexPath = IndexPath(row: 0, section: 0)
        
        //When
        sut.loadCars()
        let carVisualizationViewModel = sut.getCarVisualizationViewModelFor(indexPath)
        
        //Then
        XCTAssertEqual(carVisualizationViewModel.title, "M3", "Nome do carro errado")
        XCTAssertEqual(carVisualizationViewModel.brand, "Marca: Acura", "Marca do carro errada")
    }

}
