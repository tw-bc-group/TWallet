package com.example.tw_wallet_ui

import android.bluetooth.*
import android.bluetooth.le.AdvertiseCallback
import android.bluetooth.le.AdvertiseData
import android.bluetooth.le.AdvertiseSettings
import android.bluetooth.le.BluetoothLeAdvertiser
import android.content.Context
import android.os.Handler
import android.os.Looper
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.*
import java.util.stream.Stream
import kotlin.concurrent.timer
import io.flutter.plugin.common.EventChannel as PluginCommonEventChannel

class StreamHandler : PluginCommonEventChannel.StreamHandler {
    var eventSink: PluginCommonEventChannel.EventSink? = null

    override fun onListen(p0: Any?, p1: PluginCommonEventChannel.EventSink?) {
        this.eventSink = p1
    }

    override fun onCancel(p0: Any?) {
        this.eventSink = null
    }
}


class MainActivity : FlutterActivity() {
    private val _tag = "ble_periphery"
    private var _isAdvertising = false
    private val _dataChannel = "matrix.ble_periphery/data"
    private val _stateChannel = "matrix.ble_periphery/state"
    private val _methodChannel = "matrix.ble_periphery/method"
    private val _advertiseData = AdvertiseData.Builder().setIncludeDeviceName(true).setIncludeTxPowerLevel(false).build()
    private var _bluetoothAdvertiser: BluetoothLeAdvertiser? = null
    private var _bluetoothGattServer: BluetoothGattServer? = null
    private val _uuidService = UUID.fromString("36efb2e4-8711-4852-b339-c6b5dac518e0")
    private val _uuidCharRead = UUID.fromString("0ac637b0-9c14-4741-8f9f-b0baae77d0b4")
    private val _uuidCharWrite = UUID.fromString("4fec0357-2493-4901-b1a2-9e2ec21b9676")
    private var _registeredDevices = HashMap<String, BluetoothDevice>()
    private var _characteristicRead: BluetoothGattCharacteristic? = null
    private var _dataStreamHandler: StreamHandler? = null
    private var _stateStreamHandler: StreamHandler? = null
    private var _checkAdapterNameTimer: Timer? = null

