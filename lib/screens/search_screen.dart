import 'package:flutter/material.dart';
import '../theme/brand_theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> _trendingSearches = [
    "Amala",
    "Jollof Rice",
    "Suya",
    "Pounded Yam",
    "Burger",
    "Sharwama"
  ];

  void _handleCancel() {
    if (Navigator.canPop(context)) {
      // If pushed as a new route (from Home Search Bar), go back
      Navigator.pop(context);
    } else {
      // If accessed via Bottom Navigation Tab, we need to tell the parent 
      // MainNavigation to switch back to index 0. 
      // This is a common pattern using a default Tab Controller or a callback.
      // For now, we will clear the search or you can implement a provider/callback logic.
      _searchController.clear();
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Input Section
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: "Search for food or restaurants...",
                        prefixIcon: const Icon(Icons.search, color: FairDropColors.primaryOrange),
                        filled: true,
                        fillColor: FairDropColors.creamBackground.withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: _handleCancel,
                    child: const Text(
                      "Cancel", 
                      style: TextStyle(color: FairDropColors.primaryOrange)
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),

              // Trending Section
              const Text(
                "Trending Searches",
                style: TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.bold, 
                  color: FairDropColors.deepCharcoal
                ),
              ),
              const SizedBox(height: 15),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: _trendingSearches.map((term) => _buildSearchChip(term)).toList(),
              ),
              const SizedBox(height: 40),

              // Recent Searches Placeholder
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recent Searches",
                    style: TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.bold, 
                      color: FairDropColors.deepCharcoal
                    ),
                  ),
                  TextButton(onPressed: () {}, child: const Text("Clear")),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    _buildRecentItem("Mama Put's Kitchen"),
                    _buildRecentItem("Gateway Grills"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchChip(String label) {
    return GestureDetector(
      onTap: () {
        _searchController.text = label;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Text(
          label,
          style: const TextStyle(color: FairDropColors.deepCharcoal, fontSize: 14),
        ),
      ),
    );
  }

  Widget _buildRecentItem(String text) {
    return ListTile(
      leading: const Icon(Icons.history, color: Colors.grey),
      title: Text(text),
      trailing: const Icon(Icons.north_west, size: 18, color: Colors.grey),
      onTap: () {
        _searchController.text = text;
      },
    );
  }
}