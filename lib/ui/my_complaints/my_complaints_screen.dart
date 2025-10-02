import 'package:dengue_zero/domain/usecases/denounces_places.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyComplaintsScreen extends StatelessWidget {
  const MyComplaintsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: kToolbarHeight,
          child: Image.asset(
            'assets/images/Z.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Consumer<DenouncesPlaces>(
        child: const Center(
          child: Text('Nenhum local cadastrado!'),
        ),
        builder: (ctx, denouncesPlaces, ch) => denouncesPlaces.itemsCount == 0
            ? ch ?? const SizedBox()
            : ListView.builder(
                itemCount: denouncesPlaces.itemsCount,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(
                      denouncesPlaces.itemByIndex(i).image,
                    ),
                  ),
                  title: Text(denouncesPlaces.itemByIndex(i).title),
                  onTap: () {},
                ),
              ),
      ),
    );
  }
}
