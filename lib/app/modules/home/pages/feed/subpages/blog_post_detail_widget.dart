import 'package:covid19app/app/shared/models/blog_post_model.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class BlogPostDetail extends StatelessWidget {
  BlogPostDetail(this.post) : assert(post != null);
  final BlogPostModel post;

  Widget _headerNews(BuildContext context, BlogPostModel article) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Hero(
            tag: this.post.hashCode,
            child: article.photo == null || article.photo.isEmpty
                ? Container()
                : FadeInImage.memoryNetwork(
                    image: post.photo,
                    placeholder: kTransparentImage,
                    fit: BoxFit.cover,
                  )),
        Container(
          padding: EdgeInsets.only(left: 0, right: 10, bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.keyboard_backspace,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _body(BuildContext context, BlogPostModel article) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: _headerNews(context, article),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  article.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF05A8F3),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Atualizado em: ${formatDate(post.postDate, [
                        dd,
                        '-',
                        mm,
                        '-',
                        yyyy
                      ])}',
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: Colors.black.withOpacity(0.4),
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Divider(
                  height: 20,
                  thickness: 1,
                ),
                Text(
                  article.body,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: _body(context, post),
    ));
    //   Stack(
    //     children: <Widget>[
    //       //_Content(post, category: "Nome do Autor" ?? null),
    //     ],
    //   ),
    // );
  }
}

// class _Content extends StatelessWidget {
//   _Content(
//     this.post, {
//     this.category,
//   }) : assert(post != null);

//   final DailyNews post;
//   final String category;

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: <Widget>[
//         image(),
//         SizedBox(height: 24.0),
//         title(context),
//         SizedBox(height: 8.0),
//         source(context),
//         SizedBox(height: 20.0),
//         preview(context),
//       ],
//     );
//   }

//   Widget source(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20.0),
//       child: Text(
//         'Atualizado em: ${formatDate(post.date, [dd, '-', mm, '-', yyyy])}',
//         style: Theme.of(context).textTheme.body1.copyWith(
//               fontWeight: FontWeight.w500,
//               color: Colors.black54,
//             ),
//       ),
//     );
//   }

//   Widget image() {
//     if (post.imgUrl != null) {
//       return FadeInImage.memoryNetwork(
//         image: post.imgUrl,
//         placeholder: kTransparentImage,
//         fit: BoxFit.cover,
//       );
//     } else {
//       return ImagePlaceholderWidget(
//         'No image',
//         height: 200.0,
//       );
//     }
//   }

//   Widget preview(BuildContext context) {
//     if (post.conteudo != null) {
//       return Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.0),
//         child: Text(
//           post.conteudo,
//           style: Theme.of(context).textTheme.body1.copyWith(
//                 fontSize: 16.0,
//                 height: 1.3,
//               ),
//         ),
//       );
//     } else {
//       return Container();
//     }
//   }

//   Widget articleCategory(BuildContext context) {
//     List<String> categories = ['us'];
//     if (category != null) {
//       if (category == 'home') {
//         categories.add('front page');
//       } else {
//         categories.add(category);
//       }
//     }
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: 38.0,
//       padding: EdgeInsets.symmetric(horizontal: 20.0),
//       child: ListView.separated(
//         shrinkWrap: true,
//         scrollDirection: Axis.horizontal,
//         itemCount: categories.length,
//         separatorBuilder: (BuildContext context, int index) {
//           return Text(
//             '  ¬  ',
//             style: Theme.of(context).textTheme.overline.copyWith(
//                   color: Colors.black54,
//                   fontSize: 13.0,
//                   height: 2.8,
//                 ),
//           );
//         },
//         itemBuilder: (BuildContext context, int index) {
//           return Text(
//             categories[index].toUpperCase(),
//             style: Theme.of(context).textTheme.overline.copyWith(
//                   fontSize: 13.0,
//                   height: 2.9,
//                 ),
//           );
//         },
//       ),
//     );
//   }

//   Widget title(BuildContext context) {
//     final String title = post.titulo != null
//         ? DailyNewsTileWidget.cleanTitle(post.titulo)
//         : '(No title)';
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20.0),
//       child: Text(
//         title,
//         style: Theme.of(context).textTheme.headline.copyWith(
//               height: 1.0,
//             ),
//       ),
//     );
//   }
// }
