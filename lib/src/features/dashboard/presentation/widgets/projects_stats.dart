import 'dart:math' as math;

import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectsStats extends StatelessWidget {
  const ProjectsStats({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        final stats = state.stats;
        final totalProjects = stats.totalProjectCount;

        return AppCard(
          constraints: BoxConstraints(maxHeight: 335),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Status Distribution',
                style: context.textStyles.titleMedium.copyWith(
                  color: context.colors.textHeading,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 12),
              Divider(),
              SizedBox(height: 12),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 170,
                    height: 170,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: _DonutChart(
                        totalProjects: totalProjects,
                        statusDistribution: stats.statusDistribution,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: _StatusLegend(
                      statusDistribution: stats.statusDistribution,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}

class _DonutChart extends StatelessWidget {
  const _DonutChart({
    required this.totalProjects,
    required this.statusDistribution,
  });

  final int totalProjects;
  final Map<ProjectStatus, dynamic> statusDistribution;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = math.min(constraints.maxWidth, constraints.maxHeight);
        return Center(
          child: SizedBox(
            width: size,
            height: size,
            child: CustomPaint(
              painter: _DonutChartPainter(
                statusDistribution: statusDistribution,
                colors: context.colors,
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$totalProjects',
                      style: context.textStyles.headlineLarge.copyWith(
                        color: context.colors.textHeading,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'PROJECTS',
                      style: context.textStyles.labelSmall.copyWith(
                        color: context.colors.textSubtle,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _DonutChartPainter extends CustomPainter {
  _DonutChartPainter({required this.statusDistribution, required this.colors});

  final Map<ProjectStatus, dynamic> statusDistribution;
  final AppColorsExtension colors;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;
    final strokeWidth = radius * 0.35;
    final arcRadius = radius - strokeWidth / 2;
    final rect = Rect.fromCircle(center: center, radius: arcRadius);

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    double startAngle = -math.pi / 2;

    const gapAngle = 0.06;

    final statusOrder = [
      ProjectStatus.ongoing,
      ProjectStatus.notStarted,
      ProjectStatus.completed,
      ProjectStatus.suspended,
      ProjectStatus.cancelled,
    ];

    final visibleStatuses = statusOrder.where((status) {
      final info = statusDistribution[status];
      return info != null && info.percentage > 0;
    }).toList();

    final segments = <_ArcSegment>[];

    for (final status in statusOrder) {
      final info = statusDistribution[status];
      if (info == null || info.percentage <= 0) continue;

      final sweepAngle = (info.percentage / 100) * 2 * math.pi;

      final adjustedSweep = visibleStatuses.length > 1
          ? sweepAngle - gapAngle
          : sweepAngle;
      final adjustedStart = visibleStatuses.length > 1
          ? startAngle + gapAngle / 2
          : startAngle;

      paint.color = _getColorForStatus(status);

      canvas.drawArc(rect, adjustedStart, adjustedSweep, false, paint);

      segments.add(
        _ArcSegment(
          startAngle: adjustedStart,
          sweepAngle: adjustedSweep,
          count: info.count,
        ),
      );

      startAngle += sweepAngle;
    }

    for (final segment in segments) {
      if (segment.count <= 0) continue;

      final midAngle = segment.startAngle + segment.sweepAngle / 2;
      final labelX = center.dx + arcRadius * math.cos(midAngle);
      final labelY = center.dy + arcRadius * math.sin(midAngle);

      final bgPaint = Paint()
        ..color = colors.neutralInverted
        ..style = PaintingStyle.fill;

      final circleRadius = strokeWidth * 0.44;
      canvas.drawCircle(Offset(labelX, labelY), circleRadius, bgPaint);

      final textPainter = TextPainter(
        text: TextSpan(
          text: '${segment.count}',
          style: TextStyle(
            color: colors.textHeading,
            fontSize: circleRadius * .8,
            fontWeight: FontWeight.w800,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(labelX - textPainter.width / 2, labelY - textPainter.height / 2),
      );
    }
  }

  Color _getColorForStatus(ProjectStatus status) {
    switch (status) {
      case ProjectStatus.ongoing:
        return colors.statusOngoing;
      case ProjectStatus.completed:
        return colors.statusCompleted;
      case ProjectStatus.notStarted:
        return colors.statusPlanned;
      case ProjectStatus.suspended:
        return colors.statusStalled;
      case ProjectStatus.cancelled:
        return colors.statusCancelled;
    }
  }

  @override
  bool shouldRepaint(covariant _DonutChartPainter oldDelegate) {
    return statusDistribution != oldDelegate.statusDistribution;
  }
}

class _ArcSegment {
  final double startAngle;
  final double sweepAngle;
  final int count;

  _ArcSegment({
    required this.startAngle,
    required this.sweepAngle,
    required this.count,
  });
}

class _StatusLegend extends StatelessWidget {
  const _StatusLegend({required this.statusDistribution});

  final Map<ProjectStatus, dynamic> statusDistribution;

  @override
  Widget build(BuildContext context) {
    final legendItems = [
      (ProjectStatus.ongoing, 'Ongoing'),
      (ProjectStatus.completed, 'Completed'),
      (ProjectStatus.notStarted, 'Not Started'),
      (ProjectStatus.suspended, 'Suspended'),
      (ProjectStatus.cancelled, 'Cancelled'),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: legendItems.map((item) {
        final status = item.$1;
        final label = item.$2;
        final info = statusDistribution[status];
        final percentage = info?.percentage ?? 0.0;
        final count = info?.count ?? 0;
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: _getColorForStatus(context, status),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: context.textStyles.bodyMedium.copyWith(
                color: context.colors.textBody,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            Text(
              '$count (${percentage.toInt()}%)',
              style: context.textStyles.bodyMedium.copyWith(
                color: context.colors.textHeading,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Color _getColorForStatus(BuildContext context, ProjectStatus status) {
    final colors = context.colors;
    switch (status) {
      case ProjectStatus.ongoing:
        return colors.statusOngoing;
      case ProjectStatus.completed:
        return colors.statusCompleted;
      case ProjectStatus.notStarted:
        return colors.statusPlanned;
      case ProjectStatus.suspended:
        return colors.statusStalled;
      case ProjectStatus.cancelled:
        return colors.statusCancelled;
    }
  }
}
