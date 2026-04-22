import 'package:flutter/material.dart';
import 'package:flutter_application_day7/models/profile_model.dart';
import 'package:flutter_application_day7/weidget/custom_profile_data.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  static List<ProfileModel> porfiledata = [
    ProfileModel(myicon: Icons.favorite, title: 'favourite'),
    ProfileModel(myicon: Icons.download, title: 'download'),
    ProfileModel(myicon: Icons.language, title: 'language'),
    ProfileModel(myicon: Icons.location_city, title: 'location'),
    ProfileModel(myicon: Icons.clear_all, title: 'clear cache'),
    ProfileModel(myicon: Icons.clear, title: 'clear history'),
    ProfileModel(myicon: Icons.logout, title: 'logout'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Color(0xff000000),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                ),
                const SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'YAN',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'yan@gmail.com',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        print("clicked...");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff6055D8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(15),
                        ),
                      ),

                      child: const Text('Edit profile'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView.separated(
                itemCount: porfiledata.length,
                itemBuilder: (BuildContext context, int index) {
                  return (index == 1 || index == 5)
                      ? Column(
                          children: [
                            CustomProfileData(
                              favorite: porfiledata[index].title,
                              myicon: porfiledata[index].myicon,
                            ),
                            SizedBox(height: 25),
                            Divider(
                              thickness: 1,
                              indent: 70,
                              endIndent: 29,
                              color: Colors.black,
                            ),
                          ],
                        )
                      : CustomProfileData(
                          favorite: porfiledata[index].title,
                          myicon: porfiledata[index].myicon,
                        );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 25);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
