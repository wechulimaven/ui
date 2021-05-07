// import 'dart:async';

// import 'package:coldStorage/models/mapMarker.dart';
// import 'package:coldStorage/utilis/config/mapHelper.dart';
// import 'package:fluster/fluster.dart';
// import 'package:flutter/material.dart';

// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class StationFinder extends StatefulWidget {
//   @override
//   _StationFinderState createState() => _StationFinderState();
// }

// class _StationFinderState extends State<StationFinder> {
//   final Completer<GoogleMapController> _mapController = Completer();

//   /// Set of displayed markers and cluster markers on the map
//   final Set<Marker> _markers = Set();

//   /// Minimum zoom at which the markers will cluster
//   final int _minClusterZoom = 0;

//   /// Maximum zoom at which the markers will cluster
//   final int _maxClusterZoom = 19;

//   /// [Fluster] instance used to manage the clusters
//   Fluster<MapMarker> _clusterManager;

//   /// Current map zoom. Initial zoom will be 15, street level
//   double _currentZoom = 10;

//   /// Map loading flag
//   bool _isMapLoading = true;

//   /// Markers loading flag
//   bool _areMarkersLoading = true;

//   /// Url image used on normal markers
//   final String _markerImageUrl =
//       'https://img.icons8.com/office/80/000000/marker.png';

//   /// Color of the cluster circle
//   final Color _clusterColor = Colors.blue;

//   /// Color of the cluster text
//   final Color _clusterTextColor = Colors.white;

//     MapType _currentMapType = MapType.normal;


//   /// Example marker coordinates
//   final List<LatLng> _markerLocations = [
//     LatLng(-0.5290732, 34.6539622),
//     LatLng(-0.8404538, 34.5965139),
//     LatLng(-0.8228906, 34.613101),
//     LatLng(-0.678748, 34.3923565),
//     LatLng(-0.7385693, 34.5419673),
//     LatLng(-0.5290732, 34.6539622),
//     LatLng(-0.8228906, 34.613101),
//     LatLng(-0.8051065,34.5751869),
//     LatLng(-0.5447097,33.8911536),
//     LatLng(-1.0260107,34.3886936),
//     LatLng(-0.5447097,33.8911536),
//     LatLng(-0.8228906,34.613101),
//     LatLng(0.0103211,37.0579145),

//     // LatLng(41.147125, -8.611249),
//     // LatLng(41.145599, -8.610691),
//     // LatLng(41.145645, -8.614761),
//     // LatLng(41.146775, -8.614913),
//     // LatLng(41.146982, -8.615682),
//     // LatLng(41.140558, -8.611530),
//     // LatLng(41.138393, -8.608642),
//     // LatLng(41.137860, -8.609211),
//     // LatLng(41.138344, -8.611236),
//     // LatLng(41.139813, -8.609381),
//   ];

//   /// Called when the Google Map widget is created. Updates the map loading state
//   /// and inits the markers.
//    void _onMapTypeButtonPressed() {
//     setState(() {
//       _currentMapType = _currentMapType == MapType.normal
//           ? MapType.satellite
//           : MapType.normal;
//     });
//   }
//   void _onMapCreated(GoogleMapController controller) {
//     _mapController.complete(controller);

//     setState(() {
//       _isMapLoading = false;
//     });

//     _initMarkers();
//   }

//   /// Inits [Fluster] and all the markers with network images and updates the loading state.
//   void _initMarkers() async {
//     final List<MapMarker> markers = [];

//     for (LatLng markerLocation in _markerLocations) {
//       final BitmapDescriptor markerImage =
//            BitmapDescriptor.defaultMarker;
//           // MapHelper.getMarkerImageFromUrl(_markerImageUrl);

//       markers.add(
//         MapMarker(
//           id: _markerLocations.indexOf(markerLocation).toString(),
//           position: markerLocation,
//           icon: markerImage,
//         ),
//       );
//     }

//     _clusterManager = await MapHelper.initClusterManager(
//       markers,
//       _minClusterZoom,
//       _maxClusterZoom,
//     );

//     await _updateMarkers();
//   }

//   /// Gets the markers and clusters to be displayed on the map for the current zoom level and
//   /// updates state.
//   Future<void> _updateMarkers([double updatedZoom]) async {
//     if (_clusterManager == null || updatedZoom == _currentZoom) return;

//     if (updatedZoom != null) {
//       _currentZoom = updatedZoom;
//     }

//     setState(() {
//       _areMarkersLoading = true;
//     });

//     final updatedMarkers = await MapHelper.getClusterMarkers(
//       _clusterManager,
//       _currentZoom,
//       _clusterColor,
//       _clusterTextColor,
//       80,
//     );

//     _markers
//       ..clear()
//       ..addAll(updatedMarkers);

//     setState(() {
//       _areMarkersLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Station Finder'),
//       ),
//       body: Stack(
//         children: <Widget>[
//           // Google Map widget
//           Opacity(
//             opacity: _isMapLoading ? 0 : 1,
//             child: GoogleMap(
//               mapType: _currentMapType,
//               // mapToolbarEnabled: false,
//               initialCameraPosition: CameraPosition(
//                 target: LatLng(-0.5290732, 34.6539622),
//                 zoom: _currentZoom,
//               ),
//               markers: _markers,
//               onMapCreated: (controller) => _onMapCreated(controller),
//               onCameraMove: (position) => _updateMarkers(position.zoom),
//             ),
//           ),

//           // Map loading indicator
//           Opacity(
//             opacity: _isMapLoading ? 1 : 0,
//             child: Center(child: CircularProgressIndicator()),
//           ),

//           Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: <Widget>[
//                   Align(
//                     alignment: Alignment.topRight,
//                     child: FloatingActionButton(
//                       onPressed: _onMapTypeButtonPressed,
//                       materialTapTargetSize: MaterialTapTargetSize.padded,
//                       backgroundColor: Colors.green,
//                       child: const Icon(Icons.map, size: 36.0),
//                     ),
//                   ),
                  
//                 ],
//               ),
//             ),

//           // Map markers loading indicator
//           if (_areMarkersLoading)
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Align(
//                 alignment: Alignment.topCenter,
//                 child: Card(
//                   elevation: 2,
//                   color: Colors.grey.withOpacity(0.9),
//                   child: Padding(
//                     padding: const EdgeInsets.all(4),
//                     child: Text(
//                       'Loading',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }