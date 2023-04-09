import 'package:currency/home/home.dart';
import 'package:currency/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: CupertinoSearchTextField(
        prefixInsets: const EdgeInsets.all(10),
        prefixIcon: const Icon(
          Icons.search,
          color: ColorConstants.primaryBackgroundColor,
        ),
        onChanged: (searchString) {
          context
              .read<HomeBloc>()
              .add(SearchTextChanged(searchString: searchString));
        },
      ),
    );
  }
}
