import { App } from "astal/gtk4";
import style from "./styles/default.scss";
import Bar from "./widgets/Bar/Index";
import Applauncher from "./widgets/AppLauncher/Index";

const widgets = [
  Bar, Applauncher
];

App.start({
  css: style,
  main() {
    widgets.map((widget) => App.get_monitors().map(widget));
  },
});
