import 'package:flutter_riverpod/flutter_riverpod.dart';

/// UI-only state for currency conversion feature
/// This handles ephemeral UI state that doesn't belong in the main business logic

/// Provider for tracking if the amount input field is focused
final isAmountInputFocusedProvider = StateProvider<bool>((ref) => false);

/// Provider for tracking if the currency picker is open
final isCurrencyPickerOpenProvider = StateProvider<bool>((ref) => false);

/// Provider for tracking the selected tab in a multi-tab view
final selectedTabProvider = StateProvider<int>((ref) => 0);

/// Provider for tracking if the keyboard is visible
final isKeyboardVisibleProvider = StateProvider<bool>((ref) => false);

/// Provider for tracking animation states
final animationStateProvider = StateProvider<AnimationState>((ref) => AnimationState.idle);

/// Animation states for UI transitions
enum AnimationState {
  idle,
  swapping,
  converting,
  refreshing,
}

/// Provider for managing UI animations
final uiAnimationNotifierProvider = StateNotifierProvider<UIAnimationNotifier, AnimationState>((ref) {
  return UIAnimationNotifier();
});

/// Notifier for managing UI animations
class UIAnimationNotifier extends StateNotifier<AnimationState> {
  UIAnimationNotifier() : super(AnimationState.idle);

  void startSwapping() {
    state = AnimationState.swapping;
  }

  void startConverting() {
    state = AnimationState.converting;
  }

  void startRefreshing() {
    state = AnimationState.refreshing;
  }

  void reset() {
    state = AnimationState.idle;
  }
}
