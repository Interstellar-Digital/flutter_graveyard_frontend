import 'package:flutter/material.dart';
import 'package:paginated_search_bar/paginated_search_bar.dart';

PaginatedSearchBar<dynamic> ReservationSearch() {
  return PaginatedSearchBar(
    maxHeight: 100,
    itemBuilder: ((context, {required index, item}) {
      return Text('data');
    }),
    onSearch: (
        {required pageIndex, required pageSize, required searchQuery}) async {
      return [];
    },
  );
}
