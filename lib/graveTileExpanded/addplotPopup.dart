import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_graveyard_frontend/repository/grave_repository.dart';

class AddGravePopup extends StatelessWidget {
  const AddGravePopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final plotNumberController = TextEditingController();
    return AlertDialog(
      title: const Text('Add a Grave', textAlign: TextAlign.center),
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            Row(
              children: const [
                Text('Plot Type'),
                SizedBox(
                  width: 30,
                ),
                Expanded(child: TextField()),
              ],
            ),
            Row(
              children: [
                Text('Plot Number'),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: TextField(
                    controller: plotNumberController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            final sharedPreferences = await SharedPreferences.getInstance();
            final accessToken = sharedPreferences.getString('accessToken');
            final graveyardID = sharedPreferences.getString('graveyardID');
            final plotNumber = plotNumberController.text;
            if (int.tryParse(plotNumber) == null) {
              // Show an error message if plotNumber is not an integer
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Plot Number should be an integer value'),
                ),
              );
              return;
            }
            try {
              await GraveRepository().saveGrave(plotNumber, accessToken!, graveyardID!);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Grave successfully added'),
                ),
              );
              Navigator.pop(context, 'OK');
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Failed to add grave'),
                ),
              );
            }
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}