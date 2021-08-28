import 'package:covid19app/app/modules/home/pages/feed/subpages/blog_post_detail_widget.dart';
import 'package:covid19app/app/shared/models/blog_post_model.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class BlogPostTileWidget extends StatelessWidget {
  final BlogPostModel newsItem;

  const BlogPostTileWidget(this.newsItem);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlogPostDetail(newsItem),
              ),
            ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.09),
                    blurRadius: 20,
                    spreadRadius: 3.5,
                    offset: Offset(0, 13)),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xffD6D6D6).withOpacity(0.15),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          '${formatDate(newsItem.postDate, [
                            dd,
                            '-',
                            mm,
                            '-',
                            yyyy
                          ])}',
                          style: TextStyle(
                              //color: Colors.grey[400],
                              color: Colors.black38,
                              fontSize: 13),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              newsItem?.title ?? '',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff8A8A8A),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Flexible(
                  flex: 4,
                  child: Hero(
                    tag: this.newsItem.hashCode,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.21,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                          image: newsItem?.photo != null
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(newsItem?.photo))
                              : DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/icons/placeholder.png'))),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  static String cleanTitle(String originalTitle) {
    List<String> split = originalTitle.split(' - ');
    return split[0];
  }
}
