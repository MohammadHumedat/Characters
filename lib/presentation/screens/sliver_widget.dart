import 'package:flutter/material.dart';

class SecoundPage extends StatelessWidget {
  const SecoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
         SliverAppBar(
            floating: true,
            actionsPadding: const EdgeInsets.all(20),
            centerTitle: true,
            title: const Text(
              'H E L L O',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            stretch: true,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
            flexibleSpace: const FlexibleSpaceBar(
              background: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1743376272672-c130603a3af2?q=80&w=1529&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                ),
              ),
              title: Text('Sliver M o u n t'),
            ),
            expandedHeight: 250,
            backgroundColor: Colors.deepPurple,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.amberAccent,
                height: 100,
                margin:const EdgeInsets.all(10),
              ),
              Container(
                color: Colors.deepPurple,
                height: 100,
                margin: const EdgeInsets.all(10),
              ),
              Container(
                color: Colors.purple,
                height: 100,
                margin: const EdgeInsets.all(10),
              ),
              Container(
                color: Colors.amberAccent,
                height: 100,
                margin: const EdgeInsets.all(10),
              ),
              Container(
                color: Colors.deepPurple,
                height: 100,
                margin: const EdgeInsets.all(10),
              ),
              Container(
                color: Colors.purple,
                height: 100,
                margin: const EdgeInsets.all(10),
              ),
            ]),
          ),

          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.5,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                color: Colors.blueAccent,
                alignment: Alignment.center,
                child: Text(
                  'Item $index',
                  style:const TextStyle(color: Colors.white, fontSize: 20),
                ),
              );
            }, childCount: 20),
          ),
        ],
      ),
    );
  }
}
