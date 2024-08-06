import 'package:flutter/material.dart';
import '../../const/value/colors.dart';
import '../../const/value/gaps.dart';
import '../../const/value/text_style.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  // Track which title is selected
  String? _selectedTitle;

  // Track the state of each checkbox under each title
  final Map<String, List<ValueNotifier<bool>>> _checkboxStates = {
    '테마': List.generate(10, (_) => ValueNotifier<bool>(false)),
    'AR level': List.generate(10, (_) => ValueNotifier<bool>(false)),
    'Age': List.generate(10, (_) => ValueNotifier<bool>(false)),
    'Lexile 지수': List.generate(10, (_) => ValueNotifier<bool>(false)),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 582,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Filter
          Gaps.v59,

          Text(
            'Filter',
            style: TS.s20w600(colorGray900),
          ),

          Gaps.v10,

          // Titles in a horizontal row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ['테마', 'AR level', 'Age', 'Lexile 지수'].map((title) {
              final bool isSelected = _selectedTitle == title;
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTitle = title;
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? colorPurple500 : colorGray900,
                        ),
                      ),
                      Gaps.v4,
                      // Underline to show selected title
                      Container(
                        height: 2,
                        width: double.infinity,
                        color: isSelected ? colorPurple500 : Colors.transparent,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),

          Gaps.v21,

          // Expanded to show options based on selected title
          Expanded(
            child: ListView(
              children: _generateOptions(),
            ),
          ),
        ],
      ),
    );
  }

  // Generate options based on selected title
  List<Widget> _generateOptions() {

    // Get the list of ValueNotifiers for the selected title
    final checkboxes = _checkboxStates[_selectedTitle] ?? [];

    return List.generate(
      checkboxes.length,
          (index) => ValueListenableBuilder<bool>(
        valueListenable: checkboxes[index],
        builder: (context, isChecked, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0), // Adjust vertical padding
            child: Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    checkboxes[index].value = value ?? false;
                  },
                ),
                Expanded(
                  child: Text(
                    '$_selectedTitle ${index + 1}',
                    style: TS.s14w500(colorGray900),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
