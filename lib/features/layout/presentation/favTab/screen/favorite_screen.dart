import 'package:ecommerce/core/utils/colors.dart';
import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/features/layout/presentation/favTab/cubit/favorite_cubit.dart';
import 'package:ecommerce/features/layout/presentation/favTab/cubit/favorite_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<FavoritesCubit,FavoritesState>(
      builder: (context, state) {
        if(state is FavoritesInitial){
          return Center(child: Text("favorites is empty"),) ;
        }
        if(state is FavoritesLoaded){
          return Scaffold(
            appBar: AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)
                )
              ),
              backgroundColor: AppColors.primary,
              title: Text("Wishlist",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.white
              ),),
              centerTitle: true,
            ),
            body: ListView.builder(
              itemCount: state.favoriteProducts.length,
              itemBuilder: (context, index) {
                var favorite = state.favoriteProducts[index];
                return ListTile(
                  leading: Image.network(favorite.image,width: 70,height: 70,),
                  title: Text(favorite.title,style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(favorite.description,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
                  trailing: IconButton(
                      onPressed: (){
                        context.read<FavoritesCubit>().toggleFavorite(favorite);
                      },
                      icon: Icon(CupertinoIcons.delete,color: AppColors.red,)),
                ) ;
              },
            ),
          ) ;
        }
        return SizedBox() ;
      },
    ) ;
  }
}
