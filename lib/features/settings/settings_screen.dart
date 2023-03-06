import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("셋팅"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("로그아웃 (ios / bottom)"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  title: const Text("정말로?"),
                  message: const Text("가지마세요"),
                  actions: [
                    CupertinoActionSheetAction(
                      isDefaultAction: true,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("not log out"),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () => Navigator.of(context).pop(),
                      isDestructiveAction: true,
                      child: const Text("yes"),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text("로그아웃 (android / bottom)"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => AlertDialog(
                  icon: const FaIcon(
                    FontAwesomeIcons.skull,
                  ),
                  title: const Text("정말로?"),
                  content: const Text("plx dont'go"),
                  actions: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const FaIcon(FontAwesomeIcons.car),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("yes"),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text("로그아웃 (ios)"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text("정말로?"),
                  content: const Text("plx dont'go"),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("no"),
                    ),
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      isDestructiveAction: true,
                      child: const Text("yes"),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text("로그아웃 (android)"),
            textColor: Colors.red,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  icon: const FaIcon(
                    FontAwesomeIcons.skull,
                  ),
                  title: const Text("정말로?"),
                  content: const Text("plx dont'go"),
                  actions: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const FaIcon(FontAwesomeIcons.car),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("yes"),
                    ),
                  ],
                ),
              );
            },
          ),
          Switch.adaptive(
            value: _notifications,
            onChanged: _onNotificationsChanged,
          ),
          CupertinoSwitch(
            value: _notifications,
            onChanged: _onNotificationsChanged,
          ),
          SwitchListTile(
            value: _notifications,
            onChanged: _onNotificationsChanged,
            title: const Text("Enable notifications"),
            subtitle: const Text("Enable notifications"),
          ),
          SwitchListTile.adaptive(
            value: _notifications,
            onChanged: _onNotificationsChanged,
            title: const Text("Enable notifications"),
          ),
          Checkbox(
            value: _notifications,
            onChanged: _onNotificationsChanged,
          ),
          CheckboxListTile(
              activeColor: Colors.black,
              title: const Text("Enable notifications"),
              value: _notifications,
              onChanged: _onNotificationsChanged),
          ListTile(
            onTap: () async {
              final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1980),
                  lastDate: DateTime(2030));
              print(date);
              final time = await showTimePicker(
                  context: context, initialTime: TimeOfDay.now());

              final booking = await showDateRangePicker(
                context: context,
                firstDate: DateTime(1980),
                lastDate: DateTime(2030),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData(
                      appBarTheme: const AppBarTheme(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),
                    ),
                    child: child!,
                  );
                },
              );
            },
            title: const Text("생일이 언제인가요?"),
          ),
          const AboutListTile(),
        ],
      ),
    );
  }
}
