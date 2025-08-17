import 'package:ecommerce/core/utils/colors.dart';
import 'package:ecommerce/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15,
          children: [
            CustomText(text: "Welcome, Mahmoud",fontSize: 18,fontWeight: FontWeight.bold,color: AppColors.blue,),
            Column(
              spacing: 6,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: "Your full name",fontSize: 16,fontWeight: FontWeight.bold,color: AppColors.primary,),
                Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary,width: 1.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: "Mahmoud Diab",fontWeight: FontWeight.bold,),
                      Icon(Icons.person)
                    ],
                  ),
                ),
              ],
            ),
            Column(
              spacing: 6,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: "Your Email",fontSize: 16,fontWeight: FontWeight.bold,color: AppColors.primary,),
                Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary,width: 1.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: "Mahmoud123@gmail.com",fontWeight: FontWeight.bold,),
                      Icon(Icons.alternate_email_sharp)
                    ],
                  ),
                ),
              ],
            ),
            Column(
              spacing: 6,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: "Your mobile number",fontSize: 16,fontWeight: FontWeight.bold,color: AppColors.primary,),
                Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary,width: 1.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: "01070662159",fontWeight: FontWeight.bold,),
                      Icon(Icons.phone)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
