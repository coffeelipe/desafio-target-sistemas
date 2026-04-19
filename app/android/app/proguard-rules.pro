# Regras ProGuard/R8 para build release.
# Mantém classes do Flutter/embedding e plugins para evitar remoção agressiva.

# Flutter
-keep class io.flutter.app.** { *; }
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.plugins.** { *; }
-dontwarn io.flutter.embedding.**

# Kotlin metadata (evita warnings em alguns cenários)
-keep class kotlin.Metadata { *; }

# Se você usar reflexão/serialização customizada, adicione regras específicas aqui.
