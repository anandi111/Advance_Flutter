import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PermissionStatus locationPermission = PermissionStatus.denied;
  PermissionStatus cameraPermission = PermissionStatus.denied;
  PermissionStatus calenderPermission = PermissionStatus.denied;
  PermissionStatus contactsPermission = PermissionStatus.denied;
  PermissionStatus externalPermission = PermissionStatus.denied;
  PermissionStatus bluetoothPermission = PermissionStatus.denied;
  PermissionStatus notificationPermission = PermissionStatus.denied;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              const Text(
                "Permissions",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),

              ///1
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                tileColor: Colors.teal,
                title: const Text("Location"),
                subtitle: (locationPermission.isGranted == true)
                    ? Text(locationPermission.toString().split(".")[1])
                    : const Text(""),
                leading: const Icon(
                  Icons.pin_drop_outlined,
                  size: 30,
                ),
                onTap: () async {
                  locationPermission = await Permission.location.request();
                  setState(() {});
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      dismissDirection: DismissDirection.up,
                      duration: const Duration(seconds: 2),
                      backgroundColor:
                          (locationPermission == PermissionStatus.granted)
                              ? Colors.green
                              : Colors.red,
                      content: Text("$locationPermission")));
                },
              ),
              const SizedBox(
                height: 20,
              ),

              ///2
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                tileColor: Colors.tealAccent,
                title: const Text("Camera"),
                subtitle: (cameraPermission.isGranted == true)
                    ? Text(cameraPermission.toString().split(".")[1])
                    : const Text(""),
                leading: const Icon(
                  Icons.pin_drop_outlined,
                  size: 30,
                ),
                onTap: () async {
                  cameraPermission = await Permission.camera.request();
                  setState(() {});
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      dismissDirection: DismissDirection.up,
                      duration: const Duration(seconds: 2),
                      backgroundColor:
                          (cameraPermission == PermissionStatus.granted)
                              ? Colors.green
                              : Colors.red,
                      content: Text("$cameraPermission")));
                },
              ),
              const SizedBox(
                height: 30,
              ),

              ///3
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                tileColor: Colors.teal,
                title: const Text("Calender"),
                subtitle: (calenderPermission.isGranted == true)
                    ? Text(calenderPermission.toString().split(".")[1])
                    : const Text(""),
                leading: const Icon(
                  Icons.pin_drop_outlined,
                  size: 30,
                ),
                onTap: () async {
                  calenderPermission = await Permission.calendar.request();
                  setState(() {});
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      dismissDirection: DismissDirection.up,
                      duration: const Duration(seconds: 2),
                      backgroundColor:
                          (calenderPermission == PermissionStatus.granted)
                              ? Colors.green
                              : Colors.red,
                      content: Text("$calenderPermission")));
                },
              ),
              const SizedBox(
                height: 20,
              ),

              ///4
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                tileColor: Colors.tealAccent,
                title: const Text("Contacts"),
                subtitle: (contactsPermission.isGranted == true)
                    ? Text(contactsPermission.toString().split(".")[1])
                    : const Text(""),
                leading: const Icon(
                  Icons.pin_drop_outlined,
                  size: 30,
                ),
                onTap: () async {
                  contactsPermission = await Permission.contacts.request();
                  setState(() {});
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      dismissDirection: DismissDirection.up,
                      duration: const Duration(seconds: 2),
                      backgroundColor:
                          (contactsPermission == PermissionStatus.granted)
                              ? Colors.green
                              : Colors.red,
                      content: Text("$contactsPermission")));
                },
              ),
              const SizedBox(
                height: 20,
              ),

              ///5
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                tileColor: Colors.teal,
                title: const Text("Internet"),
                subtitle: (externalPermission.isGranted == true)
                    ? Text(externalPermission.toString().split(".")[1])
                    : const Text(""),
                leading: const Icon(
                  Icons.pin_drop_outlined,
                  size: 30,
                ),
                onTap: () async {
                  externalPermission =
                      await Permission.manageExternalStorage.request();
                  setState(() {});
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      dismissDirection: DismissDirection.up,
                      duration: const Duration(seconds: 2),
                      backgroundColor:
                          (externalPermission == PermissionStatus.granted)
                              ? Colors.green
                              : Colors.red,
                      content: Text("$externalPermission")));
                },
              ),
              const SizedBox(
                height: 20,
              ),

              ///6
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                tileColor: Colors.tealAccent,
                title: const Text("Bluetooth"),
                subtitle: (bluetoothPermission.isGranted == true)
                    ? Text(bluetoothPermission.toString().split(".")[1])
                    : const Text(""),
                leading: const Icon(
                  Icons.pin_drop_outlined,
                  size: 30,
                ),
                onTap: () async {
                  bluetoothPermission = await Permission.bluetooth.request();
                  setState(() {});
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      dismissDirection: DismissDirection.up,
                      duration: const Duration(seconds: 2),
                      backgroundColor:
                          (bluetoothPermission == PermissionStatus.granted)
                              ? Colors.green
                              : Colors.red,
                      content: Text("$bluetoothPermission")));
                },
              ),
              const SizedBox(
                height: 20,
              ),

              ///7
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                tileColor: Colors.teal,
                title: const Text("Notification"),
                subtitle: (notificationPermission.isGranted == true)
                    ? Text(notificationPermission.toString().split(".")[1])
                    : const Text(""),
                leading: const Icon(
                  Icons.pin_drop_outlined,
                  size: 30,
                ),
                onTap: () async {
                  notificationPermission =
                      await Permission.notification.request();
                  setState(() {});
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      dismissDirection: DismissDirection.up,
                      duration: const Duration(seconds: 2),
                      backgroundColor:
                          (notificationPermission == PermissionStatus.granted)
                              ? Colors.green
                              : Colors.red,
                      content: Text("$notificationPermission")));
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.tealAccent,
        onPressed: () {
          openAppSettings();
        },
        child: const Icon(
          Icons.settings,
          color: CupertinoColors.darkBackgroundGray,
        ),
      ),
    );
  }
}
