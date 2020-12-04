//
//  VideoCaptureFormat+PTPPropValueConvertable.swift
//  Rocc
//
//  Created by Simon Mitchell on 11/03/2020.
//  Copyright © 2020 Simon Mitchell. All rights reserved.
//

import Foundation

extension VideoCapture.FileFormat.Value: PTPPropValueConvertable {
    
    static func devicePropertyCode(for manufacturer: Manufacturer) -> PTP.DeviceProperty.Code {
        switch manufacturer {
        case .sony:
            return .movieFormat
        case .canon:
            //TODO: [Canon] Implement!
            return .movieFormat
        }
    }
    
    init?(value: PTPDevicePropertyDataType, manufacturer: Manufacturer) {
        
        switch manufacturer {
        case .sony:
            guard let binaryInt = value.toInt else {
                return nil
            }
            
            switch binaryInt {
            case 0x00:
                self = .none
            case 0x01:
                self = .dvd
            case 0x02:
                self = .m2ps
            case 0x03:
                self = .avchd
            case 0x04:
                self = .mp4
            case 0x05:
                self = .dv
            case 0x06:
                self = .xavc
            case 0x07:
                self = .mxf
            case 0x08:
                self = .xavc_s_4k
            case 0x09:
                self = .xavc_s_hd
            case 0x0a:
                self = .xavc_hs_8k
            case 0x0b:
                self = .xavc_hs_4k
            case 0x0c:
                self = .xavc_s_4k_alt
            case 0x0d:
                self = .xavc_s_hd_alt
            case 0x0e:
                self = .xavc_si_4k
            case 0x0f:
                self = .xavc_si_hd
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
            case .none:
                return Byte(0x00)
            case .dvd:
                return Byte(0x01)
            case .m2ps:
                return Byte(0x02)
            case .avchd:
                return Byte(0x03)
            case .mp4:
                return Byte(0x04)
            case .dv:
                return Byte(0x05)
            // These aren't different in PTP/IP on Sony cameras
            case .xavc, .xavc_s:
                return Byte(0x06)
            case .mxf:
                return Byte(0x07)
            case .xavc_s_4k:
                return Byte(0x08)
            case .xavc_s_hd:
                return Byte(0x09)
            case .xavc_hs_8k:
                return Byte(0x0a)
            case .xavc_hs_4k:
                return Byte(0x0b)
            case .xavc_s_4k_alt:
                return Byte(0x0c)
            case .xavc_s_hd_alt:
                return Byte(0x0d)
            case .xavc_si_4k:
                return Byte(0x0e)
            case .xavc_si_hd:
                return Byte(0x0f)
            }
        case .canon:
            //TODO: [Canon] Implement
            return Byte(0)
        }
    }
}
