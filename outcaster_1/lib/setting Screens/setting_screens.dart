import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outcaster_1/setting%20Screens/ios%20list%20tile.dart';
import 'Globals.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return (Global.isIos == false)
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: const Text("Setting UI"),
              actions: [
                Switch(
                    activeColor: Colors.white,
                    activeTrackColor: Colors.grey.withOpacity(0.5),
                    value: Global.isIos,
                    onChanged: (val) {
                      setState(() {
                        Global.isIos = val;
                      });
                    })
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "common",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const ListTile(
                      title: Text("Language"),
                      subtitle: Text("English"),
                      leading: Icon(
                        Icons.language,
                        size: 30,
                      ),
                    ),
                    const Divider(),
                    const ListTile(
                      title: Text("Environment"),
                      subtitle: Text("Production"),
                      leading: Icon(
                        Icons.cloud_outlined,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Account",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const ListTile(
                      title: Text("Phone Number"),
                      leading: Icon(
                        Icons.phone,
                        size: 30,
                      ),
                    ),
                    const ListTile(
                      title: Text("Email"),
                      leading: Icon(
                        Icons.mail_outline,
                        size: 30,
                      ),
                    ),
                    const ListTile(
                      title: Text("Sign Out"),
                      leading: Icon(
                        Icons.logout,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Security",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: const Text("Lock app in bakground"),
                      leading: const Icon(
                        Icons.phonelink_lock,
                        size: 30,
                      ),
                      trailing: Switch(
                        activeTrackColor: Colors.red.withOpacity(0.5),
                        activeColor: Colors.red,
                        value: Global.backGoundOn,
                        onChanged: (val) {
                          setState(() {
                            Global.backGoundOn = val;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text("User fingerprint"),
                      leading: const Icon(
                        Icons.fingerprint,
                        size: 30,
                      ),
                      trailing: Switch(
                        activeTrackColor: Colors.red.withOpacity(0.5),
                        activeColor: Colors.red,
                        value: Global.fingerPrintOn,
                        onChanged: (val) {
                          setState(() {
                            Global.fingerPrintOn = val;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text("Change password"),
                      leading: const Icon(
                        Icons.lock,
                        size: 30,
                      ),
                      trailing: Switch(
                        activeTrackColor: Colors.red.withOpacity(0.5),
                        activeColor: Colors.red,
                        value: Global.passOn,
                        onChanged: (val) {
                          setState(() {
                            Global.passOn = val;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Misc",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const ListTile(
                      title: Text("Terms of Service"),
                      leading: Icon(
                        Icons.file_present,
                        size: 30,
                      ),
                    ),
                    const ListTile(
                      title: Text("Open source Licenses"),
                      leading: Icon(
                        Icons.file_copy_outlined,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : CupertinoPageScaffold(
            backgroundColor: const Color(0xfff3eff9),
            navigationBar: CupertinoNavigationBar(
                trailing: CupertinoSwitch(
                  activeColor: Colors.grey.withOpacity(0.5),
                  value: Global.isIos,
                  onChanged: (val) {
                    setState(() {
                      Global.isIos = val;
                    });
                  },
                ),
                backgroundColor: Colors.red,
                middle: const Text("Setting UI")),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "  common",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CupertinoListTile(
                      title: const Text("Language"),
                      leading: const Icon(Icons.language),
                      trailing: const Text("English >")),
                  CupertinoListTile(
                      title: const Text("Environment"),
                      leading: const Icon(Icons.cloud_outlined),
                      trailing: const Text("Production >")),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "  Account",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CupertinoListTile(
                      title: const Text("Phone Number"),
                      leading: const Icon(Icons.phone),
                      trailing: const Icon(CupertinoIcons.right_chevron)),
                  CupertinoListTile(
                      title: const Text("Email"),
                      leading: const Icon(Icons.mail_outline),
                      trailing: const Icon(CupertinoIcons.right_chevron)),
                  CupertinoListTile(
                      title: const Text("Sogn Out"),
                      leading: const Icon(Icons.logout),
                      trailing: const Icon(CupertinoIcons.right_chevron)),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "  Security",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CupertinoListTile(
                      title: const Text("Lock app in background"),
                      leading: const Icon(Icons.phonelink_lock),
                      trailing: CupertinoSwitch(
                        activeColor: Colors.red,
                        value: Global.backGoundOn,
                        onChanged: (val) {
                          setState(() {
                            Global.backGoundOn = val;
                          });
                        },
                      )),
                  CupertinoListTile(
                      title: const Text("Use fingerprint"),
                      leading: const Icon(Icons.fingerprint),
                      trailing: CupertinoSwitch(
                        activeColor: Colors.red,
                        value: Global.fingerPrintOn,
                        onChanged: (val) {
                          setState(() {
                            Global.fingerPrintOn = val;
                          });
                        },
                      )),
                  CupertinoListTile(
                      title: const Text("Change password"),
                      leading: const Icon(Icons.lock),
                      trailing: CupertinoSwitch(
                        activeColor: Colors.red,
                        value: Global.passOn,
                        onChanged: (val) {
                          setState(() {
                            Global.passOn = val;
                          });
                        },
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "  Misc",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CupertinoListTile(
                      title: const Text("Terms of services"),
                      leading: const Icon(Icons.file_copy_outlined),
                      trailing: const Icon(CupertinoIcons.right_chevron)),
                  CupertinoListTile(
                      title: const Text("Open source licenses"),
                      leading: const Icon(Icons.file_open_outlined),
                      trailing: const Icon(CupertinoIcons.right_chevron)),
                ],
              ),
            ));
  }
}
