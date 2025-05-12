import { App, Gtk } from "astal/gtk4";
import Pango from "gi://Pango";
import Apps from "gi://AstalApps";

export default function AppButton({ app }: { app: Apps.Application }) {
  return (
    <button
      cssClasses={["appButton"]}
      onClicked={() => {
        App.get_window("AppLauncher")?.set_visible(false);
        app.launch();
      }}
    >
      <box spacing={8}>
        <image iconName={`${app.iconName}-symbolic`} iconSize={Gtk.IconSize.LARGE} />
        <box valign={Gtk.Align.CENTER} vertical>
          <label
            cssClasses={["name"]}
            ellipsize={Pango.EllipsizeMode.END}
            xalign={0}
            label={app.name}
          />
          {app.description ? (
            <label
              cssClasses={["description"]}
              wrap
              xalign={0}
              label={app.description}
            />
          ) : (
            <></>
          )}
        </box>
      </box>
    </button>
  );
}