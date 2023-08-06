# ベースイメージはeclipse-temurin(旧OpenJDK)のJava17を使用
FROM docker.io/eclipse-temurin:17-jre-alpine
# 作業ディレクトリを/(root)にする
WORKDIR /workspaces/my-sample-app/
# Mavenのビルド成果物(hello-app.jar)をコンテナイメージにCOPY
COPY target/hello-app.jar /app/hello-app.jar
# Mavenのビルド成果物(libs以下を)をコンテナイメージにCOPY
COPY target/libs/ /app/libs/
# ExecutableJarをjavaコマンドで起動
ENTRYPOINT ["java", "-jar", "/app/hello-app.jar"]