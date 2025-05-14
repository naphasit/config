import { App, Gtk, hook, Gdk } from "astal/gtk4";
import { Variable } from "astal";
import Apps from "gi://AstalApps";
import Popup from "../Utils/Popup";
import Search from "./Search";
import AppButton from "./AppButton";

const apps = new Apps.Apps();
const text = Variable("");

export default function Applauncher(_gdkmonitor: Gdk.Monitor) {
  const list = text((text) => apps.fuzzy_query(text));

  return (
    <Popup name={"AppLauncher"}>
      <box
        cssName="gui"
        vertical
        vexpand={false}
        heightRequest={600}
        widthRequest={450}
        spacing={8}
      >
        <Search apps={apps} text={text} />
        <Gtk.ScrolledWindow vexpand>
          <box spacing={6} vertical>
            {list.as((list) => list.map((app) => <AppButton app={app} />))}
            <box
              halign={Gtk.Align.CENTER}
              valign={Gtk.Align.CENTER}
              cssClasses={["notFound"]}
              vertical
              vexpand
              visible={list.as((l) => l.length === 0)}
            >
              <image
                iconName="system-search-symbolic"
                iconSize={Gtk.IconSize.LARGE}
              />
              <label label="No match found" />
            </box>
          </box>
        </Gtk.ScrolledWindow>
      </box>
    </Popup>
  );
}
