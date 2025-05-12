import AstalWp from "gi://AstalWp?version=0.1";
import { page } from "./Index";
import { Gtk } from "astal/gtk4";
import { bind } from "astal";
import Pango from "gi://Pango";

export default function Speaker() {
  const audio = AstalWp.get_default()!.audio;
  return (
    <box name={"Speaker"} cssClasses={["Speaker"]} vertical spacing={6}>
      <box hexpand={false} cssClasses={["header"]} spacing={6}>
        <button
          onClicked={() => {
            page.set("Main");
          }}
          iconName={"go-previous-symbolic"}
        />
        <label label={"Speaker"} hexpand xalign={0} />
      </box>
      <Gtk.Separator />
      <Gtk.ScrolledWindow vexpand>
        <box vertical spacing={4}>
          {bind(audio, "speakers").as((d) =>
            d.map((speaker) => (
              <button
                cssClasses={bind(speaker, "isDefault").as((isD) => {
                  const classes = ["button"];
                  isD && classes.push("active");
                  return classes;
                })}
                onClicked={() => speaker.set_is_default(true)}
              >
                <box spacing={4}>
                  <image iconName={speaker.volumeIcon} />
                  <label
                    label={speaker.description}
                    maxWidthChars={28}
                    ellipsize={Pango.EllipsizeMode.END}
                  />
                </box>
              </button>
            ))
          )}
        </box>
      </Gtk.ScrolledWindow>
    </box>
  );
}
