import 'dart:io';

import 'package:path/path.dart' as p;

Future<void> main() async {
  final source = Directory(p.join('assets', 'icons'));

  await Future.wait([
    IconConfig(
      target: Directory(p.join(source.path, 'development')),
      launcherIconsSuffix: 'development',
      badge: BadgeConfig(
        dark: true,
        alpha: true,
      ),
    ),
    IconConfig(
      target: Directory(p.join(source.path, 'staging')),
      launcherIconsSuffix: 'staging',
      badge: BadgeConfig(
        dark: true,
        alpha: false,
      ),
    ),
    IconConfig(launcherIconsSuffix: 'production'),
  ].map((config) => _processIconConfig(source, config)));
}

Future<void> _processIconConfig(Directory source, IconConfig config) async {
  final target = config.target;

  if (target != null) {
    if (await target.exists()) {
      await target.delete(recursive: true);
    }
    await target.create(recursive: true);
    await for (final entity in source.list()) {
      if (entity is File) {
        await entity.copy(p.join(target.path, p.basename(entity.path)));
      }
    }
  }

  if (config.badge != null) {
    await _badge(
      config: config.badge!,
      target: config.target ?? source,
    );
  }

  await Process.run(
    'flutter',
    [
      'pub',
      'run',
      'flutter_launcher_icons:main',
      '-f',
      'flutter_launcher_icons-${config.launcherIconsSuffix}.yaml',
    ],
  );
}

Future<void> _badge({
  required BadgeConfig config,
  required Directory target,
}) async {
  await Process.run(
    'badge',
    [
      if (config.dark) '--dark',
      '--glob',
      '/${p.relative(target.path, from: p.current)}/*.png',
      if (config.alpha) '--alpha',
    ],
  );
}

class IconConfig {
  IconConfig({
    required this.launcherIconsSuffix,
    this.target,
    this.badge,
  });
  final String launcherIconsSuffix;
  final Directory? target;
  final BadgeConfig? badge;
}

class BadgeConfig {
  BadgeConfig({
    required this.dark,
    required this.alpha,
  });
  final bool dark;
  final bool alpha;
}
