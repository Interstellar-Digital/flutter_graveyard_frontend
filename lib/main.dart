import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/burialTileExpanded/burialsScreen.dart';
import 'package:flutter_graveyard_frontend/graveTileExpanded/gravesScreen.dart';
import 'package:flutter_graveyard_frontend/graveyardSelection/graveyardSelectionSreen.dart';
import 'package:flutter_graveyard_frontend/graveyardDashboard/dashboardScreen.dart';
import 'package:flutter_graveyard_frontend/login/login_screen.dart';
import 'package:flutter_graveyard_frontend/paymentTileExpaned/paymentScreen.dart';
import 'package:flutter_graveyard_frontend/providers/graveyard_provider.dart';
import 'package:flutter_graveyard_frontend/reportTileExpanded/reportScreen.dart';
import 'package:flutter_graveyard_frontend/reservationTileExpanded/reservationScreen.dart';

import 'package:provider/provider.dart';
import 'package:flutter_graveyard_frontend/providers/user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'notificationTileExpanded/notificationScreen.dart';

void main() async {
  // Retrieve the values from SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? graveyardName = prefs.getString('graveyardName');
  String? accessToken = prefs.getString('accessToken');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => GraveyardProvider()),
        // Add other providers here as necessary
      ],
      child: GraveyardManagementSystem(graveyardName: graveyardName, accessToken: accessToken),
    ),
  );
}

class GraveyardManagementSystem extends StatelessWidget {
  const GraveyardManagementSystem({Key? key, required this.graveyardName, required this.accessToken}) : super(key: key);
  final String? graveyardName;
  final String? accessToken;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return MaterialApp(
      title: 'Graveyard Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: user != null ? '/dashboard' : '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => GraveyardDashboard(
          pageTitle: '${graveyardName ?? ""}',
          accessToken: accessToken ?? "",
        ),
        '/graveyard-selection': (context) =>
            GraveyardInDistrictSelectionScreen(),
        '/graves': (context) => GravesScreen(pageTitle: 'Graves'),
        '/burials': (context) => BurialScreen(pageTitle: 'Burials'),
        '/reservations': (context) => ReservationScreen(pageTitle: 'Reservations'),
        '/report': (context) => ReportScreen(pageTitle: 'Report'),
        '/payments': (context) => PaymentScreen(pageTitle: 'Payments'),
        '/notifications': (context) => NotificationScreen(pageTitle: 'Notifications'),
      },
    );
  }
}