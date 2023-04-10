import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'graveyard_in_district.dart';
import 'package:flutter_graveyard_frontend/navBar/navigationBar.dart';
import 'package:flutter_graveyard_frontend/repository/graveyard_repository.dart';
import 'package:flutter_graveyard_frontend/models/graveyard_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_graveyard_frontend/providers/user_provider.dart';

class GraveyardInDistrictSelectionScreen extends StatelessWidget {
  const GraveyardInDistrictSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;
    final title = userProvider.pageTitle;
    final accessToken = user?.accessToken ?? '';
    return Scaffold(
      appBar: NavBar(
          context: context,
          onPressCallBack: () {},
          pageTitle: title!,
          showBackArrow: false),
      body: GraveyardInDistrict(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(254, 222, 255, 1),
        child: Text(
          '+Add',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String name = '';
              String location = '';
              int maxPlots = 0;
              return AlertDialog(
                title: Text("Add Cemetery"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Cemetery Name',
                      ),
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Cemetery Location',
                      ),
                      onChanged: (value) {
                        location = value;
                      },
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Max Plots',
                      ),
                      onChanged: (value) {
                        maxPlots = int.tryParse(value)!;
                      },
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  ElevatedButton(
                    child: Text('Save'),
                    onPressed: () async {
                      final graveyardRepository = GraveyardRepository();
                      final graveyard = Graveyard(name: name, location: location, numberOfPlots: maxPlots);
                      await graveyardRepository.saveGraveyard(graveyard, accessToken);
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}