import { App } from "astal/gtk4";
import style from "./styles/default.scss";
import Bar from "./widgets/Bar/Index";
import Applauncher from "./widgets/AppLauncher/Index";
import QuickSettings from "./widgets/QuickSettings/Index";

const widgets = [
  Bar,
  Applauncher,
  QuickSettings
];

App.start({
  css: style,
  main() {
    widgets.map((widget) => App.get_monitors().map(widget));
  },
});
