import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myshop/models/PassengerData.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SearchScreenState();
  }
}

class _SearchScreenState extends State<SearchScreen> {
  int currentPage = 1;

  late int totalPages;

  List<Passenger> passengers = [];

  // final RefreshController refreshController = RefreshController(initialRefresh: true);

  Future<bool> getPassengerData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages) {
        // refreshController.loadNoData();
        return false;
      }
    }

    final Uri uri =
        Uri.parse("https://api.instantwebtools.net/v1/passenger?page=$currentPage&size=10");

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final result = passengersDataFromJson(response.body);

      if (isRefresh) {
        passengers = result.data;
      } else {
        passengers.addAll(result.data);
      }

      currentPage++;

      totalPages = result.totalPages;

      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Infinite List Pagination"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final passenger = passengers[index];

          return ListTile(
            title: Text(passenger.name),
            subtitle: Text(passenger.airline.country),
            trailing: Text(
              passenger.airline.name,
              style: const TextStyle(color: Colors.green),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: passengers.length,
      ),
    );
  }
}
