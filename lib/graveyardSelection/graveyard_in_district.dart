import 'package:flutter/material.dart';
import 'package:flutter_graveyard_frontend/graveyardDashboard/dashboardScreen.dart';
import 'package:flutter_graveyard_frontend/models/graveyard_model.dart';
import 'package:flutter_graveyard_frontend/providers/user_provider.dart';
import 'package:flutter_graveyard_frontend/providers/graveyard_provider.dart';
import 'package:flutter_graveyard_frontend/repository/graveyard_repository.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GraveyardInDistrict extends StatelessWidget {
  const GraveyardInDistrict({Key? key});

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = EdgeInsets.only(top: 50);
    final userProvider = Provider.of<UserProvider>(context);
    final graveyardProvider = Provider.of<GraveyardProvider>(context);
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (snapshot.hasData) {
          final SharedPreferences prefs = snapshot.data!;
          final accessToken = prefs.getString('accessToken') ?? '';
          final username = prefs.getString('username') ?? '';
          final userID = prefs.getString('userID') ?? '';

          return FutureBuilder<List<Graveyard>>(
            future: GraveyardRepository().getAllGraveyardsForUser(accessToken, userID),
            builder: (BuildContext context, AsyncSnapshot<List<Graveyard>> snapshot) {
              if (snapshot.hasData) {
                final List<Graveyard> graveyards = snapshot.data!;
                if (graveyards.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'No graveyards found',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  );
                } else {
                  graveyards.sort((a, b) => a.name.compareTo(b.name)); // Sort the list alphabetically by name
                  return Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.15,
                        vertical: MediaQuery.of(context).size.height * 0.05,
                      ),
                      child: GridView.builder(
                        itemCount: graveyards.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // Number of columns
                          mainAxisSpacing: 15.0, // Spacing between rows
                          crossAxisSpacing: 10.0, // Spacing between columns
                          childAspectRatio: 3 / 2.5, // Aspect ratio of each card
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          final graveyard = graveyards[index];
                          return GestureDetector(
                            onTap: () {
                              graveyardProvider.setGraveyardID(graveyard.graveyardID!, graveyard.name); // Set the selected graveyard ID to the state
                              Navigator.pushNamed(context, '/dashboard');
                            },
                            child: Card(
                              color: Color.fromRGBO(185, 243, 252, 1),
                              elevation: 7,
                              child: Center(
                                child: Text(
                                  '${graveyard.name}',
                                  style: TextStyle(fontSize: 16.0),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            },
          );
        } else {

          return Center(child: CircularProgressIndicator()); // Return a circular progress indicator if SharedPreferences has not finished loading yet.
        }
      },
    );
  }
}