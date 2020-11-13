import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safenet/ui/constants.dart';
import 'package:safenet/core/viewmodals/home_model.dart';

class SearchBar extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Icon(Icons.clear),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

// class SearchBar extends StatelessWidget {
//   String cityName;

//   /// custom search bar created to search any place on the map.
//   // TODO: The search bar does nothing as of now, must be developed to get location of the specified area and show it on the map

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//         top: 27.0,
//         right: 15.0,
//         left: 15.0,
//         child: Container(
//           child: Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10.0)),
//             ),
//             child: Container(
//               width: 385.0,
//               child: TextField(
//                 onChanged: (value) {
//                   cityName = value;

//                 },
//                 decoration: kTextFieldDecoration.copyWith(
//                     hintText: 'Search',
//                     prefixIcon: Icon(Icons.arrow_back_ios),
//                     suffixIcon: IconButton(
//                         icon: Icon(Icons.search_rounded),
//                         onPressed: () => {
//                               Provider.of<HomeViewModel>(context, listen: false)
//                                   .updateCity(cityName),
//                               print(cityName),
//                             })),
//               ),
//             ),
//           ),
//         ));
//   }
// }
