import 'package:flutter/material.dart';
import 'package:practical_task/helper/ui_helper.dart';
import 'package:practical_task/model/last_fm_model.dart';
import 'package:practical_task/providers/last_fm_provider.dart';
import 'package:practical_task/routes/routes.dart';
import 'package:practical_task/utils/validation/validation_utils.dart';
import 'package:practical_task/view/search/components/search_result_tile.dart';
import 'package:practical_task/view_model/search_album_view_model.dart';
import 'package:provider/src/provider.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();

  LastFmModel? _searchResponse = LastFmModel();

  String? searchDelegate;

  late LastFmProvider _lastFmProvider;

  @override
  Widget build(BuildContext context) {
    _lastFmProvider = context.watch<LastFmProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 30.0,
          ),
          child: Column(
            children: [
              TextFormField(
                controller: _searchController,
                onFieldSubmitted: (String value) async {
                  _searchResponse =
                      await SearchAlbumViewModel().getSearchAlbum(album: value);
                  _lastFmProvider.setLastFmResponse(_searchResponse);
                },
                decoration: const InputDecoration(
                  hintText: 'Search here',
                ),
              ),
              UIHelper.verticalSpace(
                10.0,
              ),
              ValidationUtils.isValid(_searchResponse)
                  ? SizedBox(
                      child: ListView.builder(
                        itemCount: _searchResponse!
                            .results!.albummatches!.album!.length,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return SearchResultTile(
                            title: _searchResponse!
                                .results!.albummatches!.album![index].name,
                            imageUrl: _searchResponse!.results!.albummatches!
                                .album![index].image![0].text,
                            onTap: () {
                              Navigator.pushNamed(context, Routes.detailScreen);
                            },
                          );
                        },
                      ),
                    )
                  : const Center(
                      child: Text('Please Search any album'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
