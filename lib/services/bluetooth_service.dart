import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
class BluetoothService {
  final FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;

  // Obtener dispositivos emparejados
  Future<List<BluetoothDevice>> getBondedDevices() async {
    return await _bluetooth.getBondedDevices();
  }

  // Habilitar Bluetooth si no está activo
  Future<void> enableBluetooth() async {
    if (!(await _bluetooth.isEnabled ?? false)) {
      await _bluetooth.requestEnable();
    }
  }

  // Conectarse a un dispositivo específico
  Future<BluetoothConnection> connectToDevice(BluetoothDevice device) async {
    return await BluetoothConnection.toAddress(device.address);
  }
}