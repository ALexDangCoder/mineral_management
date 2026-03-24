import 'package:bnv_opendata/domain/models/xela_button_models.dart';
import 'package:bnv_opendata/resources/generated/l10n/App_localizations.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_button.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_color.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_divider.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_text_style.dart';
import 'package:bnv_opendata/widgets/xela_widgets/xela_textfield.dart';
import 'package:flutter/material.dart';

class XkSearchField extends StatelessWidget {
  const XkSearchField({
    super.key,
    required this.placeholder,
    required this.onChanged,
  });

  final String placeholder;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return XelaTextField(
      placeholder: placeholder,
      leftIcon: const Icon(Icons.search, size: 20, color: XelaColor.Gray6),
      onChange: onChanged,
    );
  }
}

class XkCard extends StatelessWidget {
  const XkCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(20),
    this.color = Colors.white,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final content = Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(color: XelaColor.Gray11.withOpacity(0.3)),
      ),
      child: child,
    );

    if (onTap == null) {
      return content;
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: content,
    );
  }
}

class XkHeroCard extends StatelessWidget {
  const XkHeroCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            XelaColor.Blue5,
            XelaColor.Blue3,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: XelaColor.Blue5.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: DefaultTextStyle.merge(
        style: const TextStyle(color: Colors.white),
        child: child,
      ),
    );
  }
}

class XkSectionHeader extends StatelessWidget {
  const XkSectionHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: XelaTextStyle.xelaSubheadline.apply(color: XelaColor.Gray2),
    );
  }
}

class XkLabelValueRow extends StatelessWidget {
  const XkLabelValueRow({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: XelaTextStyle.xelaCaption.apply(color: XelaColor.Gray6),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 3,
            child: Text(
              value.isEmpty ? '—' : value,
              textAlign: TextAlign.right,
              style:
                  XelaTextStyle.xelaSmallBodyBold.apply(color: XelaColor.Gray2),
            ),
          ),
        ],
      ),
    );
  }
}

class XkStatusChip extends StatelessWidget {
  const XkStatusChip({
    super.key,
    required this.text,
    this.color = XelaColor.Blue6,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: XelaTextStyle.xelaCaption.apply(
          color: color,
          fontWeightDelta: 2,
        ),
      ),
    );
  }
}

class XkActionButton extends StatelessWidget {
  const XkActionButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return XelaButton(
      text: text,
      size: XelaButtonSize.SMALL,
      type: XelaButtonType.SECONDARY,
      background: Colors.white,
      foregroundColor: XelaColor.Blue6,
      defaultBorderColor: XelaColor.Blue10,
      onPressed: onTap,
    );
  }
}

class XkPrimaryButton extends StatelessWidget {
  const XkPrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return XelaButton(
      text: text,
      onPressed: onTap,
      background: XelaColor.Blue5,
      autoResize: false,
    );
  }
}

class XkSkeletonList extends StatelessWidget {
  const XkSkeletonList({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, __) {
        return const XkCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SkeletonLine(width: 180),
              SizedBox(height: 10),
              _SkeletonLine(width: 120, height: 10),
              SizedBox(height: 8),
              _SkeletonLine(width: 220, height: 10),
            ],
          ),
        );
      },
    );
  }
}

class XkEmptyState extends StatelessWidget {
  const XkEmptyState({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: XkCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.inbox_outlined, color: XelaColor.Gray7, size: 34),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: XelaTextStyle.xelaBody.apply(color: XelaColor.Gray6),
            ),
            const SizedBox(height: 12),
            XkPrimaryButton(text: AppS.of(context).retry, onTap: onRetry),
          ],
        ),
      ),
    );
  }
}

class XkErrorState extends StatelessWidget {
  const XkErrorState({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: XkCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, color: XelaColor.Red4, size: 34),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: XelaTextStyle.xelaBody.apply(color: XelaColor.Gray2),
            ),
            const SizedBox(height: 12),
            XkPrimaryButton(text: AppS.of(context).retry, onTap: onRetry),
          ],
        ),
      ),
    );
  }
}

class XkSectionDivider extends StatelessWidget {
  const XkSectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const XelaDivider();
  }
}

class _SkeletonLine extends StatelessWidget {
  const _SkeletonLine({required this.width, this.height = 12});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: XelaColor.Gray11,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
