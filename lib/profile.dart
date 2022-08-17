import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
   Profile({Key? key,this.user}) : super(key: key);
  User? user;
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  @override
  Widget build(BuildContext context) {
    return widget.user ==null ?
    Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                    child: CircularProgressIndicator
                    (
                      color: Colors.purple,
                    ),
                  ),
              ):
    Scaffold
    (
      appBar: AppBar
      (
        title: Text('ProfilePage'),
      ),
      body: SingleChildScrollView
      (
        child: Column
        (
          children: 
          [
            CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                  child: ClipOval(
                    child: SizedBox(
                        width: 80.0,
                        height: 80.0,
                        // child: Icon(Icons.account_circle, size: 70)),
                     child:(widget.user!.photoURL != null)
                        ? Image.network(
                            widget.user!.photoURL.toString(),
                            fit: BoxFit.cover,
                          )
                        : CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Text(widget.user!.displayName![0],style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),),
                          ),
                    // Image.network(user.displayName[0])
                  
                    // Text(username[1])
                    // Image(image: NetworkImage('$username[1])'),
                    // Image.network("https://wallpaper.dog/large/20469131.jpg",fit: BoxFit.cover,),
                  ),
                  )
                              ),
            Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text(widget.user!.email.toString(),
                      // "John Doe", 
                      style: TextStyle
                      (
                        fontFamily: 'PT Sans',
                        color: Colors.black, fontWeight: FontWeight.w600),),
                  ),
          ],
        ),
      ),
    );


    // return user == null ?Scaffold(
    //   body: Center(child: CircularProgressIndicator()),
    // ):Scaffold
    // (
    //   appBar: AppBar(
    //     brightness: Brightness.dark,
    //     backgroundColor: Colors.purple,
    //     elevation: 0,
    //     centerTitle: true,
    //     title: Text('My Profile',
    //         style: TextStyle(
    //             fontFamily: 'inter',
    //             fontWeight: FontWeight.w400,
    //             fontSize: 16)),
    //   ),
    //   body: ListView
    //   (
    //     shrinkWrap: true,
    //     children: 
    //     [
    //       user!.email==null?
    //         Center(
    //               child: CircularProgressIndicator(),
    //             )
    //         :
    //         Container(
    //               color: Colors.purple,
    //               padding: EdgeInsets.symmetric(vertical: 24),
    //               child: GestureDetector(
    //                 // onTap: () => _showModalBottomSheet(context),
    //                 onTap: () {
    //                   print('Code to open file manager');
    //                 },
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: [
    //                     // Container(
    //                     //   width: 100,
    //                     //   height: 70,
    //                     //   getProfileImage();
    //                     // ),
    //                     // Container(
    //                     //   width: 130,
    //                     //   height: 130,
    //                     //   margin: EdgeInsets.only(bottom: 15),
    //                     //   child: CircleAvatar(
    //                     //     radius: 100,
    //                     //     backgroundColor: Colors.grey,
    //                     //     child: ClipOval(
    //                     //       child: SizedBox(
    //                     //         width: 180.0,
    //                     //         height: 180.0,
    //                     //         child: (_image != null) ? Image.file(_image,fit: BoxFit.cover):
    //                     //         Image.network("https://wallpaper.dog/large/20469131.jpg",fit: BoxFit.cover,),
    //                     //       ),
    //                     //     ),
    //                     //   ),
    //                     // decoration: BoxDecoration(
    //                     //   color: Colors.grey,
    //                     //   borderRadius: BorderRadius.circular(100),
    //                     //   // Profile Picture
    //                     //   image: DecorationImage(image: AssetImage('assets/images/profile.jpg'), fit: BoxFit.cover),
    //                     // ),
    //                     // ),

    //                     CircleAvatar(
    //                       radius: 60,
    //                       backgroundColor: Colors.grey,
    //                       child: ClipOval(
    //                         child: SizedBox(
    //                             width: 160.0,
    //                             height: 160.0,
    //                             child: Icon(Icons.account_circle, size: 70)),
    //                         //  (user.photoURL != null)
    //                         //     ? Image.network(
    //                         //         user.photoURL,
    //                         //         fit: BoxFit.cover,
    //                         //       )
    //                         //     : CircleAvatar(
    //                         //         backgroundColor: Colors.yellow,
    //                         //         child: Text(user.displayName[0]),
    //                         //       ),
    //                         // Image.network(user.displayName[0])

    //                         // Text(username[1])
    //                         // Image(image: NetworkImage('$username[1])'),
    //                         // Image.network("https://wallpaper.dog/large/20469131.jpg",fit: BoxFit.cover,),
    //                       ),
    //                     ),

    //                     // Row(
    //                     //   mainAxisAlignment: MainAxisAlignment.center,
    //                     //   children: [
    //                     //     Text('Change Profile Picture', style: TextStyle(fontFamily: 'inter', fontWeight: FontWeight.w600, color: Colors.white)),
    //                     //     SizedBox(width: 8),
    //                     //     SvgPicture.asset('assets/icons/camera.svg', color: Colors.white),
    //                     //   ],
    //                     // )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //     ],
    //   ),
    // );
  }
}