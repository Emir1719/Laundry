import 'package:flutter/material.dart';
import 'package:laundry/constant/style.dart';
import 'package:laundry/locator.dart';

class MachineControlView extends StatelessWidget {
  const MachineControlView({super.key});

  @override
  Widget build(BuildContext context) {
    final style = locator<AppStyle>();

    return Scaffold(
      appBar: AppBar(title: const Text("Makine Ayarları")),
      body: Center(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {},
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              tileColor: style.getColorListTile(index),
              title: Text("${index + 1}. Makine", style: style.listTileTitle),
              subtitle: Text("Ahmet Emir Öztürk", style: style.listTileSubtitle),
              trailing: IconButton(
                icon: const Icon(Icons.add),
                iconSize: 35,
                color: Colors.black,
                onPressed: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}
