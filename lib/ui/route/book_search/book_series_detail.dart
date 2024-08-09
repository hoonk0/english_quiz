import 'package:flutter/material.dart';
import '../../../const/value/colors.dart';
import '../../../const/value/gaps.dart';
import '../../../const/value/text_style.dart';
import '../../component/book_card_row.dart';
import '../../component/custom_appbar.dart';

class BookSeriesDetail extends StatelessWidget {
  const BookSeriesDetail({super.key});

  @override
  Widget build(BuildContext context) {

    final ValueNotifier<String> selectedFilterNotifier = ValueNotifier<String>('최신순');

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              CustomAppbar(appTitle: ''),
              Gaps.v17,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '시리즈(총 00권)',
                    style: TS.s18w600(colorGray900),
                  ),
                  ValueListenableBuilder<String>(
                    valueListenable: selectedFilterNotifier,
                    builder: (context, selectedFilter, child) {
                      return GestureDetector(
                        onTap: () {
                          _showFilterMenu(context, selectedFilterNotifier);
                        },
                        child: Row(
                          children: [
                            Text(
                              selectedFilter,
                              style: TS.s14w500(colorGray600),
                            ),
                            Gaps.h4,
                            Image.asset(
                              'assets/icons/downarrow.png',
                              width: 14,
                              height: 14,
                              fit: BoxFit.cover,
                              color: colorGray600,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),

              Gaps.v16,

              Expanded(
                child: ListView.builder(
                  itemCount: 5, // 5개의 아이템을 생성 (실제 BookCardRow는 10개)
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        children: [
                          // 첫 번째 BookCardRow
                          Expanded(
                            child: BookCardRow(
                              title: 'Book ${(index * 2) + 1}',
                              writer: 'Writer ${(index * 2) + 1}',
                            ),
                          ),
                          Gaps.h16, // 두 카드 사이의 간격
                          // 두 번째 BookCardRow
                          Expanded(
                            child: BookCardRow(
                              title: 'Book ${(index * 2) + 2}',
                              writer: 'Writer ${(index * 2) + 2}',
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  void _showFilterMenu(BuildContext context, ValueNotifier<String> selectedFilterNotifier) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FilterMenu(
          selectedFilterNotifier: selectedFilterNotifier,
        );
      },
    );
  }
}

class FilterMenu extends StatelessWidget {
  final ValueNotifier<String> selectedFilterNotifier;

  const FilterMenu({super.key, required this.selectedFilterNotifier});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('최신순'),
            trailing: _buildCheckIcon('최신순'),
            onTap: () {
              selectedFilterNotifier.value = '최신순';
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('ABC순'),
            trailing: _buildCheckIcon('ABC순'),
            onTap: () {
              selectedFilterNotifier.value = 'ABC순';
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('날짜순'),
            trailing: _buildCheckIcon('날짜순'),
            onTap: () {
              selectedFilterNotifier.value = '날짜순';
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCheckIcon(String filter) {
    return ValueListenableBuilder<String>(
      valueListenable: selectedFilterNotifier,
      builder: (context, selectedFilter, child) {
        return selectedFilter == filter
            ? Icon(Icons.check, color: colorPurple500)
            : SizedBox.shrink();
      },
    );
  }
}
