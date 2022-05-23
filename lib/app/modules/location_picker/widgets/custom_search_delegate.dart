import 'package:envo_safe/app/data/map_provider/repos/place_repo.dart';
import 'package:envo_safe/app/data/models/map_models/places_model.dart';
import 'package:envo_safe/app/modules/location_picker/widgets/search_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchDelegate extends SearchDelegate<PlacesModel?> {
// Demo list to show querying

// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<PlacesModel>>(
        future: PlaceRepo().getPlaceByText(query),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var result = snapshot.data![index];
                return SearchTile(
                  placesModel: result,
                  onTap: () {
                    close(context, result);
                  },
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        }));
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<PlacesModel>>(
        future: PlaceRepo().getPlaceByText(query),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data == null ? 0 : snapshot.data!.length,
              itemBuilder: (context, index) {
                var result = snapshot.data![index];
                return SearchTile(
                  placesModel: result,
                  onTap: () {
                    close(context, result);
                  },
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }));
  }
}
