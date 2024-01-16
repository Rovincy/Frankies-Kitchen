// import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:frankies_kitchen/view/processingOrderPage.dart';
import 'package:frankies_kitchen/widget/backgroundColor.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'newIncomingOrderPage.dart';

class KitchScreen extends StatefulWidget {
  const KitchScreen({super.key});

  @override
  State<KitchScreen> createState() => _KitchScreenState();
}

class _KitchScreenState extends State<KitchScreen> {
  // late Future<List<KitchenModel>> kitchens;
  // List<String> locations = [];
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   kitchens = getKitchens();
  // }
  // TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()async{
            final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
            sharedPreferences.clear();
            Get.offAllNamed('/Login');
        },icon:const Icon(Icons.logout)),
        elevation: 0.0,
        backgroundColor: backgroundColor(),
        // title: const Text(
        //   'Kitchen',
        //   style: TextStyle(fontWeight: FontWeight.bold),
        // ),
        // title: 
        //   Container(
        //       width: Get.width * 0.15,
        //       height: Get.height * 0.05,
        //       padding: const EdgeInsets.symmetric(horizontal: 20.0),
        //       decoration: const BoxDecoration(
        //         color: Color.fromARGB(255, 242, 242, 242),
        //         borderRadius: BorderRadius.all(
        //           Radius.circular(8),
        //         ),
        //       ),
        //       child: FutureBuilder(
        //         future: getKitchens(),
        //         builder: (context, AsyncSnapshot snapshot) {
        //           // if (snapshot.hasData) {
        //             // for (var element in snapshot.data) {
        //             //   locations.add(element.name);
        //             // }
        //             return ListView(
        //               children: [
        //                 DropdownSearch<String>(
        //                   mode: Mode.MENU,
        //                   showSelectedItems: true,
        //                   items: kitchenList.kitchenModel!
        //                 .map((e) => e.name!)
        //                 .toList(),
        //                   dropdownSearchDecoration: InputDecoration(
        //                     labelText: '${context.read<FilterLocation>().locationId==null?"Location": kitchenList.kitchenModel![kitchenList.kitchenModel!.indexWhere((element) => element.id==context.read<FilterLocation>().locationId!)].name}',
        //                     hintText: "Please select your kitchen below",
        //                   ),
        //                   // popupItemDisabled: isItemDisabled,
        //                   onChanged: (value){
        //                     // print(value);
        //                     for (var element in kitchenList.kitchenModel!
        //                         .where((element) => element.name.toString().toLowerCase() == value.toString().toLowerCase())) {
        //                           // print(element.id);
        //                        context.read<FilterLocation>().setId(element.id!);
        //                     }
        //                     // setState(() async {
        //                     // });
        //                     // setState(() {
        //                       (context as Element).markNeedsBuild();
        //                     // });
        //                   },
        //                   //selectedItem: "",
        //                   showSearchBox: true,
        //                   searchFieldProps: TextFieldProps(
        //                     cursorColor: Colors.blue,
        //                   ),
        //                 ),
        //               ],
        //             );
        //           // } else if (snapshot.hasError) {
        //           //   return Text(snapshot.error.toString());
        //           // } else {
        //           //   return Center(child: CircularProgressIndicator());
        //           // }
        //         },
        //       )),
        // actions: [
        //   IconButton(onPressed: (){
        //     printerSelectorDialog(context);
        //     // Get.to(()=>const PrinterSelectionPage());
        //   }, icon: const Icon(Icons.print)),
        // ],
        //         actions: [
        //   Container(
        //     margin: const EdgeInsets.all(5),
        //     padding: const EdgeInsets.symmetric(horizontal: 10),
        //     alignment: Alignment.center,
        //     width: 250.0,
        //     height: 10.0,
        //     decoration: BoxDecoration(
        //       color: Colors.white.withOpacity(0.7),
        //       borderRadius: BorderRadius.circular(40.0)
        //     ),
        //     child: Row(
        //       children: [
        //         const Icon(Icons.search,color: Colors.white),
        //         Container(
        //           width: 200.0,
        //           padding: const EdgeInsets.symmetric(horizontal: 10),
        //           child: TextFormField(
        //             controller: _search,
        //             onChanged: (value){
        //               setState(() {
                        
        //               });
        //               // (context as Element).markNeedsBuild();
        //               // (context as Element).markNeedsBuild();
        //             },
        //             decoration: const InputDecoration(
        //               border: InputBorder.none,
        //               hintText: 'Search here'
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        //   const SizedBox(width: 20.0,)
        // ],
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: Get.width*0.49,
              height: Get.height,
              // color: Colors.red,
              child: const NewIncomingOrderPage(),
            ),
             VerticalDivider(
              color: Colors.black,
              // thickness: 100,
            ),
            Container(
              width: Get.width*0.49,
              height: Get.height,
              // color: Colors.blue,
              child: const ProcessingOrderPage(),
            ),
          ],
        ),
      ),
   
    );
  }
}
