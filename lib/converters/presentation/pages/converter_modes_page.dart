import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/constants/k_sizes.dart';
import '../../../core/widgets/top_nav_bar.dart';

class ConverterModesPage extends StatelessWidget {
  const ConverterModesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Set system UI overlay style for dark theme (consistent with other pages)
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: KColors.backgroundDark,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    final tiles = _tiles;
    return Scaffold(
      backgroundColor: KColors.backgroundDark,
      body: SafeArea(
        child: Column(
          children: [
            const TopNavBar(
              isCalculatorScreen: false,
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isLandscape = constraints.maxWidth > constraints.maxHeight;
                  
                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: KSize.margin6x,
                      vertical: KSize.margin6x,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isLandscape ? 4 : 3,
                      mainAxisSpacing: isLandscape ? 24 : 32,
                      crossAxisSpacing: isLandscape ? 16 : 24,
                      childAspectRatio: isLandscape ? 1.0 : 0.85,
                    ),
                    itemCount: tiles.length,
                    itemBuilder: (context, index) {
                      final t = tiles[index];
                      return _ConverterTile(
                        icon: t.icon, 
                        label: t.label,
                        route: t.route,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<_Tile> get _tiles => const [
        _Tile(Icons.attach_money_outlined, 'Currency', '/converter/currency'),
        _Tile(Icons.cake_outlined, 'Age'),
        _Tile(Icons.crop_3_2_outlined, 'Area'),
        _Tile(Icons.monitor_weight_outlined, 'BMI'),
        _Tile(Icons.sd_card_outlined, 'Data'),
        _Tile(Icons.event_outlined, 'Date'),
        _Tile(Icons.local_offer_outlined, 'Discount'),
        _Tile(Icons.straighten_outlined, 'Length'),
        _Tile(Icons.fitness_center_outlined, 'Mass'),
        _Tile(Icons.pin_outlined, 'Numeral system'),
        _Tile(Icons.speed_outlined, 'Speed'),
        _Tile(Icons.thermostat_outlined, 'Temperature'),
        _Tile(Icons.access_time, 'Time'),
      ];
}

class _ConverterTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? route;

  const _ConverterTile({
    required this.icon, 
    required this.label,
    this.route,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(KSize.radiusDefault),
      onTap: route != null ? () {
        Navigator.pushNamed(context, route!);
      } : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 28, color: KColors.textSecondary),
          const SizedBox(height: KSize.margin2x),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: KColors.textSecondary,
              fontSize: KSize.fontDefault,
            ),
          ),
        ],
      ),
    );
  }
}

class _Tile {
  final IconData icon;
  final String label;
  final String? route;
  const _Tile(this.icon, this.label, [this.route]);
}


