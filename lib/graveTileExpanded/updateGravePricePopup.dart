import 'package:flutter/material.dart';

class UpdateGravePricePopup extends StatelessWidget {
  const UpdateGravePricePopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Update Grave Price',
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        height: 200,
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
              children: const [
                Text('Date'),
                SizedBox(
                  width: 30,
                ),
                Expanded(child: TextField()),
              ],
            ),
            Row(
              children: const [
                Text('New Price'),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: TextField(),
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
          onPressed: () => Navigator.pop(context, 'Update Price'),
          child: const Text('Update Price'),
        ),
      ],
    );
  }
}
