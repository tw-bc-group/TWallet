import UIKit
import Flutter

class StreamHandler: NSObject,FlutterStreamHandler {
    var eventSink: FlutterEventSink!
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        eventSink = events
        return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        eventSink = nil
        return nil
    }
}

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, BLEPeripheralProtocol {
    func onData(peer: String, data: Data) {
        if dataStreamHandler.eventSink != nil {
            NSLog("[matrix] delegate onData, peer: " + peer)
            dataStreamHandler.eventSink(["device": peer, "data": FlutterStandardTypedData(bytes: data)])
        }
    }
    
    private var peripheral: BLEPeripheralManager!
    private var dataStreamHandler: StreamHandler!
    private var stateStreamHandler: StreamHandler!
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        let methodChannel = FlutterMethodChannel(name: "matrix.ble_periphery/method", binaryMessenger: controller.binaryMessenger)
        methodChannel.setMethodCallHandler({
            [weak self](call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            switch call.method {
            case "startAdvertising":
                self?.startAdvertising(name: call.arguments as! String, result: result)
            case "stopAdvertising":
                self?.stopAdvertising(result: result)
            case "sendData":
                self?.updateValue(dict: call.arguments as! Dictionary<String, Any>)
            default:
                break
            }
        })
        
        dataStreamHandler = StreamHandler()
        stateStreamHandler = StreamHandler()
        
        FlutterEventChannel(name: "matrix.ble_periphery/data", binaryMessenger: controller.binaryMessenger).setStreamHandler(dataStreamHandler)
        FlutterEventChannel(name: "matrix.ble_periphery/state", binaryMessenger: controller.binaryMessenger).setStreamHandler(stateStreamHandler)
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func startAdvertising(name: String, result: FlutterResult) {
        if nil == peripheral {
            NSLog("starting peripheral")
            peripheral = BLEPeripheralManager(bleDelegate: self)
            peripheral!.startBLEPeripheral(name: name)
        }
        result(true)
    }
    
    private func stopAdvertising(result: FlutterResult) {
        if nil != peripheral {
            peripheral.stopBLEPeripheral()
            peripheral = nil
        }
        result(true)
    }
    
    private func updateValue(dict: Dictionary<String, Any>) {
        if nil != peripheral {
            let data = dict["data"] as! FlutterStandardTypedData
            peripheral.updateValue(data: data.data)
        }
    }
}
