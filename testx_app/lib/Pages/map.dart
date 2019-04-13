import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart';
//import 'package:geoflutterfire/geoflutterfire.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:rxdart/rxdart.dart';
import 'dart:async';




class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(40.007565, -105.267298),
    zoom: 15.5,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 90.0,
      target: LatLng(40.007565, -105.267298),
      tilt: 59.440717697143555,
      zoom: 15.5);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('See the field!'),
        icon: Icon(Icons.play_for_work),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
//GoogleMapController mapController;
//
//class FireMap extends StatefulWidget {
//  @override
//  _FireMapState createState() => _FireMapState();
//}
//
//class _FireMapState extends State<FireMap> {
//  @override
//  Widget build(BuildContext context) {
//    return Stack(children: <Widget>[
//      GoogleMap(
//        initialCameraPosition: CameraPosition(
//            target: LatLng(40.0150, 105.2705),
//            zoom: 30
//        ),
//        onMapCreated: _onMapCreated,
//        myLocationEnabled: true,
//        mapType: MapType.hybrid,
//        compassEnabled: true,
//        //trackCameraPosition: true,
//      ),
//      Positioned(
//        bottom: 50,
//        right: 10,
//        child:
//        FlatButton(
//            child: Icon(Icons.pin_drop, color: Colors.white),
//            onPressed: () => _addMarker),
//      )
//
//    ]);
//  }
////  void _updateMarkers(List<DocumentSnapshot> documentList) {
//    print(documentList);
//    mapController.clearMarkers();
//    documentList.forEach((DocumentSnapshot document) {
//      GeoPoint pos = document.data['position']['geopoint'];
//      double distance = document.data['distance'];
//      var marker = MarkerOptions(
//          position: LatLng(pos.latitude, pos.longitude),
//          icon: BitmapDescriptor.defaultMarker,
//          infoWindowText: InfoWindowText('Magic Marker', '$distance kilometers from query center')
//      );
//
//
//      mapController.addMarker(marker);
//    });
//  }
//
//  _addMarker() {
//    var marker = MarkerOptions(
//        position: mapController.cameraPosition.target,
//        icon: BitmapDescriptor.defaultMarker,
//        infoWindowText: InfoWindowText('Magic Marget', '🍄🍄🍄')
//    );
//
//    mapController.addMarker(marker);
//  }


//  void _onMapCreated(GoogleMapController controller) {
//    setState(() {
//      mapController = controller;
//    });
//  }
//
//
//
//  Location location = new Location();
//
//  _animateToUser() async {
//    var pos = await location.getLocation();
//
//    mapController.animateCamera(CameraUpdate.newCameraPosition(
//        CameraPosition(
//          target: LatLng(40.0150, 105.2705),
//          zoom: 17.0,
//        )
//    )
//    );
//  }
//
//
//  Firestore firestore = Firestore.instance;
//  Geoflutterfire geo = Geoflutterfire();


//  Future<DocumentReference> _addGeoPoint() async {
//    var pos = await location.getLocation();
//    GeoFirePoint point = geo.point(latitude: 40.0150, longitude: 105.2705);
//    return firestore.collection('locations').add({
//      'position': point.data,
//      'name': 'Yay I can be queried!'
//    });
//  }
//
//
//  BehaviorSubject<double> radius = BehaviorSubject(seedValue: 100.0);
//  Stream<dynamic> query;
//  StreamSubscription subscription;
//
//  _startQuery() async {
//    // Get users location
//    var pos = await location.getLocation();
//    double lat = 40.0150;
//    double lng = 105.2705;
//
//    // Make a referece to firestore
//    var ref = firestore.collection('locations');
//    GeoFirePoint center = geo.point(latitude: lat, longitude: lng);

    // subscribe to query
//    subscription = radius.switchMap((rad) {
//      return geo.collection(collectionRef: ref).within(
//          center: center,
//          radius: rad,
//          field: 'position',
//          strictMode: true
//      );
//    }).listen(_updateMarkers);
//  }
//
//  @override
//  dispose() {
//    subscription.cancel();
//    super.dispose();
//  }

//  _updateQuery(value) {
//    setState(() {
//      radius.add(value);
//    });
//  }


//
//
//}
//




//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:flutter/material.dart';
//
//
//class HomePage extends StatefulWidget {
//  @override
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> {
//  @override
//  Widget build(BuildContext context) {
//    Completer<GoogleMapController>
//    return Container();
//  }
//}
//



























//
//void main() => runApp(MyApp());
//
//
//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//
//  Completer<GoogleMapController> _controller = Completer();
//
//  static const LatLng _center = const LatLng(45.521563, -122.677433);
//
//  final Set<Marker> _markers = {};
//
//  LatLng _lastMapPosition = _center;
//
//  MapType _currentMapType = MapType.normal;
//
//  void _onMapTypeButtonPressed() {
//    setState(() {
//      _currentMapType = _currentMapType == MapType.normal
//          ? MapType.satellite
//          : MapType.normal;
//    });
//  }
//
//  void _onAddMarkerButtonPressed() {
//    setState(() {
//      _markers.add(Marker(
//        // This marker id can be anything that uniquely identifies each marker.
//        markerId: MarkerId(_lastMapPosition.toString()),
//        position: _lastMapPosition,
//        infoWindow: InfoWindow(
//          title: 'Really cool place',
//          snippet: '5 Star Rating',
//        ),
//        icon: BitmapDescriptor.defaultMarker,
//      ));
//    });
//  }
//
//  void _onCameraMove(CameraPosition position) {
//    _lastMapPosition = position.target;
//  }
//
//  void _onMapCreated(GoogleMapController controller) {
//    _controller.complete(controller);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Maps Sample App'),
//          backgroundColor: Colors.green[700],
//        ),
//        body: Stack(
//          children: <Widget>[
//            GoogleMap(
//              onMapCreated: _onMapCreated,
//              initialCameraPosition: CameraPosition(
//                target: _center,
//                zoom: 11.0,
//              ),
//              mapType: _currentMapType,
//              markers: _markers,
//              onCameraMove: _onCameraMove,
//            ),
//            Padding(
//              padding: const EdgeInsets.all(16.0),
//              child: Align(
//                alignment: Alignment.topRight,
//                child: Column(
//                  children: <Widget> [
//                    FloatingActionButton(
//                      onPressed: _onMapTypeButtonPressed,
//                      materialTapTargetSize: MaterialTapTargetSize.padded,
//                      backgroundColor: Colors.green,
//                      child: const Icon(Icons.map, size: 36.0),
//                    ),
//                    SizedBox(height: 16.0),
//                    FloatingActionButton(
//                      onPressed: _onAddMarkerButtonPressed,
//                      materialTapTargetSize: MaterialTapTargetSize.padded,
//                      backgroundColor: Colors.green,
//                      child: const Icon(Icons.add_location, size: 36.0),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}