import { Gdk, Gtk } from "astal/gtk4";
import { Variable } from "astal";
import Popup from "../Utils/Popup";
import Main from "./Main";
import Wifi from "./Wifi";
import Speaker from "./Speaker";

export const page = Variable<string>("Main");

export default function QuickSettings(_gdkmonitor: Gdk.Monitor) {
  return (
    <Popup name={"QuickSettings"} layout="top_right">
      <stack
        visibleChildName={page()}
        transitionType={Gtk.StackTransitionType.SLIDE_LEFT_RIGHT}
        cssName="gui"
        vertical
        vexpand={false}
        heightRequest={300}
        widthRequest={300}
      >
        <Main />
        <Wifi />
        <Speaker />
      </stack>
    </Popup>
  );
}
