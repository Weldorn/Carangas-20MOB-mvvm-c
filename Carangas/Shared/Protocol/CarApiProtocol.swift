//
//  CarApiProtocol.swift
//  Carangas
//
//  Created by Welton Dornelas on 22/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation

protocol CarApiProtocol {
    func loadCars(onComplete: @escaping (Result<[Car], APIError>) -> Void)
    func deleteCar(_ car: Car, onComplete: @escaping (Result<Void, APIError>) -> Void)
}
