import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final List<String> labels;
  final Function(int index)? onChanged;
  final int initialIndex;

  const CustomSwitch({
    super.key,
    required this.labels,
    this.onChanged,
    this.initialIndex = 0,
  });

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    final double switchWidth = MediaQuery.of(context).size.width - 20;
    final double buttonWidth = switchWidth / widget.labels.length;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  left: selectedIndex * buttonWidth,
                  top: 0,
                  bottom: 0,
                  right:
                      switchWidth - selectedIndex * buttonWidth - buttonWidth,
                  child: Container(
                    width: buttonWidth,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.5),
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onEnd: () {
                    if (widget.onChanged != null) {
                      widget.onChanged!(selectedIndex);
                    }
                  },
                ),
                Row(
                  children: List.generate(widget.labels.length, (index) {
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            widget.labels[index],
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
