import 'package:flutter/material.dart';

class CustomTab extends StatefulWidget {
  const CustomTab({super.key});

  @override
  State<CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      labelStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        // Creates border
        color: const Color(0xff3AB549),
      ),
      tabs: [
        SizedBox(
          width: 200,
          height: 30,
          child: Center(
            child: Text(
              'Create by me',
              style: TextStyle(
                color: _tabController.index == 0
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 200,
          height: 30,
          child: Center(
            child: Text(
              'Joined by me',
              style: TextStyle(
                color: _tabController.index == 1
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
