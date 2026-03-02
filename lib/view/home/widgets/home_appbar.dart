import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    this.onMenu, // Mantenemos este callback para el menú
    this.onNotifications, // Mantenemos este callback para las notificaciones
    // 'onProfile' ha sido eliminado de los parámetros porque el ícono de perfil se movió a la BottomNavigationBar.
  });

  final VoidCallback? onMenu;
  final VoidCallback? onNotifications;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0, // Eliminamos la sombra para un diseño más plano
      backgroundColor: Colors.white, // Fondo blanco para la AppBar
      foregroundColor: Colors.black, // Color predeterminado para el texto y los íconos
      iconTheme: const IconThemeData(color: Colors.black87), // Íconos con un color oscuro
      
      leading: IconButton( // Mantenemos el ícono de menú hamburguesa
        icon: const Icon(Icons.menu),
        onPressed: onMenu, // Llama al callback proporcionado
      ),
      
      title: const Text( // Cambiamos el título para que sea solo el nombre, más grande y en negrita
        "Ferremateriales DGC", // Puedes cambiar "FerreMax" por el nombre corto de tu app
        style: TextStyle(
          color: Colors.black87, // Color oscuro para el título
          fontSize: 22, // Tamaño de fuente más grande para que destaque
          fontWeight: FontWeight.bold, // Negrita para mayor prominencia
        ),
      ),
      // El subtítulo "Todo para tu construcción" ha sido eliminado para simplificar la AppBar,
      // alineándose con el diseño de referencia.
      
      actions: [
        // El ícono de perfil ('onProfile') se ha movido a la BottomNavigationBar,
        // por lo que no lo incluimos aquí en la AppBar.
        
        IconButton(
          icon: const Icon(Icons.notifications_none), // Ícono de notificaciones
          onPressed: onNotifications, // Llama al callback proporcionado
        ),
        
        Stack( // Usamos un Stack para el ícono del carrito y su badge
          children: [
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined), // Ícono del carrito
              onPressed: () {
                // Acción para el carrito de compras
              },
            ),
            Positioned( // Posicionamos el badge del carrito
              right: 6, // Ajuste de posición a la derecha
              top: 6, // Ajuste de posición arriba
              child: Container(
                padding: const EdgeInsets.all(4), // Espaciado interno del badge
                decoration: const BoxDecoration(
                  color: Colors.red, // Color rojo para el badge
                  shape: BoxShape.circle, // Forma circular para el badge
                ),
                child: const Text(
                  "2", // Número de elementos en el carrito (puedes hacerlo dinámico)
                  style: TextStyle(
                    color: Colors.white, // Texto blanco para el número
                    fontSize: 10, // Tamaño de fuente pequeño para el número
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 8), // Pequeño espacio al final para el margen derecho
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Altura estándar de la AppBar
}