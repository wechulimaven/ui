// import 'dart:async';

// // import 'package:fluster/fluster.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class StationFinder extends StatefulWidget {
//   @override
//   _StationFinderState createState() => _StationFinderState();
// }

// class _StationFinderState extends State<StationFinder> {
//   Completer<GoogleMapController> _controller = Completer();

//   static const LatLng _center = LatLng(-0.5290732, 34.6539622);
// // LatLng(-0.5290732,34.6539622)
//  List<Marker> markers = [];
//   List<LatLng> _positions = [
//     LatLng(-0.5290732, 34.6539622),
//     LatLng(-0.8404538, 34.5965139),
//     LatLng(-0.8228906, 34.613101),
//     LatLng(-0.678748, 34.3923565),
//     LatLng(-0.7385693, 34.5419673),
//     LatLng(-0.5290732, 34.6539622),
//     LatLng(-0.8228906, 34.613101),
//   ];

//   void _onMapCreated(GoogleMapController controller) {
//     _controller.complete(controller);
//   }

//   MapType _currentMapType = MapType.normal;

//   final Set<Marker> _markers = {};
//   LatLng _lastMapPosition = _center;
 

//   void _onCameraMove(CameraPosition position) {
//     _lastMapPosition = position.target;
//   }

//   void _onMapTypeButtonPressed() {
//     setState(() {
//       _currentMapType = _currentMapType == MapType.normal
//           ? MapType.satellite
//           : MapType.normal;
//     });
//   }

  

//   void _onAddMarkerButtonPressed() {
//     setState(() {
//       _markers.add(Marker(
//         // This marker id can be anything that uniquely identifies each marker.
//         markerId: MarkerId(_lastMapPosition.toString()),
//         position: _lastMapPosition,
//         infoWindow: InfoWindow(
//           title: 'Our Station',
//           snippet: '5 Star Rating',
//         ),
//         icon: BitmapDescriptor.defaultMarker,
//       ));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Station Finder'),
//           backgroundColor: Colors.green[700],
//         ),
//         body: Stack(
//           children: <Widget>[
//             GoogleMap(
//               mapType: _currentMapType,
//               markers: _markers,
//               onCameraMove: _onCameraMove,
//               onMapCreated: _onMapCreated,
//               initialCameraPosition: CameraPosition(
//                 target: _center,
//                 zoom: 11.0,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: <Widget>[
//                   Align(
//                     alignment: Alignment.topRight,
//                     child: FloatingActionButton(
//                       heroTag: null,
//                       onPressed: _onMapTypeButtonPressed,
//                       materialTapTargetSize: MaterialTapTargetSize.padded,
//                       backgroundColor: Colors.green,
//                       child: const Icon(Icons.map, size: 36.0),
//                     ),
//                   ),
//                   SizedBox(height: 16.0),
//                   FloatingActionButton(
//                     heroTag: null,
//                     onPressed: _onAddMarkerButtonPressed,
//                     materialTapTargetSize: MaterialTapTargetSize.padded,
//                     backgroundColor: Colors.green,
//                     child: const Icon(Icons.add_location, size: 36.0),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// // // class MapMarker extends Clusterable {
// // //    final String id;
// // //    final LatLng position;
// // //    final BitmapDescriptor icon;
// // // MapMarker({
// // //      @required this.id,
// // //      @required this.position,
// // //      @required this.icon,
// // //      isCluster = false,
// // //      clusterId,
// // //      pointsSize,
// // //      childMarkerId,
// // //    }) : super(
// // //           markerId: id,
// // //           latitude: position.latitude,
// // //           longitude: position.longitude,
// // //           isCluster: isCluster,
// // //           clusterId: clusterId,
// // //           pointsSize: pointsSize,
// // //           childMarkerId: childMarkerId,
// // //        );
// // // Marker toMarker() => Marker(
// // //          markerId: MarkerId(id),
// // //          position: LatLng(
// // //            position.latitude,
// // //            position.longitude,
// // //          ),
// // //          icon: icon,
// // //         );
// // // }


