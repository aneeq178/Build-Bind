// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
//
// class GoogleMapScreen extends StatefulWidget {
//   @override
//   _GoogleMapScreenState createState() => _GoogleMapScreenState();
// }
//
// class _GoogleMapScreenState extends State<GoogleMapScreen> {
//   GoogleMapController? _mapController;
//   LatLng? _selectedLocation;
//   Marker? _marker;
//
//   void _onMapCreated(GoogleMapController controller) {
//     _mapController = controller;
//   }
//
//   void _onTap(LatLng position) {
//     setState(() {
//       _selectedLocation = position;
//       _marker = Marker(
//         markerId: MarkerId('selectedLocation'),
//         position: position,
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Maps Example'),
//       ),
//       body: GoogleMap(
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: CameraPosition(
//           target: LatLng(37.7749, -122.4194), // Default to San Francisco
//           zoom: 10,
//         ),
//         markers: _marker != null ? {_marker!} : {},
//         onTap: _onTap,
//       ),
//     );
//   }
// }
