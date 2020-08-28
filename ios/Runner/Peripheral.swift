import Foundation
import CoreBluetooth
import UIKit
import UserNotifications

let BLEGenericService = "36efb2e4-8711-4852-b339-c6b5dac518e0"
let BLERead  = "0ac637b0-9c14-4741-8f9f-b0baae77d0b4"
let BLEWrite = "4fec0357-2493-4901-b1a2-9e2ec21b9676"

protocol BLEPeripheralProtocol {
    func onData(peer: String, data: Data)
}


class BLEPeripheralManager : NSObject, CBPeripheralManagerDelegate {
    var localPeripheralManager: CBPeripheralManager! = nil
    var localService:CBService? = nil
    var createdService:CBService? = nil
    var peripheralDiscoverableName = ""
    var delegate:BLEPeripheralProtocol?
    var readCharacteristic:CBMutableCharacteristic?
    
    var powerOn = false
    
    init(bleDelegate: BLEPeripheralProtocol) {
        super.init()
        delegate = bleDelegate
    }
    
    func startBLEPeripheral(name: String) {
        peripheralDiscoverableName = name
        NSLog("[matrix] start Peripheral")
        NSLog("[matrix] Discoverable name : " + name)
        localPeripheralManager = CBPeripheralManager(delegate: self, queue: nil)
    }
    
    func stopBLEPeripheral() {
        NSLog("[matrix] Stop advertising")
        NSLog("[matrix] Stop peripheral Service")
        stopServices()
    }
    
    func stopServices() {
        NSLog("[matrix] Stopping BLE services...")
        self.localPeripheralManager.removeAllServices()
        self.localPeripheralManager.stopAdvertising()
    }
    
    func updateValue(data: Data) {
        NSLog("[matrix] updateValue, data " + String(data.count))
        localPeripheralManager.updateValue(data, for: readCharacteristic!, onSubscribedCentrals: nil)
    }
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager)
    {
        if (peripheral.state == .poweredOff) {
            NSLog("[matrix] peripheral is off")
            self.powerOn = false
            self.stopServices()
        }
        else {
            NSLog("[matrix] peripheral is on")
            self.powerOn = true
            self.startServices()
        }
    }
    
    func startServices() {
        NSLog("[matrix] starting services")
        NSLog("[matrix] Service UUID: " + BLEGenericService)
        NSLog("[matrix] Characteristic: read UUID: " + BLERead)
        NSLog("[matrix] Characteristic: write UUID: " + BLEWrite)
        
        readCharacteristic = CBMutableCharacteristic(type: CBUUID(string: BLERead), properties: [.indicate, .notify, .read], value: nil,
                                                     permissions: [.readable])
        
        let writeCharacteristic = CBMutableCharacteristic(type: CBUUID(string: BLEWrite), properties:[.writeWithoutResponse], value: nil, permissions:[.writeable])
        
        let serviceUUID = CBUUID(string: BLEGenericService)
        let service = CBMutableService(type: serviceUUID, primary: true)
        
        service.characteristics = [readCharacteristic!, writeCharacteristic]
        createdService = service
        
        localPeripheralManager.add(service)
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager,
                           didAdd service: CBService,
                           error: Error?){
        
        if error != nil {
            NSLog(("[matrix] Error adding services: \(String(describing: error?.localizedDescription))"))
        }
        else {
            NSLog("[matrix] service added to peripheral")
            localService = service
            let advertisement: [String : Any] = [CBAdvertisementDataLocalNameKey: self.peripheralDiscoverableName,
                                                 CBAdvertisementDataServiceUUIDsKey : [service.uuid]]
            self.localPeripheralManager.startAdvertising(advertisement)
            NSLog("[matrix] Starting to advertise.")
        }
    }
    
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager,
                                              error: Error?){
        if error != nil {
            NSLog(("[matrix] Error while advertising: \(String(describing: error?.localizedDescription))"))
        }
        else {
            NSLog("[matrix] advertising done. no error")
        }
    }
    
    // called when CBCentral manager request to read
    //
    func peripheralManager(_ peripheral: CBPeripheralManager,
                           didReceiveRead request: CBATTRequest) {
        NSLog("CB Central Manager request from central: ")
        print(request)
    }
    
    
    public func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveWrite requests: [CBATTRequest]) {
        if requests.count > 0 {
            NSLog("[matrix] value sent by central: " + requests[0].central.identifier.uuidString)
            delegate!.onData(peer: requests[0].central.identifier.uuidString, data: requests[0].value!)
        }
    }
}
