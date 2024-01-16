// import 'package:network_info_plus/network_info_plus.dart';
// import 'package:network_tools/network_tools.dart';

// final info = NetworkInfo();

// testNetworkInfo()async{
//    try {
// final wifiName = await info.getWifiName(); // "FooNetwork"
// final wifiBSSID = await info.getWifiBSSID(); // 11:22:33:44:55:66
// final wifiIP = await info.getWifiIP(); // 192.168.1.43
// final wifiIPv6 = await info.getWifiIPv6(); // 2001:0db8:85a3:0000:0000:8a2e:0370:7334
// final wifiSubmask = await info.getWifiSubmask(); // 255.255.255.0
// final wifiBroadcast = await info.getWifiBroadcast(); // 192.168.1.255
// final wifiGateway = await info.getWifiGatewayIP(); // 192.168.1.1

// print(wifiIP);
//      String address = '192.168.0.183';
//   // or You can also get address using network_info_plus package
//   // final String? address = await (NetworkInfo().getWifiIP());
//   final String subnet = address.substring(0, address.lastIndexOf('.'));
//   final stream = HostScanner.getAllPingableDevices(subnet, firstHostId: 1, lastHostId: 50,
//       progressCallback: (progress) {
//     print('Progress for host discovery : $progress');
//   });

//   stream.listen((host) {
//     //Same host can be emitted multiple times
//     //Use Set<ActiveHost> instead of List<ActiveHost>
//     print('Found device: ${host}');
//   }, onDone: () {
//     print('Scan completed');
//   }); // Don't forget to cancel the stream when not in use.
 
//    } catch (e) {
//      print(e); 
//    }
  
// }