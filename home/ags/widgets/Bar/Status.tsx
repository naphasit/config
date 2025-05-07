import { bind, Variable } from "astal";
import Battery from "gi://AstalBattery";
import Network from "gi://AstalNetwork";
import Wp from "gi://AstalWp";

export default function Status() {
  const battery = Battery.get_default();
  const wp = Wp.get_default();
  const speaker = wp?.audio.defaultSpeaker!;

  const network = Network.get_default();
  if (!network.wifi)
    return <image iconName={bind(network.wired, "iconName")} />;

  const icon = Variable.derive(
    [
      bind(network, "primary"),
      bind(network.wifi, "iconName"),
      bind(network.wired, "iconName"),
    ],
    (primary, wifiIcon, wiredIcon) => {
      if (
        primary == Network.Primary.WIRED ||
        primary == Network.Primary.UNKNOWN
      ) {
        return wiredIcon;
      } else {
        return wifiIcon;
      }
    }
  );

  return (
    <button cssClasses={["Status"]}>
      <box spacing={4}>
        <image iconName={icon()} onDestroy={() => icon.drop()} />
        <image iconName={bind(speaker, "volumeIcon")} />
        <image
          visible={bind(battery, "isPresent")}
          iconName={bind(battery, "batteryIconName")}
        />
      </box>
    </button>
  );
}
