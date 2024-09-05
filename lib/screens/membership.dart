import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:kahanify_app/custom_widgets/models/subscription.dart';
import 'package:kahanify_app/services/utilities/app_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Membership extends StatefulWidget {
  @override
  State<Membership> createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {


  final Dio _dio = Dio();

  Future<List<Subscription>> _fetchSubscriptions() async {
    try {
      final token = await _getToken();
      final response = await _dio.get(
        AppUrl.packages,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> subscriptionsJson = response.data['subscriptions'];
        return subscriptionsJson
            .map((json) => Subscription.fromJson(json))
            .toList();
      } else {
        print("Failed to fetch subscriptions, status code: ${response.statusCode}");
        throw Exception('Failed to fetch subscriptions');
      }
    } catch (e) {
      print("Error fetching subscriptions: $e");
      throw Exception('Failed to fetch subscriptions: $e');
    }
  }

  Future<String?> _getToken() async {
    print("Fetching token from SharedPreferences...");
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }



  // Future<List<Subscription>> fetchApi() async {
  //   Dio dio = Dio();
  //
  //   try {
  //
  //     var response = await dio.get(AppUrl.packages);
  //
  //     print(response.data.toString());
  //
  //     List jsonResponse = response.data;
  //     return jsonResponse.map<Subscription>((data) => Subscription.fromJson(data)).toList();
  //   } catch (e) {
  //
  //     print("Error fetching data: $e");
  //     throw Exception('Failed to load subscriptions');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Image(
                    image: AssetImage(
                      'assets/images/logo2.png',
                    ),
                    width: 45,
                    height: 45,
                    fit: BoxFit.cover,
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    'assets/images/logout.svg',
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            SizedBox(height: 6),
            Center(
                child: Text(
                  'All Stories',
                  style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffFF0087)),
                )),
            SizedBox(height: 6),
            Center(
                child: Text(
                  'Get Access to All the Stories on Kahanify',
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff17003C)),
                )),
            SizedBox(height: 6),
            Center(
                child: Text(
                  'Get Access to All the Stories on Kahanify',
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff000000)),
                )),
            SizedBox(height: 6),
            Expanded(
              child: FutureBuilder<List<Subscription>>(
                future: _fetchSubscriptions(),
                builder: (BuildContext context, AsyncSnapshot <List<Subscription>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No plans available'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final subscription = snapshot.data![index];
                        return Card(
                          margin: EdgeInsets.all(16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  'https://kahanifylaravel.kahanify.com/storage/${subscription.image}',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        subscription.name ?? '',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        subscription.description ?? '',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Rs ${subscription.price}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xffFF0087),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      InkWell(
                                        onTap: () {
                                          // Define the action on tap
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            color: Color(0xff17003C),
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                              child: Text(
                                                'Purchase',
                                                style:
                                                GoogleFonts.inter(fontSize: 15, color: Colors.white),
                                              )),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
