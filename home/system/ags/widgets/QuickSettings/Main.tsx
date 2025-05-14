import { bind, Binding, GObject, Variable } from "astal";
import { Gtk } from "astal/gtk4";
import Pango from "gi://Pango";
import Wp from "gi://AstalWp";
import Network from "gi://AstalNetwork";
import Notifd from "gi://AstalNotifd";
import PowerProfiles from "gi://AstalPowerProfiles"
import Brightness from "../../utils/brightness";
import { page } from "./Index";


function Button<T extends GObject.Object>({
  onTitleClick,
  label,
  iconName,
  pageToGo,
  OnArrowClick,
  connection: [gobject, property],
}: {
  onTitleClick: () => void;
  label: string | Binding<string>;
  iconName: string | Binding<string>;
  pageToGo?: string;
  OnArrowClick?: () => void;
  connection: [T, keyof T];
}) {
  return (
    <box
      cssClasses={bind(gobject, property).as((p) => {
        const classes = ["button"];
        p && classes.push("active");
        return classes;
      })}
    >
      <button hexpand onClicked={onTitleClick}>
        <box>
          <image iconName={iconName} />
          <label
            label={label}
            maxWidthChars={pageToGo && OnArrowClick ? 8 : 12}
            ellipsize={Pango.EllipsizeMode.END}
            halign={Gtk.Align.CENTER}
          />
        </box>
      </button>
      {pageToGo && OnArrowClick ? (
        <button
          onClicked={() => {
            OnArrowClick();
            page.set(pageToGo);
          }}
        >
          <image iconName={"go-next-symbolic"} />
        </button>
      ) : (
        <></>
      )}
    </box>
  );
}

function Slider({
  onChangeValue,
  value,
  iconName,
  pageToGo,
  OnArrowClick,
}: {
  onChangeValue: (self: any) => void;
  value: number | Binding<number>;
  iconName: string | Binding<string>;
  pageToGo?: string;
  OnArrowClick?: () => void;
}) {
  return (
    <box valign={Gtk.Align.CENTER} spacing={4} cssClasses={["slider"]}>
      <image iconName={iconName} valign={Gtk.Align.CENTER} />
      <slider onChangeValue={onChangeValue} value={value} hexpand />
      {pageToGo ? (
        <button
          iconName={"go-next-symbolic"}
          onClicked={() => {
            page.set(pageToGo);
            if (OnArrowClick) {
              OnArrowClick();
            }
          }}
        />
      ) : (
        <></>
      )}
    </box>
  );
}

export default function Main() {
  const wifi = Network.get_default().wifi;
  const wifiSsid = Variable.derive(
    [bind(wifi, "state"), bind(wifi, "ssid")],
    (state, ssid) => {
      return state == Network.DeviceState.ACTIVATED ? ssid : "Internet";
    }
  );
  const speaker = Wp.get_default()?.audio!.defaultSpeaker!;
  const brightness = Brightness.get_default();
  const notifd = Notifd.get_default();
  const powerprofiles = PowerProfiles.get_default()

  return (
    <box name={"Main"} cssClasses={["Main"]} vertical spacing={4}>
      <box spacing={4}>
        <Button
          onTitleClick={() => wifi.set_enabled(!wifi.get_enabled())}
          label={wifiSsid()}
          iconName={bind(wifi, "iconName")}
          pageToGo={"Wifi"}
          OnArrowClick={() => wifi.scan()}
          connection={[wifi, "enabled"]}
        />
        <Button
          onTitleClick={() =>
            notifd.set_dont_disturb(!notifd.get_dont_disturb())
          }
          label={"Do Not Disturb"}
          iconName={bind(notifd, "dontDisturb").as((dnd) =>
            dnd ? "notifications-disabled" : "preferences-system-notifications"
          )}
          connection={[notifd, "dontDisturb"]}
        />
      </box>
      {/*<box spacing={4}>
        <Button
          onTitleClick={() => {}}
          label={bind(powerprofiles, "activeProfile")}
          iconName={bind(powerprofiles, "iconName")}
          pageToGo={"PowerProfile"}
          OnArrowClick={() => {}}
          connection={[wifi, "enabled"]}
        />
        <Button
          onTitleClick={() =>
            notifd.set_dont_disturb(!notifd.get_dont_disturb())
          }
          label={"Do Not Disturb"}
          iconName={bind(notifd, "dontDisturb").as((dnd) =>
            dnd ? "notifications-disabled" : "preferences-system-notifications"
          )}
          connection={[notifd, "dontDisturb"]}
        />
      </box>*/}
      <Gtk.Separator />
      <Slider
        onChangeValue={(self) => {
          speaker.volume = self.value;
        }}
        value={bind(speaker, "volume")}
        iconName={bind(speaker, "volumeIcon")}
        pageToGo={"Speaker"}
      />
      <Slider
        onChangeValue={(self) => {
          brightness.screen = self.value;
        }}
        value={bind(brightness, "screen")}
        iconName={"display-brightness-symbolic"}
      />
      <Slider
        onChangeValue={(self) => {
          brightness.kbd = self.value;
        }}
        value={bind(brightness, "kbd")}
        iconName={"keyboard-brightness-symbolic"}
      />
    </box>
  );
}
