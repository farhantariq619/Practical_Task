import 'package:flutter/material.dart';
import 'package:practical_task/helper/ui_helper.dart';
import 'package:practical_task/providers/last_fm_provider.dart';
import 'package:practical_task/view/common_widgets/image_widget.dart';
import 'package:provider/src/provider.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key}) : super(key: key);
  late LastFmProvider _lastFmProvider;

  @override
  Widget build(BuildContext context) {
    _lastFmProvider = context.watch<LastFmProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Album Detail'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 30.0,
          ),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 2,
                child: ImageWidget(
                  imageUrl: _lastFmProvider.lasFmResponse.results!.albummatches!
                      .album![_lastFmProvider.detailItemIndex!].image![3].text,
                ),
              ),
              UIHelper.verticalSpace(10.0),
              Text(
                'Album Name: ${_lastFmProvider.lasFmResponse.results!.albummatches!.album![_lastFmProvider.detailItemIndex!].name}',
              ),
              UIHelper.verticalSpace(10.0),
              Text(
                'Artist: ${_lastFmProvider.lasFmResponse.results!.albummatches!.album![_lastFmProvider.detailItemIndex!].artist}',
              ),
              UIHelper.verticalSpace(10.0),
              Text(
                'url: ${_lastFmProvider.lasFmResponse.results!.albummatches!.album![_lastFmProvider.detailItemIndex!].url}',
              ),
              UIHelper.verticalSpace(10.0),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Done')),
            ],
          ),
        ),
      ),
    );
  }
}
