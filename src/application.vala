/* application.vala
 *
 * Copyright 2022 tudo75
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

namespace Testbuildergtk4vala {
    public class Application : Adw.Application {
        public Application () {
            Object (application_id: "com.example.test.builder.gtk4.vala", flags: ApplicationFlags.FLAGS_NONE);
        }

        construct {
            ActionEntry[] action_entries = {
                { "about", this.on_about_action },
                { "preferences", this.on_preferences_action },
                { "quit", this.quit }
            };
            this.add_action_entries (action_entries, this);
            this.set_accels_for_action ("app.quit", {"<primary>q"});
        }

        public override void activate () {
            base.activate ();
            Adw.StyleManager.get_default ().color_scheme = PREFER_DARK;
            Adw.ApplicationWindow win = (Adw.ApplicationWindow) this.active_window;
            if (win == null) {
                win = new Testbuildergtk4vala.Window (this);
            }
            win.present ();
        }

        private void on_about_action () {
            // Configure the dialog:
            Gtk.AboutDialog dialog = new Gtk.AboutDialog ();
            dialog.set_destroy_with_parent (true);
            dialog.set_transient_for (this.active_window);
            dialog.set_modal (true);

            dialog.set_logo_icon_name ("TestBuilderGtk4Vala");
            Gtk.IconTheme icon_theme = Gtk.IconTheme.get_for_display (dialog.get_display ());
            Gtk.IconPaintable logo = icon_theme.lookup_icon ("applications-system-symbolic", null, 48, 1, Gtk.TextDirection.LTR, Gtk.IconLookupFlags.FORCE_SYMBOLIC);
            dialog.set_logo (logo);

            dialog.authors = {"tudo75"};
            dialog.artists = {"tudo75"};
            dialog.documenters = {"tudo75"};
            dialog.translator_credits = ("tudo75");

            dialog.program_name = "TestBuilderGtk4Vala";
            dialog.comments = _("TestBuilderGtk4Vala");
            dialog.copyright = _("Copyright 2022-2023 tudo75");
            dialog.version = "0.1.2";

            dialog.set_license_type (Gtk.License.GPL_3_0_ONLY);

            dialog.website = "http://github.com/tudo75/TestBuilderGtk4Vala";
            dialog.website_label = "Repository Github";

            // Show the dialog:
            dialog.present ();
        }

        private void on_preferences_action () {
            message ("app.preferences action activated");
        }
    }
}
