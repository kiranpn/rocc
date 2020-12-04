//
//  FocusMode+PTPPropValueConvertable.swift
//  Rocc
//
//  Created by Simon Mitchell on 10/11/2019.
//  Copyright © 2019 Simon Mitchell. All rights reserved.
//

import Foundation

extension Flash.Mode.Value: PTPPropValueConvertable {
    
    static func devicePropertyCode(for manufacturer: Manufacturer) -> PTP.DeviceProperty.Code {
        switch manufacturer {
        case .sony:
            return .flashMode
        case .canon:
            //TODO: [Canon] Implement
            return .flashMode
        }
    }
    
    init?(value: PTPDevicePropertyDataType, manufacturer: Manufacturer) {
        switch manufacturer {
        case .sony:
            guard let intValue = value.toInt else { return nil }
            switch intValue {
            case 0x0003:
                self = .fill
            case 0x8001:
                self = .slowSynchro
            case 0x8003:
                self = .rearSync
            case 0x0001:
                self = .auto
            case 0x0002:
                self = .off
            default:
                return nil
            }
        case .canon:
            //TODO: [Canon] Implement
            return nil
        }
    }
    
    func value(for manufacturer: Manufacturer) -> PTPDevicePropertyDataType {
        switch manufacturer {
        case .sony:
            switch self {
            case .fill:
                return Word(0x0003)
            case .slowSynchro:
                return Word(0x8001)
            case .rearSync:
                return Word(0x8003)
            case .auto:
                return Word(0x0001)
            case .off:
                return Word(0x0002)
            default:
                return Word(0)
            }
        case .canon:
            return Word(0)
            //TODO: [Canon] Implement
        }
    }
}
