import { App, Astal, Gdk } from "astal/gtk4";
import Workspaces from "./Workspaces";
import Time from "./Time";
import Tray from "./Tray";
import Status from "./Status";

export default function Bar(gdkmonitor: Gdk.Monitor) {
  return (
    <window
      visible
      cssClasses={["Bar"]}
      name={"Bar"}
      namespace={"Bar"}
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={
        Astal.WindowAnchor.TOP |
        Astal.WindowAnchor.LEFT |
        Astal.WindowAnchor.RIGHT
      }
      application={App}
    >
      <centerbox cssName="gui">
        <Workspaces />
        <Time />
        <box spacing={2}>
          <Tray />
          <Status />
        </box>
      </centerbox>
    </window>
  );
}
