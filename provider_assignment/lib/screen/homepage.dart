import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_assignment/provider/provider.dart';
import 'package:provider_assignment/screen/camera.dart';
import 'package:provider_assignment/screen/detailpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: context.watch<ProviderApp>().getNames.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  context.read<ProviderApp>().detailed(index);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DetailedPage()),
                  );
                },
                child: ListTile(
                  title: Text(context.watch<ProviderApp>().getNames[index]),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.camera),
        onPressed: () async {
          await availableCameras().then((value) => Navigator.push(context,
              MaterialPageRoute(builder: (_) => CameraPage(camera: value))));
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat, // Center the button
    );
  }
}
