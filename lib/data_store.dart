class DataStore {
  // Productos globales iniciales con tus imágenes reales asignadas
  static final List<Map<String, String>> productos = [
    {
      'usuario': 'irene',
      'nombreProducto': 'Hairdryer',
      'descripcion': 'Used only few times, work well',
      'precio': '30',
      'imagen': 'assets/im1.jpg'
    },
    {
      'usuario': 'alba',
      'nombreProducto': 'Fake plants',
      'descripcion': 'Good for decoration',
      'precio': '5',
      'imagen': 'assets/im2.jpg'
    },
    {
      'usuario': 'maria',
      'nombreProducto': 'Coat',
      'descripcion': 'Brand new',
      'precio': '40',
      'imagen': 'assets/im3.jpg'
    },
  ];

  // Base de datos de usuarios para pruebas
  static final List<Map<String, String>> usuarios = [
    {
      'usuario': 'test',
      'contrasena': '123',
      'nombreCompleto': 'Usuario de Prueba'
    }
  ];

  // Almacena temporalmente los datos del usuario que inició sesión
  static Map<String, String> usuarioLogueado = {
    'usuario': 'test',
    'nombreCompleto': 'Usuario de Prueba',
  };

  // Listas de interacción del perfil
  static final List<Map<String, String>> misFavoritos = [];
  static final List<Map<String, String>> misCompras = [];
}