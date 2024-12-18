import 'package:sbb_design_system_mobile/sbb_design_system_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_app.dart';

void main() {
  testWidgets('multiline checkbox', (WidgetTester tester) async {
    const widget = MultilineCheckboxText();

    await TestSpecs.run(
      TestSpecs.themedSpecs,
      widget,
      tester,
      'multiline_checkbox_checked',
      find.byType(MultilineCheckboxText),
    );

    await tester.tap(find.byKey(const Key('checkbox')));

    await TestSpecs.run(
      TestSpecs.themedSpecs,
      widget,
      tester,
      'multiline_checkbox_null',
      find.byType(MultilineCheckboxText),
    );

    await tester.tap(find.byKey(const Key('checkbox')));

    await TestSpecs.run(
      TestSpecs.themedSpecs,
      widget,
      tester,
      'multiline_checkbox_unchecked',
      find.byType(MultilineCheckboxText),
    );
  });
}

class MultilineCheckboxText extends StatefulWidget {
  const MultilineCheckboxText({super.key});

  @override
  MultilineCheckboxTextState createState() => MultilineCheckboxTextState();
}

class MultilineCheckboxTextState extends State<MultilineCheckboxText> {
  bool? _listItemValue = true;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SBBGroup(
            child: SBBCheckboxListItem(
              key: const Key('checkbox'),
              value: _listItemValue,
              label: 'Multiline Label with\nSecondary Label',
              allowMultilineLabel: true,
              secondaryLabel:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut convallis leo et metus semper hendrerit. Duis nec nunc a ligula cursus vulputate. Donec sed elit ultricies, euismod erat et, eleifend augue.',
              isLastElement: true,
              tristate: true,
              onChanged: (value) => setState(() => _listItemValue = value),
            ),
          ),
        ],
      );
}
