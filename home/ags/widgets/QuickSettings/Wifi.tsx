import Network from "gi://AstalNetwork";
import { page } from "./Index";
import { Gtk } from "astal/gtk4";
import { bind, execAsync } from "astal";
import Pango from "gi://Pango";

export default function Wifi() {
  const wifi = Network.get_default().wifi;

  return (
    <box name={"Wifi"} cssClasses={["Wifi"]} vertical spacing={6}>
      <box hexpand={false} cssClasses={["header"]} spacing={6}>
        <button
          onClicked={() => {
            page.set("Main");
          }}
          iconName={"go-previous-symbolic"}
        />
        <label label={"Internet"} hexpand xalign={0} />
      </box>
      <Gtk.Separator />
      <Gtk.ScrolledWindow vexpand>
        <box vertical spacing={4}>
          {bind(wifi, "accessPoints").as((aps) => {
            const seenSsids = new Set();
            return aps
              .filter((ap) => {
                if (seenSsids.has(ap.ssid)) {
                  return false;
                }
                seenSsids.add(ap.ssid);
                return !!ap.ssid;
              })
              .map((accessPoint) => {
                return (
                  <button
                    cssClasses={bind(wifi, "ssid").as((ssid) => {
                      const classes = ["button"];
                      ssid === accessPoint.ssid && classes.push("active");
                      return classes;
                    })}
                    onClicked={() => {
                      execAsync(
                        `nmcli device wifi connect ${accessPoint.bssid}`
                      ).catch((err) => {
                        console.error("Connect Error: ", err);
                        return "";
                      });
                    }}
                  >
                    <box spacing={4}>
                      <image iconName={accessPoint.iconName} />
                      <label
                        label={accessPoint.ssid}
                        maxWidthChars={28}
                        ellipsize={Pango.EllipsizeMode.END}
                      />
                    </box>
                  </button>
                );
              });
          })}
        </box>
      </Gtk.ScrolledWindow>
    </box>
  );
}
