import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_assignment/provider/provider.dart';

class DetailedPage extends StatefulWidget {
  const DetailedPage({super.key});
  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Detailed Page'),
          leading: const CupertinoNavigationBarBackButton(
            color: CupertinoColors.activeBlue,
          )),
      body: SafeArea(
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Text(
                '${context.watch<ProviderApp>().getName}',
                style:
                    const TextStyle(fontSize: 56, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                CupertinoButton(
                    child: const Text('Go Back'),
                    onPressed: () => Navigator.pop(context),
                    color: CupertinoColors.systemBlue),
              ])
            ])),
      ),
    );
  }
}
