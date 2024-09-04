
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../logic/cubits/product_cubit/product_cubit.dart';
import '../../../logic/cubits/product_cubit/product_state.dart';
import '../../widgets/product_list_view.dart';

class UserFeedScreen extends StatefulWidget {
  const UserFeedScreen({super.key});

  @override
  State<UserFeedScreen> createState() => _UserFeedScreenState();
}

// class _UserFeedScreenState extends State<UserFeedScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: 5,
//         itemBuilder: (context ,index){
//
//           return Row(
//             children: [
//               CachedNetworkImage(
//                 width: MediaQuery.of(context).size.width/3,
//                 imageUrl:"https://m.media-amazon.com/images/I/61iee3BTD8L._SY879_.jpg" ,
//               )
//             ],
//           );
//         });
//   }
// }
class _UserFeedScreenState extends State<UserFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {

          if(state is ProductLoadingState && state.products.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(state is ProductErrorState && state.products.isEmpty) {
            return Center(
              child: Text(state.message),
            );
          }

          return ProductListView(products: state.products);
        }
    );
  }
}