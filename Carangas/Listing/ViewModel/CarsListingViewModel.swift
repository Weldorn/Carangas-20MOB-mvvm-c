//
//  CarsListingViewModel.swift
//  Carangas
//
//  Created by Eric Alves Brito on 15/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation

class CarsListingViewModel {
    
    private var cars: [Car] = [] {
        didSet {
            carsDidUpdate?()
        }
    }
    private var service: CarApiProtocol
    
    var carsDidUpdate: (() -> Void)?
 
    var count: Int {
        cars.count
    }
    
    init(service: CarApiProtocol = CarAPI()) {
        self.service = service
    }
    
    func loadCars() {
        service.loadCars { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let cars):
                self.cars = cars
            case .failure:
                self.carsDidUpdate?()
            }
        }
    }
    
    private func getCar(at indexPath: IndexPath) -> Car {
        cars[indexPath.row]
    }
    
    func cellViewModelFor(_ indexPath: IndexPath) -> CarCellViewModel {
        CarCellViewModel(car: getCar(at: indexPath))
    }
    
    func deleteCar(at indexPath: IndexPath, onComplete: @escaping (Result<Void, APIError>)->Void) {
        let car = getCar(at: indexPath)
        service.deleteCar(car) { [weak self] (result) in
            switch result {
            case .success:
                self?.cars.remove(at: indexPath.row)
            case .failure:
                break
            }
            onComplete(result)
        }
    }
    
    func getCarVisualizationViewModelFor(_ indexPath: IndexPath) -> CarVisualizationViewModel {
        CarVisualizationViewModel(car: getCar(at: indexPath))
    }
}
