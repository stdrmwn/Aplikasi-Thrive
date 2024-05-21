import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xff29AFFF), // Warna Primer
      ),
      home: const NavigationExample(),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({Key? key}) : super(key: key);

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const ThriveHubPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor:
            Colors.blueAccent, // Latar belakang BottomNavigationBar
        selectedItemColor: Colors.orange, // Warna item yang dipilih
        unselectedItemColor: Colors.white, // Warna item yang tidak dipilih
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center),
            label: 'Thrive Hub',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            const Text(
              'Hi Steven Dermawan!',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            const SizedBox(height: 10),
            RichText(
              text: const TextSpan(
                text: 'Let\'s Connect, Grow, and ',
                style: TextStyle(fontSize: 18, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Thrive.',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Search Bar
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Icon(Icons.recommend, color: Colors.blue),
                SizedBox(width: 10),
                Text(
                  'Recommended Communities',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Display three cards horizontally
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CardExample(
                    title: 'Art Community',
                    subtitle: 'Discuss visual arts',
                    content:
                        'Join this community to share and discuss your favorite visual art pieces.',
                    materialDescription:
                        'Explore a variety of art forms, from paintings to digital art, and learn techniques from experts.',
                    onPressed1: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChatForumPage()),
                      );
                    },
                    onPressed2: () {
                      // Action for the second button
                    },
                  ),
                  const SizedBox(width: 10),
                  CardExample(
                    title: 'Chess Community',
                    subtitle: 'Discuss chess games',
                    content:
                        'Join other chess enthusiasts to learn new strategies and share playing experiences.',
                    materialDescription:
                        'Study famous games, learn strategies, and participate in online tournaments.',
                    onPressed1: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChatForumPage()),
                      );
                    },
                    onPressed2: () {
                      // Action for the second button
                    },
                  ),
                  const SizedBox(width: 10),
                  CardExample(
                    title: 'Essay Community',
                    subtitle: 'Gather to write and read essays',
                    content:
                        'Join writers and readers to share thoughts and written works.',
                    materialDescription:
                        'Access a library of essays, attend writing workshops, and get feedback from peers.',
                    onPressed1: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChatForumPage()),
                      );
                    },
                    onPressed2: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Icon(Icons.info, color: Colors.blue),
                SizedBox(width: 10),
                Text(
                  'Information Portal',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Event Info: IOT Exhibition, May 29, 2024, 08:00 - 10:00, Pradita University'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                },
                child: const Text('Upcoming Event'),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'New Features',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'We have introduced new features in our app. Check out the latest updates and improvements.',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Safety Guidelines',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Read our latest safety guidelines to stay safe while interacting in communities.',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Icon(Icons.event, color: Colors.blue),
                SizedBox(width: 10),
                Text(
                  'Upcoming Events',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.event, color: Colors.blueAccent),
              title: Text('IOT Exhibition'),
              subtitle: Text('May 29, 2024, 08:00 - 10:00, Pradita University'),
              onTap: () {
                // Action to show more details about the event
              },
            ),
            ListTile(
              leading: Icon(Icons.event, color: Colors.blueAccent),
              title: Text('AI Workshop'),
              subtitle: Text('June 5, 2024, 10:00 - 12:00, Tech Center'),
              onTap: () {
                // Action to show more details about the event
              },
            ),
            ListTile(
              leading: Icon(Icons.event, color: Colors.blueAccent),
              title: Text('Startup Pitch Day'),
              subtitle: Text('June 12, 2024, 14:00 - 16:00, Innovation Hub'),
              onTap: () {
                // Action to show more details about the event
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Icon(Icons.notification_important, color: Colors.blue),
                SizedBox(width: 10),
                Text(
                  'Important Notifications',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Maintenance Notice: The app will undergo maintenance on May 30, 2024, from 00:00 to 04:00. Please save your work.',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Policy Update: Our privacy policy has been updated. Please review the changes.',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThriveHubPage extends StatefulWidget {
  const ThriveHubPage({Key? key}) : super(key: key);

  @override
  _ThriveHubPageState createState() => _ThriveHubPageState();
}

class _ThriveHubPageState extends State<ThriveHubPage> {
  final List<Community> communities = [
    Community(
      name: 'Komunitas Donor Darah',
      description:
          'Bergabunglah dengan komunitas donor darah untuk membantu sesama.',
      category: 'Sosial',
    ),
    Community(
      name: 'Komunitas Charity',
      description:
          'Berpartisipasilah dalam kegiatan amal melalui komunitas charity.',
      category: 'Sosial',
    ),
    Community(
      name: 'Komunitas Pencerah Nusantara',
      description:
          'Komunitas yang bergerak dalam pencerahan masyarakat nusantara.',
      category: 'Sosial',
    ),
    Community(
      name: 'Komunitas Catur',
      description:
          'Bergabunglah dengan komunitas catur untuk mengasah keterampilan Anda.',
      category: 'Pendidikan',
    ),
    Community(
      name: 'Komunitas Essai',
      description:
          'Komunitas yang fokus pada pengembangan kemampuan menulis essai.',
      category: 'Pendidikan',
    ),
    Community(
      name: 'Komunitas Art',
      description: 'Tempat berkumpulnya para seniman untuk berkarya bersama.',
      category: 'Pendidikan',
    ),
    Community(
      name: 'Komunitas Dokter',
      description:
          'Komunitas untuk para dokter berbagi informasi dan pengalaman.',
      category: 'Kesehatan',
    ),
    Community(
      name: 'Komunitas Perawat',
      description:
          'Komunitas bagi para perawat untuk saling mendukung dan berbagi.',
      category: 'Kesehatan',
    ),
    Community(
      name: 'Komunitas Dokter Muda',
      description:
          'Tempat bagi para dokter muda untuk belajar dan berkembang bersama.',
      category: 'Kesehatan',
    ),
    Community(
      name: 'Komunitas Peduli Sampah',
      description:
          'Komunitas yang peduli terhadap masalah sampah di lingkungan.',
      category: 'Lingkungan',
    ),
    Community(
      name: 'Komunitas Peduli Banjir',
      description: 'Komunitas yang bergerak dalam penanganan masalah banjir.',
      category: 'Lingkungan',
    ),
  ];

  List<Community> filteredCommunities = [];
  List<Community> joinedCommunities = [];
  String searchText = '';

  @override
  void initState() {
    filteredCommunities = communities;
    super.initState();
  }

  void filterCommunities(String query) {
    setState(() {
      searchText = query;
      filteredCommunities = communities
          .where((community) =>
              community.name.toLowerCase().contains(query.toLowerCase()) ||
              community.category.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void joinCommunity(Community community) {
    setState(() {
      if (!joinedCommunities.contains(community)) {
        joinedCommunities.add(community);
      }
    });
  }

  void navigateToCategoryPage(String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryPage(
          category: category,
          communities: communities,
          onJoin: joinCommunity,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ThriveHub'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Cari Komunitas',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: filterCommunities,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateCommunityPage()),
                );
              },
              child: const Text('Buat Komunitas'),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Komunitas Sosial'),
                  onTap: () => navigateToCategoryPage('Sosial'),
                ),
                ListTile(
                  title: const Text('Komunitas Pendidikan'),
                  onTap: () => navigateToCategoryPage('Pendidikan'),
                ),
                ListTile(
                  title: const Text('Komunitas Kesehatan'),
                  onTap: () => navigateToCategoryPage('Kesehatan'),
                ),
                ListTile(
                  title: const Text('Komunitas Lingkungan'),
                  onTap: () => navigateToCategoryPage('Lingkungan'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommunityDetailPage extends StatelessWidget {
  final Community community;

  const CommunityDetailPage({Key? key, required this.community})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(community.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              community.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              community.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Kategori: ${community.category}',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final joinedCommunities = context
            .findAncestorStateOfType<_ThriveHubPageState>()
            ?.joinedCommunities ??
        [];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.deepOrange.shade300],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: const [0.5, 0.9],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.red.shade300,
                      minRadius: 35.0,
                      child: const Icon(
                        Icons.call,
                        size: 30.0,
                      ),
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.white70,
                      minRadius: 60.0,
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(
                            'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e12ea328401c4322b9a169a30eae60b9&v=4'),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.red.shade300,
                      minRadius: 35.0,
                      child: const Icon(
                        Icons.message,
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Steven Dermawan',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Jakarta, Indonesia',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    // Add action for editing profile
                  },
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  label: const Text('Edit Profile'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.deepOrange.shade300,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Icon(Icons.person, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      'About Me',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'I am a passionate developer with a love for learning new technologies and improving my skills. In my free time, I enjoy reading, hiking, and exploring new places.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Icon(Icons.interests, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      'Interests',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: const <Widget>[
                    Chip(label: Text('Coding')),
                    Chip(label: Text('Reading')),
                    Chip(label: Text('Hiking')),
                    Chip(label: Text('Traveling')),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Icon(Icons.group, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      'Communities Joined',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: joinedCommunities.length,
                  itemBuilder: (context, index) {
                    final community = joinedCommunities[index];
                    return ListTile(
                      title: Text(community.name),
                      subtitle: Text(community.description),
                    );
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Icon(Icons.contact_mail, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      'Contact Information',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ListTile(
                  leading: const Icon(Icons.email, color: Colors.blue),
                  title: const Text('steven.dermawan@example.com'),
                  onTap: () {
                    // Add email action
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.phone, color: Colors.blue),
                  title: const Text('+62 812-3456-7890'),
                  onTap: () {
                    // Add phone action
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  final String category;
  final List<Community> communities;
  final Function(Community) onJoin;

  const CategoryPage({
    Key? key,
    required this.category,
    required this.communities,
    required this.onJoin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryCommunities = communities
        .where((community) => community.category == category)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Komunitas $category'),
      ),
      body: ListView.builder(
        itemCount: categoryCommunities.length,
        itemBuilder: (context, index) {
          final community = categoryCommunities[index];
          final isJoined = false; // Adjust as needed for joined status
          return Card(
            child: ListTile(
              title: Text(community.name),
              subtitle: Text(community.description),
              trailing: ElevatedButton(
                onPressed: () => onJoin(community),
                child: Text(isJoined ? 'Sudah Bergabung' : 'Bergabung'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CommunityInfoPage extends StatelessWidget {
  final String title;
  final String description;

  const CommunityInfoPage(
      {required this.title, required this.description, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Materials and Short Courses',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text(
                'Upcoming Events',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildEventItem(
                  'Flutter Workshop',
                  'Learn the basics of Flutter in a hands-on workshop.',
                  'June 25, 2024'),
              _buildEventItem('Advanced Dart Programming',
                  'Deep dive into Dart programming language.', 'July 10, 2024'),
              const SizedBox(height: 20),
              Text(
                'Testimonials',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildTestimonial('John Doe',
                  'This community has been a game-changer for my career. The resources are top-notch.'),
              _buildTestimonial('Jane Smith',
                  'I learned so much from the short courses offered here. Highly recommend!'),
              const SizedBox(height: 20),
              Text(
                'Contact Us',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildContactForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventItem(String title, String description, String date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 5),
        Text(
          description,
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 5),
        Text(
          date,
          style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildTestimonial(String name, String feedback) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 5),
        Text(
          feedback,
          style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildContactForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            labelText: 'Message',
            border: OutlineInputBorder(),
          ),
          maxLines: 5,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Handle form submission
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}

class CardExample extends StatelessWidget {
  final String title;
  final String subtitle;
  final String content;
  final String materialDescription;
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;

  const CardExample({
    required this.title,
    required this.subtitle,
    required this.content,
    required this.materialDescription,
    required this.onPressed1,
    required this.onPressed2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 16, color: Colors.blue),
            ),
            const SizedBox(height: 10),
            Text(content),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  onPressed: onPressed1,
                  child: const Text('Join'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CommunityInfoPage(
                          title: title,
                          description: materialDescription,
                        ),
                      ),
                    );
                  },
                  child: const Text('Info'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Community {
  final String name;
  final String description;
  final String category;

  Community({
    required this.name,
    required this.description,
    required this.category,
  });
}

class CreateCommunityPage extends StatefulWidget {
  const CreateCommunityPage({Key? key}) : super(key: key);

  @override
  _CreateCommunityPageState createState() => _CreateCommunityPageState();
}

class _CreateCommunityPageState extends State<CreateCommunityPage> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _description;
  late String _category;

  void _saveCommunity() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newCommunity = Community(
        name: _name,
        description: _description,
        category: _category,
      );

      // Access ThriveHubPage state to add the new community
      final thriveHubPageState =
          context.findAncestorStateOfType<_ThriveHubPageState>();
      thriveHubPageState?.setState(() {
        thriveHubPageState.communities.add(newCommunity);
      });

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Komunitas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nama Komunitas'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan nama komunitas';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Deskripsi'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan deskripsi';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Kategori'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan kategori';
                  }
                  return null;
                },
                onSaved: (value) {
                  _category = value!;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveCommunity,
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatForumPage extends StatefulWidget {
  const ChatForumPage({Key? key}) : super(key: key);

  @override
  _ChatForumPageState createState() => _ChatForumPageState();
}

class _ChatForumPageState extends State<ChatForumPage> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<String> _messages = [];

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(_controller.text);
        _controller.clear();
      });
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Forum'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter your message',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
