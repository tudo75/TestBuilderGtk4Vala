testbuildergtk4vala_sources = [
  'main.vala',
  'window.vala',
  'application.vala',
]

testbuildergtk4vala_deps = [
  dependency('gtk4'),
  dependency('libadwaita-1'),
]

gnome = import('gnome')

testbuildergtk4vala_sources += gnome.compile_resources(
  'testbuildergtk4vala-resources',
  'testbuildergtk4vala.gresource.xml',
  c_name: 'testbuildergtk4vala'
)

executable(
  'testbuildergtk4vala', 
  testbuildergtk4vala_sources,
  vala_args: '--target-glib=2.50',
  win_subsystem: 'windows',
  dependencies: testbuildergtk4vala_deps,
  install: true,
)
