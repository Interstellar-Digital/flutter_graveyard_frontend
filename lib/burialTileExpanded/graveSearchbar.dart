import 'package:flutter/material.dart';

class SearchGraveList extends SearchDelegate {
  List<String> peopleInGraves = [
    'John Doe 155',
    'Dalisay Traversa 190',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var people in peopleInGraves) {
      if (people.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(people);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
        List<String> matchQuery = [];
    for (var people in peopleInGraves) {
      if (people.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(people);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),

        );
      },
    );
 
  }
}
