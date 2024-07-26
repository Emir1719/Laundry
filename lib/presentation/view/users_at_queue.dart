import 'package:flutter/material.dart';
import 'package:laundry/util/constant/style.dart';
import 'package:laundry/config/locator.dart';
import 'package:laundry/domain/repository/database_repository.dart';

class UsersAtQueue extends StatelessWidget {
  const UsersAtQueue({super.key});

  @override
  Widget build(BuildContext context) {
    final style = locator<AppStyle>();

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: style.machineSettingContainer(),
      child: FutureBuilder(
        future: locator<DatabaseRepository>().getAllUserFromQueue(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Hata: ${snapshot.error}"));
          }
          if (snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${index + 1}. ${snapshot.data![index].name}", style: style.listTileTitle),
                );
              },
            );
          }
          return Center(child: Text("Yıkama sırası boş", style: style.userQueue));
        },
      ),
    );
  }
}
