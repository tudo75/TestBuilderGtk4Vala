#! /bin/sh

# versione più semplice da testare
flatpak-builder --force-clean build-dir com.example.test.builder.gtk4.vala.json

flatpak-builder --user --install --force-clean build-dir com.example.test.builder.gtk4.vala.json

flatpak run com.example.test.builder.gtk4.vala
