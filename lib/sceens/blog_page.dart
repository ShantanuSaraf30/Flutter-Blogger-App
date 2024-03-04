import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  List<BlogPost> blogPosts = [
    BlogPost(
      title: 'Goa',
      username: 'Shantanu_saraf',
      image: 'images/goa.jpg',
      description:
      'Goa is the perfect mix of natural beauty, lively nightlife, and tropical environs. Check out our Goa blog portal...',
    ),
    BlogPost(
      title: 'Gateway of India',
      username: 'Rushi_yeoli',
      image: 'images/gateway.jpeg',
      description:
      'Summer, winter, spring or monsoon, the Gateway of India is one of the favorite hangout spots for Mumbaikars...',
    ),
    BlogPost(
      title: 'Taj Hotels: Preserving India\'s Cultural Heritage',
      username: 'Shantanu_saraf',
      image: 'images/taj.jpg',
      description:
      'India, a land where history and modernity harmoniously intertwine, stands as a living testament to the splendour of its architectural wonders...',
    ),
  ];

  List<BlogPost> filteredPosts = [];

  @override
  void initState() {
    filteredPosts = blogPosts;
    super.initState();
  }

  void filterPosts(String query) {
    setState(() {
      filteredPosts = blogPosts
          .where((post) => post.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: BlogSearch(filterPosts),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredPosts.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Text(
                  'Username: ${filteredPosts[index].username}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(filteredPosts[index].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(10),
                  title: Text(
                    filteredPosts[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    filteredPosts[index].description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    // Add functionality for tapping on blog post
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BlogPost {
  final String title;
  final String username;
  final String image;
  final String description;

  BlogPost({
    required this.title,
    required this.username,
    required this.image,
    required this.description,
  });
}

class BlogSearch extends SearchDelegate<String> {
  final Function(String) filterFunction;

  BlogSearch(this.filterFunction);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    filterFunction(query);
    return Container(); // This is to avoid showing any results here, as filtered posts are directly displayed in the main screen
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(); // Suggestions are not needed in this case
  }
}
