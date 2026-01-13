import 'package:contrack/src/app/presentation/constants/app_destination_enum.dart';
import 'package:contrack/src/app/presentation/widgets/logout_dialog.dart';
import 'package:contrack/src/app/presentation/widgets/theme_switcher.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:flutter/material.dart';

class AppSidebar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<AppSidebarDestination> destinations;
  const AppSidebar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.destinations,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.card,
        border: Border(right: BorderSide(color: context.colors.divider)),
      ),
      constraints: BoxConstraints(maxWidth: 256, minWidth: 150),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 42),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: context.colors.neutral,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.description_outlined,
                    color: context.colors.neutralInverted,
                    size: 24,
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ERGP',
                      style: context.textStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colors.onCard,
                        height: 1.2,
                      ),
                    ),
                    Text(
                      'v1.0.0',
                      style: context.textStyles.bodyMedium.copyWith(
                        color: context.colors.onCard,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Divider(color: context.colors.divider),
          SizedBox(height: 16),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: destinations
                    .map(
                      (destination) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: _SidebarItem(
                          icon: destination.icon,
                          label: destination.displayName(),
                          isSelected: selectedIndex == destination.index,
                          onTap: () => onDestinationSelected(destination.index),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          Divider(color: context.colors.divider),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            margin: EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
            decoration: BoxDecoration(
              color: context.colors.surface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ThemeSwitcher(),
                TextButton.icon(
                  onPressed: () => LogoutDialog.show(context),
                  label: Text('Log out'),
                  icon: Icon(Icons.logout),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _SidebarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? context.colors.cardHighlight
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 19,
                color: isSelected
                    ? context.colors.onCardPrimary
                    : context.colors.onCardSecondary,
              ),
              SizedBox(width: 12),
              Text(
                label,
                style: context.textStyles.bodyMedium.copyWith(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected
                      ? context.colors.onCardPrimary
                      : context.colors.onCardSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
