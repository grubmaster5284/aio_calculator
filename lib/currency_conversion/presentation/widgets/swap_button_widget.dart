import 'package:flutter/material.dart';
import 'package:calculator_online/core/constants/k_sizes.dart';

/// Widget for swapping between from and to currencies
class SwapButtonWidget extends StatelessWidget {
  final VoidCallback onSwap;
  final bool isSwapping;

  const SwapButtonWidget({
    super.key,
    required this.onSwap,
    this.isSwapping = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: isSwapping ? null : onSwap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(KSize.margin3x),
          decoration: BoxDecoration(
            color: isSwapping 
                ? KColors.backgroundLight 
                : KColors.buttonOperator,
            borderRadius: BorderRadius.circular(KSize.radiusCircular),
            boxShadow: [
              BoxShadow(
                color: KColors.buttonOperator.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: isSwapping
              ? const SizedBox(
                  width: KSize.iconMedium,
                  height: KSize.iconMedium,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(KColors.textPrimary),
                  ),
                )
              : const Icon(
                  Icons.swap_vert,
                  color: KColors.textPrimary,
                  size: KSize.iconMedium,
                ),
        ),
      ),
    );
  }
}
