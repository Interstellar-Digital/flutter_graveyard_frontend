import 'package:flutter/material.dart';

class AddDeceasePopup extends StatelessWidget {
  const AddDeceasePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Add deceased',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        height: 400,
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
                        labelText: 'Deceased First Name *',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Deceased Middle Name',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Deceased Last Name *',
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
                        labelText: 'Deceased Date of Birth *',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Deceased Date of Death *',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Deceased Address',
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
                        labelText: 'Next of Kin *',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Next of Kin Contact *',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Next of Kin Email *',
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
                child: const Text('Add Deceased'),
              ),
            ],
          ),
        )
      ],
    );
  }
}

FloatingActionButton AddGrave(BuildContext context) {
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
        builder: (BuildContext context) => AddDeceasePopup(),
      );
    }, //add person to grave list
  );
}
