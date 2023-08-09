import 'package:flutter/material.dart';

class OptimizeMarkdown extends StatelessWidget {
  const OptimizeMarkdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomScrollView Example'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('CustomScrollView Example'),
              background: Image.network(
                'https://example.com/image.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
