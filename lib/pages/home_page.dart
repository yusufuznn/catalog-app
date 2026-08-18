import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import 'product_detail_page.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [];
  List<Product> filteredProducts = [];
  final Set<int> cartItems = {};
  final TextEditingController searchController = TextEditingController();
  bool isLoading = true;
  String selectedCategory = 'Tümü';

  final List<String> categories = [
    'Tümü',
    'Elektronik',
    'Giyim',
    'Aksesuar',
  ];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    setState(() => isLoading = true);

    await Future.delayed(const Duration(seconds: 1));

    final demoProducts = [
      Product(
        id: 1,
        title: 'Kablosuz Kulaklık',
        price: 899.99,
        description: 'Yüksek kaliteli ses deneyimi için gürültü engelleme özellikli kablosuz kulaklık. 30 saat pil ömrü ve hızlı şarj desteği.',
        category: 'Elektronik',
        image: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500',
        rating: 4.5,
      ),
      Product(
        id: 2,
        title: 'Akıllı Saat',
        price: 699.99,
        description: 'Fitness takibi, kalp ritmi monitorü ve bildirimler için su geçirmez akıllı saat. 7 gün pil ömrü.',
        category: 'Elektronik',
        image: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500',
        rating: 4.8,
      ),
      Product(
        id: 3,
        title: 'Deri Cüzdan',
        price: 145.00,
        description: 'Gerahi deriden üretilmiş, çok bölmeli ve RFID korumalı modern cüzdan.',
        category: 'Aksesuar',
        image: 'https://images.unsplash.com/photo-1627123424574-724758594e93?w=500',
        rating: 4.2,
      ),
      Product(
        id: 4,
        title: 'Spor Ayakkabı',
        price: 1299.99,
        description: 'Koşu ve spor aktiviteleri için hafif, nefes alan ve destekli ayakkabı. Ergonomik taban tasarımı.',
        category: 'Giyim',
        image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500',
        rating: 4.6,
      ),
      Product(
        id: 5,
        title: 'Sırt Çantası',
        price: 759.90,
        description: 'Laptop bölmesi, su geçirmez kumaş ve ayarlanabilir sırt askılı günlük kullanım çantası. 15.6" laptop uyumlu.',
        category: 'Aksesuar',
        image: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=500',
        rating: 4.4,
      ),
      Product(
        id: 6,
        title: 'Güneş Gözlüğü',
        price: 2560.00,
        description: 'UV400 korumalı, polarize lensli ve hafif metal çerçeveli güneş gözlüğü. Şık ve koruyucu.',
        category: 'Aksesuar',
        image: 'https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=500',
        rating: 4.3,
      ),
      Product(
        id: 7,
        title: 'Bluetooth Hoparlör',
        price: 699.99,
        description: '360 derece ses, su geçirmez tasarım ve 12 saat pil ömrü. Parti ve açık hava için ideal.',
        category: 'Elektronik',
        image: 'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=500',
        rating: 4.7,
      ),
      Product(
        id: 8,
        title: 'Kot Ceket',
        price: 890.00,
        description: 'Klasik kesim, yüksek kaliteli denim kumaştan üretilmiş zamansız kot ceket. Her mevsim için uygun.',
        category: 'Giyim',
        image: 'https://images.unsplash.com/photo-1576995853123-5a10305d93c0?w=500',
        rating: 4.5,
      ),
      Product(
        id: 9,
        title: 'Mekanik Klavye',
        price: 149.99,
        description: 'RGB aydınlatmalı, Cherry MX switchli ve programlanabilir tuşlara sahip oyuncu klavyesi.',
        category: 'Elektronik',
        image: 'https://images.unsplash.com/photo-1511467687858-23d96c32e4ae?w=500',
        rating: 4.9,
      ),
      Product(
        id: 10,
        title: 'Termos Kupa',
        price: 245.99,
        description: '12 saat sıcak tutma garantili, paslanmaz çelik termos kupa. 350ml kapasite.',
        category: 'Aksesuar',
        image: 'https://images.unsplash.com/photo-1514228742587-6b1558fcca3d?w=500',
        rating: 4.1,
      ),
    ];

    setState(() {
      products = demoProducts;
      filteredProducts = demoProducts;
      isLoading = false;
    });
  }

  void filterProducts(String query) {
    setState(() {
      selectedCategory = 'Tümü';
      if (query.isEmpty) {
        filteredProducts = products;
      } else {
        filteredProducts = products
            .where((p) =>
                p.title.toLowerCase().contains(query.toLowerCase()) ||
                p.description.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void filterByCategory(String category) {
    setState(() {
      selectedCategory = category;
      searchController.clear();
      if (category == 'Tümü') {
        filteredProducts = products;
      } else {
        filteredProducts =
            products.where((p) => p.category == category).toList();
      }
    });
  }

  void toggleCart(int productId) {
    setState(() {
      if (cartItems.contains(productId)) {
        cartItems.remove(productId);
      } else {
        cartItems.add(productId);
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Katalog'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(
                        cartItems: cartItems,
                        products: products,
                        onRemove: (id) => setState(() => cartItems.remove(id)),
                        onClear: () => setState(() => cartItems.clear()),
                      ),
                    ),
                  );
                  if (result == true && mounted) {
                    setState(() {});
                  }
                },
              ),
              if (cartItems.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      '${cartItems.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildCategoryChips(),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : filteredProducts.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search_off, size: 64, color: Colors.grey),
                            SizedBox(height: 16),
                            Text(
                              'Ürün bulunamadı',
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    : _buildProductGrid(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Ürün ara...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                    filterProducts('');
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: filterProducts,
      ),
    );
  }

  Widget _buildCategoryChips() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selectedCategory == category;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (_) => filterByCategory(category),
              backgroundColor: Colors.white,
              selectedColor: Theme.of(context).colorScheme.primary,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.65,
      ),
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        final product = filteredProducts[index];
        final inCart = cartItems.contains(product.id);
        return Stack(
          children: [
            ProductCard(
              product: product,
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(product: product),
                  ),
                );
                if (result == true && mounted) {
                  toggleCart(product.id);
                }
              },
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => toggleCart(product.id),
                  customBorder: const CircleBorder(),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Icon(
                      inCart ? Icons.check : Icons.add_shopping_cart,
                      color: inCart
                          ? Colors.green
                          : Theme.of(context).colorScheme.primary,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
