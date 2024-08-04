#!/bin/bash

# Очищення проекту Flutter
flutter clean

# Видалення директорії Pods та файлу Podfile.lock
rm -rf macos/Pods
rm -rf macos/Podfile.lock

# Отримання залежностей Flutter
flutter pub get

# Оновлення Flutter
flutter upgrade

# Встановлення Cocoapods з паролем
echo "1111" | sudo -S gem install cocoapods

# Перехід до директорії ios
cd ios

# Оновлення репозиторію Pod
pod repo update

# Встановлення залежностей Pod
pod install

# Оновлення залежностей Pod
pod update

# Повернення до кореневої директорії
cd ..

# Збірка проекту для iOS
flutter build ios