    private val _advertiseCallback = object : AdvertiseCallback() {
        override fun onStartSuccess(settingsInEffect: AdvertiseSettings) {
            super.onStartSuccess(settingsInEffect)
            addServices()
            _isAdvertising = true
        }

        override fun onStartFailure(errorCode: Int) {
            super.onStartFailure(errorCode)
            val statusText: String

            when (errorCode) {
                ADVERTISE_FAILED_ALREADY_STARTED -> {
                    statusText = "ADVERTISE_FAILED_ALREADY_STARTED"
                    _isAdvertising = true
                }
                ADVERTISE_FAILED_FEATURE_UNSUPPORTED -> {
                    statusText = "ADVERTISE_FAILED_FEATURE_UNSUPPORTED"
                    _isAdvertising = false
                }
                ADVERTISE_FAILED_INTERNAL_ERROR -> {
                    statusText = "ADVERTISE_FAILED_INTERNAL_ERROR"
                    _isAdvertising = false
                }
                ADVERTISE_FAILED_TOO_MANY_ADVERTISERS -> {
                    statusText = "ADVERTISE_FAILED_TOO_MANY_ADVERTISERS"
                    _isAdvertising = false
                }
                ADVERTISE_FAILED_DATA_TOO_LARGE -> {
                    statusText = "ADVERTISE_FAILED_DATA_TOO_LARGE"
                    _isAdvertising = false
                }

                else -> {
                    statusText = "UNDOCUMENTED"
                }
            }

            Log.e(_tag, "ERROR while starting advertising: $errorCode - $statusText")
            _isAdvertising = false
        }
    }


    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, _methodChannel).setMethodCallHandler { call, result ->
            when (call.method) {
                "startAdvertising" -> {
                    startAdvertising(call.arguments())
                    result.success(true)
                }
                "stopAdvertising" -> {
                    stopAdvertising()
                    result.success(true)
                }
                "sendData" -> {
                    sendData(call.argument<String>("device")!!, call.argument<ByteArray>("data")!!)
                    result.success(true)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }

        _dataStreamHandler = StreamHandler()
        _stateStreamHandler = StreamHandler()

        PluginCommonEventChannel(flutterEngine.dartExecutor.binaryMessenger, _dataChannel).setStreamHandler(_dataStreamHandler)
        PluginCommonEventChannel(flutterEngine.dartExecutor.binaryMessenger, _stateChannel).setStreamHandler(_stateStreamHandler)

    }

    private fun buildAdvertiseSettings(): AdvertiseSettings {
        return AdvertiseSettings.Builder()
                .setConnectable(true)
                .setTimeout(0)
                .setTxPowerLevel(AdvertiseSettings.ADVERTISE_TX_POWER_LOW)
                .setAdvertiseMode(AdvertiseSettings.ADVERTISE_MODE_LOW_LATENCY)
                .build()
    }

    private val gattServerCallback: BluetoothGattServerCallback = object : BluetoothGattServerCallback() {
        override fun onConnectionStateChange(device: BluetoothDevice, status: Int, newState: Int) {
            Log.d(_tag, "onConnectionStateChange device=${device.name} newState=$newState")
            if (newState == BluetoothProfile.STATE_CONNECTED) {
                _registeredDevices[device.toString()] = device
            } else if (newState == BluetoothProfile.STATE_DISCONNECTED) {
                _registeredDevices.remove(device.toString())
            }
            Handler(Looper.getMainLooper()).post {
                _stateStreamHandler?.eventSink?.success(hashMapOf("device" to device.toString(), "state" to newState))
            }
        }

        override fun onCharacteristicWriteRequest(device: BluetoothDevice?, requestId: Int, characteristic: BluetoothGattCharacteristic, preparedWrite: Boolean, responseNeeded: Boolean, offset: Int, value: ByteArray?) {
            super.onCharacteristicWriteRequest(device, requestId, characteristic, preparedWrite, responseNeeded, offset, value)
            _bluetoothGattServer!!.sendResponse(device, requestId, BluetoothGatt.GATT_SUCCESS, offset, characteristic.value)
            Log.d(_tag, "$device received: ${String(value!!)}")
            Handler(Looper.getMainLooper()).post {
                _dataStreamHandler?.eventSink?.success(hashMapOf("device" to device.toString(), "data" to value))
            }
        }
    }

    private fun sendData(device: String, data: ByteArray) {
        if (_registeredDevices[device] != null) {
            Log.d(_tag, "sendData, data size: ${data.size}")
            _characteristicRead?.value = data
            _bluetoothGattServer?.notifyCharacteristicChanged(_registeredDevices[device], _characteristicRead, true)
        }
    }

    private fun addServices() {
        val gattService = BluetoothGattService(_uuidService, BluetoothGattService.SERVICE_TYPE_PRIMARY)

        _characteristicRead = BluetoothGattCharacteristic(_uuidCharRead,
                BluetoothGattCharacteristic.PROPERTY_READ or BluetoothGattCharacteristic.PROPERTY_NOTIFY,
                BluetoothGattCharacteristic.PERMISSION_READ)

        gattService.addCharacteristic(_characteristicRead)

        gattService.addCharacteristic(BluetoothGattCharacteristic(_uuidCharWrite,
                BluetoothGattCharacteristic.PROPERTY_WRITE
                        or BluetoothGattCharacteristic.PROPERTY_NOTIFY,
                BluetoothGattCharacteristic.PERMISSION_WRITE))

        _bluetoothGattServer = (context.getSystemService(Context.BLUETOOTH_SERVICE) as BluetoothManager).openGattServer(this, gattServerCallback)
        _bluetoothGattServer!!.addService(gattService)
    }

    private fun startAdvertising(name: String) {
        (context.getSystemService(Context.BLUETOOTH_SERVICE) as BluetoothManager).adapter.name = name

        _checkAdapterNameTimer = timer(initialDelay = 1000, period = 500) {
            val bluetoothAdapter = (context.getSystemService(Context.BLUETOOTH_SERVICE) as BluetoothManager).adapter
            Log.d(_tag, "checkAdapterName, name: ${(context.getSystemService(Context.BLUETOOTH_SERVICE) as BluetoothManager).adapter.name}")
            if (bluetoothAdapter.name == name || !bluetoothAdapter.isEnabled) {
                _checkAdapterNameTimer!!.cancel()
                _checkAdapterNameTimer = null
                if (_bluetoothAdvertiser == null && bluetoothAdapter.isEnabled) {
                    _bluetoothAdvertiser = bluetoothAdapter.bluetoothLeAdvertiser
                    _bluetoothAdvertiser!!.startAdvertising(buildAdvertiseSettings(), _advertiseData, _advertiseCallback)
                    Log.d(_tag, "startAdvertising, name: $name")
                }
            }
        }

    }

    private fun stopAdvertising() {
        _bluetoothGattServer!!.close()
        _bluetoothAdvertiser!!.stopAdvertising(_advertiseCallback)
        _bluetoothAdvertiser = null
        if (null != _checkAdapterNameTimer) {
            _checkAdapterNameTimer?.cancel()
            _checkAdapterNameTimer = null
        }
        _isAdvertising = false
        Log.d(_tag, "stopAdvertising, name: ${(context.getSystemService(Context.BLUETOOTH_SERVICE) as BluetoothManager).adapter.name}")
    }
}
