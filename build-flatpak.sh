#! /bin/sh

# versione più semplice da testare
# flatpak-builder build-dir com.example.test.builder.gtk4.vala.json
# flatpak-builder --user --install --force-clean build-dir com.example.test.builder.gtk4.vala.json
# flatpak run com.example.test.builder.gtk4.vala

flatpak build-init build-dir com.example.test.builder.gtk4.vala org.gnome.Sdk/x86_64/42 org.gnome.Platform/x86_64/42

flatpak-builder --arch=x86_64 --ccache --force-clean --state-dir flatpak-builder --download-only --disable-updates --stop-at=testbuildergtk4vala build-dir com.example.test.builder.gtk4.vala.json

flatpak-builder --arch=x86_64 --ccache --force-clean --disable-updates --disable-download --state-dir flatpak-builder --stop-at=testbuildergtk4vala build-dir com.example.test.builder.gtk4.vala.json

flatpak build --share=network --nofilesystem=host  --env=NOCONFIGURE=1 build-dir ninja

flatpak build --share=network --nofilesystem=host  --env=NOCONFIGURE=1 build-dir ninja install