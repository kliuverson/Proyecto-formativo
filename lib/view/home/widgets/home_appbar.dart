
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenu;
  final VoidCallback? onAdmin;

  const HomeAppBar({
    super.key,
    this.onMenu,
    this.onAdmin,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFF6A14),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 18),
            child: Column(
              children: [

                Row(
                  children: [

                    InkWell(
                      onTap: onMenu,
                      child: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(width: 12),

                    const Icon(
                      Icons.bolt,
                      color: Colors.white,
                    ),

                    const SizedBox(width: 8),

                    const Expanded(
                      child: Text(
                        "Ferremateriales DGC",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: onAdmin,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          children: [

                            Icon(
                              Icons.admin_panel_settings,
                              color: Colors.white,
                              size: 16,
                            ),

                            SizedBox(width: 4),

                            Text(
                              "Admin",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            )

                          ],
                        ),
                      ),
                    )

                  ],
                ),

                const SizedBox(height: 18),

                Container(
                  height: 46,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Buscar herramientas...",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.only(top: 12),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
