import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:electronic_ecommerce/services/shared_preference.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String? image, name, email, phoneno;
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  // Fetch SharedPreferences
  getthesharedpref() async {
    image = await SharedPreferenceHelper().getUserImage() ??
        'assests/images/bag.png';
    name = await SharedPreferenceHelper().getUserName() ?? 'No Name';
    email = await SharedPreferenceHelper().getUserEmail() ?? 'No Email';
    phoneno = await SharedPreferenceHelper().getUserPhone() ?? 'No Phone';

    print('Image: $image');
    print('Name: $name');
    print('Email: $email');
    print('Phone: $phoneno');

    // Trigger the UI to update after fetching data
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getthesharedpref();
  }

 Future getImage() async {
  try {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    
      selectedImage = File(image!.path);
      await uploadItem();
    
  } catch (e) {
    print("Error picking image: $e");
  }
  setState(() {});
}


  uploadItem() async {
    if (selectedImage != null) {
      String addId = randomAlphaNumeric(10);
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child("blogImage").child(addId);

      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
      var downloadUrl = await (await task).ref.getDownloadURL();
      await SharedPreferenceHelper().saveUserImage(downloadUrl);

      // Update the UI with the new image
      image = downloadUrl;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        title: Center(
          child: Text(
            "Profile",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: Colors.white10,
      body: (image == null || email == null || phoneno == null)
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: Center(
                        child: selectedImage != null
                            ?
                             
                                Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(90),
                                  child: Image.file(
                                    selectedImage!,
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                               )
                             
                             :ClipRRect(
                              borderRadius: BorderRadius.circular(90),
                               child: Image.network(
                                  image!,
                                  height: 150.0,
                                  width: 150.0,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(Icons.account_box, size: 90);
                                  },
                                ),
                             )
                            
                      ),
                    ),
                    // Image.network(image!,height: 90.0,width: 90.0,fit: BoxFit.cover,),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 14),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                Text("My Information",style: TextStyle(fontSize: 22,),),
                SizedBox(height: 15,),
                
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(10),
                            child: ListTile(
                              leading: Icon(Icons.person_outline,size: 25,),
                              title: Text("Name",style: TextStyle(fontSize: 14,color: Colors.grey),),
                              subtitle: Text(
                                name!,
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                ),
                            ),
                          ),
                SizedBox(height: 15,),
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(10),
                            child: ListTile(
                              leading: Icon(Icons.email_outlined,size: 25,),
                              title: Text("Email",style: TextStyle(fontSize: 14,color: Colors.grey),),
                              subtitle: Text(
                                email!,
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                ),
                            ),
                          ),
                SizedBox(height: 15,),
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(10),
                            child: ListTile(
                              leading: Icon(Icons.phone,size: 25,),
                              title: Text("Phone no",style: TextStyle(fontSize: 14,color: Colors.grey),),
                              subtitle: Text(
                                phoneno!,
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                ),
                            ),
                          ),
                          SizedBox(height: 20,),
                Divider(
                  color: const Color.fromARGB(255, 184, 184, 184), // Line color
                  thickness: 2,       // Line thickness
                  indent: 10,         // Left padding
                  endIndent: 10,      // Right padding
                ),
                
                
                          SizedBox(height: 20,),
                          GestureDetector(
                            onTap: () {
                              
                            },
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(10),
                              child: ListTile(
                                leading: Icon(Icons.logout_outlined,size: 30,),
                                title: Text("LogOut",style: TextStyle(fontSize: 18),
                                
                                ),
                                trailing: Icon(Icons.arrow_forward_ios_outlined),
                               
                              ),
                            ),
                          ),
                
                          SizedBox(height: 15,),
                
                            GestureDetector(
                              onTap: (){},
                              child: Material(
                                
                              elevation: 5,
                              borderRadius: BorderRadius.circular(10),
                              child: ListTile(
                                leading: Icon(Icons.logout_outlined,size: 30,),
                                title: Text("Delete Account",style: TextStyle(fontSize: 18),
                                
                                ),
                                trailing: Icon(Icons.arrow_forward_ios_outlined),
                               
                              ),
                                                        ),
                            ),
                         
                        ],
                      ),
                    ),
                  
                  ],
                ),
              ),
            ),
    );
  }
}