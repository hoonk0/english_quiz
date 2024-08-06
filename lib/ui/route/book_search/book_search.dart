import 'package:english_quiz/ui/component/custom_image_container.dart';
import 'package:flutter/material.dart';

import '../../../const/value/colors.dart';
import '../../../const/value/gaps.dart';

import '../../component/custom_appbar.dart';
import '../../component/textfield_border_search.dart';


class BookSearch extends StatefulWidget {
  const BookSearch({super.key});

  @override
  State<BookSearch> createState() => _BookSearchState();
}

class _BookSearchState extends State<BookSearch> {
  final TextEditingController tecSearch = TextEditingController();
  final ValueNotifier<bool> _hasTextNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    tecSearch.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    tecSearch.removeListener(_onTextChanged);
    tecSearch.dispose();
    _hasTextNotifier.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    _hasTextNotifier.value = tecSearch.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                CustomAppbar(appTitle: 'Search'),
                Gaps.v16,
                ValueListenableBuilder<bool>(
                  valueListenable: _hasTextNotifier,
                  builder: (context, hasText, child) {
                    return TextFieldBorderSearch(
                      hintText: '책 제목, 저자, 장르 등을 입력하세요',
                      controller: tecSearch,
                      colorBorder: colorGray300,
                      fillColor: colorPoint800,
                      circularNumber: 100,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          // Clear text if there's text, or perform another action if needed
                          if (hasText) {
                            tecSearch.clear();
                            _onTextChanged(); // Update notifier
                          }
                        },
                        child: Image.asset(
                          hasText
                              ? 'assets/icons/delete.png' // Image for when there is text
                              : 'assets/icons/search.png', // Image for when there is no text
                          width: 24, // Adjust width as needed
                          height: 24, // Adjust height as needed
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                Gaps.v20,

                CustomImageContainer(title: '호모 사피엔스', writer: 'joseph')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
