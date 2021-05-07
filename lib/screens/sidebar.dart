
import 'dart:async';

// import 'package:coldStorage/pages/finder.dart';
// import 'package:coldStorage/pages/map.dart';
import 'package:coldStorage/pages/notification.dart';
import 'package:coldStorage/screens/profile.dart';
import 'package:coldStorage/widgets/menuItem.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'checkout.dart';
import 'offersPromos.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);
  bool isRegistered = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color:Color.fromRGBO(255, 255, 255, 0.9),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      isRegistered ==false ?
                      ListTile(
                        title: Text(
                          "SOS",
                          style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text(
                          "mavenwechuli@gmail.com",
                          style: TextStyle(
                            color: Color(0xFF1BB5FD),
                            fontSize: 13,
                          ),
                        ),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.black,
                          ),
                          radius: 40,
                        ),
                      ):
                      Container(),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.black.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        icon: Icons.home,
                        title: "Notifications",
                        onTap: ()=>Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => NotificationsPage())),
                      ),
                      
                      MenuItem(
                        icon: Icons.person,
                        title: "My Orders",
                        onTap: ()=>Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => CheckOutPage())),
                      
                      ),
                      
                      MenuItem(
                        icon: Icons.shopping_basket,
                        title: "Wallet",
                        onTap: () =>Navigator.of(context)
                        // Implement wallate page
                  .push(MaterialPageRoute(builder: (_) {})),
                      ),
                      MenuItem(
                        icon: Icons.location_on,
                        title: "Station Finder",
                  //       onTap: ()=> 
                  //       Navigator.of(context)
                  // .push(MaterialPageRoute(builder: (_) => StationFinder())),
                      ),
                      MenuItem(
                        icon: Icons.card_giftcard,
                        title: "Service Offered",
                        onTap: ()=>PromoListPage()
                  //       Navigator.of(context)
                  // .push(MaterialPageRoute(builder: (_) => PromoListPage())),
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.black.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        icon: Icons.settings,
                        title: "Settings",
                       onTap:()=> Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => ProfilePage())),
                        
                      ),
                      MenuItem(
                        icon: Icons.exit_to_app,
                        title: "Logout",
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Color(0xFF1BB5FD),
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.black;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
