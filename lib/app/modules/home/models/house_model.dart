class House {
  final String name;
  final int price;
  final String address;
  final double rating;
  final List<String> images;
  final String type;
  House({
    required this.name,
    required this.price,
    required this.address,
    required this.rating,
    required this.images,
    required this.type,
  });
}

final houseList = [
  House(
    name: "House 1",
    price: 1000,
    address: "no:4 xyz street, the city, the state, the  country",
    rating: 4.9,
    type: "Rent",
    images: [
      "https://images.unsplash.com/photo-1480074568708-e7b720bb3f09?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
      "https://images.unsplash.com/photo-1599619351208-3e6c839d6828?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGhvbWUlMjBpbnRlcmlvcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
      "https://media.istockphoto.com/photos/home-improvement-remodeled-contemporary-kitchen-design-picture-id1275833236?b=1&k=20&m=1275833236&s=170667a&w=0&h=uYC_0-S4Ey9hVQVHq0cfoSBJdJXFpFjMzLAFvJWh1aw="
    ],
  ),
  House(
    name: "House 2",
    price: 3000,
    address: "no:4 xyz street, the city, the state, the  country",
    rating: 4.9,
    type: "Rent",
    images: [
      "https://images.unsplash.com/photo-1570129477492-45c003edd2be?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
      "https://images.unsplash.com/photo-1609347744425-175ecbd3cc0e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8aG9tZSUyMGludGVyaW9yfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
      "https://images.unsplash.com/photo-1598546720078-8659863bc47d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8a2l0Y2hlbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
    ],
  ),
  House(
    name: "House 3",
    price: 20000,
    address: "no:4 xyz street, the city, the state, the  country",
    rating: 4.9,
    type: "Sale",
    images: [
      "https://images.unsplash.com/photo-1572120360610-d971b9d7767c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGhvdXNlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
      "https://images.unsplash.com/photo-1493809842364-78817add7ffb?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGhvbWUlMjBpbnRlcmlvcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
      "https://images.unsplash.com/photo-1543503103-f94a0036ed9d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fGtpdGNoZW58ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
    ],
  ),
  House(
    name: "House 4",
    price: 2000,
    address: "no:4 xyz street, the city, the state, the  country",
    rating: 4.9,
    type: "Rent",
    images: [
      "https://images.unsplash.com/photo-1599427303058-f04cbcf4756f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fGhvdXNlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
      "https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGhvbWUlMjBpbnRlcmlvcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
      "https://images.unsplash.com/photo-1556909172-54557c7e4fb7?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzl8fGtpdGNoZW58ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
    ],
  ),
];
