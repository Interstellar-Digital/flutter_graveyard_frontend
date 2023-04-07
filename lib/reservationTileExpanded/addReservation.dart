import 'package:flutter/material.dart';

class AddReservationPopup extends StatelessWidget {
  const AddReservationPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Add Reservation',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        height: 300,
        width: 800,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Please fill in the information below'),
              Text("Must fill in the information marked with the asteric '*'"),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 220,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'First Name *',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Middle Name',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Last Name *',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 220,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Plot Type *',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Plot Number *',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Cemetery Location *',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 220,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Contact*',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Email *',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Date of Reservation *',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'okay'),
                child: const Text('Add Reservation'),
              ),
            ],
          ),
        )
      ],
    );
  }
}

FloatingActionButton AddReservation(BuildContext context) {
  return FloatingActionButton(
    backgroundColor: Color.fromRGBO(6, 208, 111, 1),
    child: Text(
      '+Add',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black),
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    onPressed: () {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AddReservationPopup(),
      );
    }, //add person to Reservation list
  );
}
