import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_1/repository/movie_repository.dart';
import '../model/movie_model.dart';
import '../style/style.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // repository
  MovieRepository _movieRepository = MovieRepository();

  // var
  late final Future<List<MovieModel?>> _listSearch;
  TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listSearch = _movieRepository.searchMovie('MUÔN VỊ NHÂN GIAN');
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        foregroundColor: white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Search-bar
            Container(
              margin: EdgeInsets.fromLTRB(20, 8, 20, 16),
              child: TextFormField(
                style: TextStyle(color: white),
                controller: _searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                      color: white.withOpacity(0.6), fontWeight: light),
                  filled: true,
                  fillColor: white.withOpacity(0.1),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      String keyword = _searchController.text.trim();
                      _listSearch = _movieRepository.searchMovie(keyword);
                    },
                  ),
                  prefixIconColor: white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Search-Quantity
                  Row(
                    children: [
                      Text(
                        'ALL',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: semibold,
                        ),
                      ),
                      Gap(8),
                      Text(
                        '(21 results)',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: light,
                          color: white.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                  Gap(16),

                  //Results-List

                  // FutureBuilder(future: _listSearch, builder: (context,SnapShot){
                  //   return ListView.builder(
                  //     itemCount: SnapShot.data!.length,
                  //     itemBuilder: (context,index){
                  //       return Column(
                  //         children: [
                  //           //Movie-Image
                  //           Container(
                  //             width: size.width,
                  //             height: size.width / 3,
                  //             child: ClipRRect(
                  //               borderRadius: BorderRadius.circular(10),
                  //               child: Image.network(
                  //                 'https://static1.colliderimages.com/wordpress/wp-content/uploads/2024/03/ghostbusters-frozen-empire-poster-full-cast.jpg',
                  //                 fit: BoxFit.cover,
                  //               ),
                  //             ),
                  //             decoration: BoxDecoration(
                  //               gradient: LinearGradient(
                  //                 begin: Alignment.topCenter,
                  //                 end: Alignment.bottomCenter,
                  //                 colors: [
                  //                   black.withOpacity(0.1),
                  //                   black,
                  //                 ],
                  //               ),
                  //               borderRadius: BorderRadius.circular(10),
                  //             ),
                  //           ),
                  //           Gap(16),
                  //
                  //           //Movie-Info
                  //           Container(
                  //             width: size.width,
                  //             child: Column(
                  //               children: [
                  //                 //Rating-&-Details-button
                  //                 Row(
                  //                   mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //                   children: [
                  //                     //Rating
                  //                     Container(
                  //                       width: size.width / 3 * 2,
                  //                       child: Column(
                  //                         mainAxisAlignment:
                  //                         MainAxisAlignment.start,
                  //                         crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                         children: [
                  //                           Text(
                  //                             'BIỆT ĐỘI SĂN MA: KỶ NGUYÊN BĂNG GIÁ',
                  //                             maxLines: 1,
                  //                             overflow: TextOverflow.ellipsis,
                  //                             style: TextStyle(
                  //                                 fontSize: 16,
                  //                                 fontWeight: semibold),
                  //                           ),
                  //                           Gap(8),
                  //                           Row(
                  //                             children: [
                  //                               Icon(Icons.star,
                  //                                   color: yellow, size: 14),
                  //                               Gap(6),
                  //                               Text(
                  //                                 '4.7',
                  //                                 style: TextStyle(
                  //                                     fontSize: 14,
                  //                                     fontWeight: medium),
                  //                               ),
                  //                             ],
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),
                  //
                  //                     //Details-button
                  //                     Container(
                  //                       padding: EdgeInsets.all(10),
                  //                       decoration: BoxDecoration(
                  //                         color: yellow,
                  //                         borderRadius: BorderRadius.circular(5),
                  //                       ),
                  //                       child: Text(
                  //                         'DETAILS',
                  //                         style: TextStyle(
                  //                             color: black,
                  //                             fontWeight: bold,
                  //                             fontSize: 12),
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //                 Gap(10),
                  //
                  //                 //Genre-Time-Date
                  //                 Row(
                  //                   mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //                   children: [
                  //                     Container(
                  //                         width: size.width / 2 - 16,
                  //                         child:
                  //                         Text('Action, Adventure, Fantasy',
                  //                             style: TextStyle(
                  //                               fontSize: 14,
                  //                               fontWeight: light,
                  //                               color: white.withOpacity(0.7),
                  //                             ))),
                  //                     Container(
                  //                         width: size.width / 4 - 16,
                  //                         child: Text('T16',
                  //                             textAlign: TextAlign.center,
                  //                             style: TextStyle(
                  //                               fontSize: 14,
                  //                               fontWeight: light,
                  //                               color: white.withOpacity(0.7),
                  //                             ))),
                  //                     Container(
                  //                         width: size.width / 4 - 16,
                  //                         child: Text('20/05/2024',
                  //                             textAlign: TextAlign.end,
                  //                             style: TextStyle(
                  //                               fontSize: 14,
                  //                               fontWeight: light,
                  //                               color: white.withOpacity(0.7),
                  //                             ))),
                  //                   ],
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       );
                  //     },
                  //   );
                  // }),
                  //


                  Column(
                    children: [
                      //Movie-Item
                      Column(
                        children: [
                          //Movie-Image
                          Container(
                            width: size.width,
                            height: size.width / 3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                'https://static1.colliderimages.com/wordpress/wp-content/uploads/2024/03/ghostbusters-frozen-empire-poster-full-cast.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  black.withOpacity(0.2),
                                  black.withOpacity(0.8),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Gap(16),

                          //Movie-Info
                          Container(
                            width: size.width,
                            child: Column(
                              children: [
                                //Rating-&-Details-button
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //Rating
                                    Container(
                                      width: size.width / 3 * 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'BIỆT ĐỘI SĂN MA: KỶ NGUYÊN BĂNG GIÁ',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: semibold),
                                          ),
                                          Gap(8),
                                          Row(
                                            children: [
                                              Icon(Icons.star,
                                                  color: yellow, size: 14),
                                              Gap(6),
                                              Text(
                                                '4.7',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: medium),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    //Details-button
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: yellow,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text(
                                        'DETAILS',
                                        style: TextStyle(
                                            color: black,
                                            fontWeight: bold,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(10),

                                //Genre-Time-Date
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: size.width / 2 - 16,
                                        child:
                                            Text('Action, Adventure, Fantasy',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: light,
                                                  color: white.withOpacity(0.7),
                                                ))),
                                    Container(
                                        width: size.width / 4 - 16,
                                        child: Text('T16',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: light,
                                              color: white.withOpacity(0.7),
                                            ))),
                                    Container(
                                        width: size.width / 4 - 16,
                                        child: Text('20/05/2024',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: light,
                                              color: white.withOpacity(0.7),
                                            ))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Gap(32),

                      //Movie-Item
                      //Movie-Item
                      //Movie-Item
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
