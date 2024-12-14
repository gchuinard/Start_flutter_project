import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'bluetooth_event.dart';
import 'bluetooth_state.dart';
import '../../repositories/bluetooth_repository.dart';

class BluetoothBloc extends Bloc<BluetoothEvent, BluetoothState> {
  final BluetoothRepository bluetoothRepository;

  BluetoothBloc(this.bluetoothRepository) : super(BluetoothInitialState()) {
    on<StartScanEvent>((event, emit) async {
      emit(BluetoothScanningState());
      try {
        final devices = await bluetoothRepository.scanDevices().first;
        emit(BluetoothDevicesFoundState(devices));
      } catch (e) {
        emit(BluetoothErrorState(e.toString()));
      }
    });

    on<DeviceSelectedEvent>((event, emit) async {
      try {
        await bluetoothRepository.connectToDevice(event.device);
        emit(BluetoothConnectedState(event.device));
      } catch (e) {
        emit(BluetoothErrorState(e.toString()));
      }
    });
  }
}
