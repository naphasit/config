import { App, hook } from "astal/gtk4";
import { Variable } from "astal";
import Apps from "gi://AstalApps";

export default function Search({apps, text}: { apps: Apps.Apps,text: Variable<string> }) {
  const onEnter = () => {
    apps.fuzzy_query(text.get())?.[0].launch();
    App.get_window("AppLauncher")?.set_visible(false);
  };

  return (
    <overlay cssClasses={["search"]} heightRequest={30}>
      <entry
        type="overlay"
        vexpand
        primaryIconName={"system-search-symbolic"}
        placeholderText="Search..."
        text={text.get()}
        setup={(self) => {
          hook(self, App, "window-toggled", (_, win) => {
            const winName = win.name;
            const visible = win.visible;

            if (winName == "AppLauncher" && visible) {
              text.set("");
              self.set_text("");
              self.grab_focus_without_selecting();
            }
          });
        }}
        onChanged={(self) => text.set(self.text)}
        onActivate={onEnter}
      />
    </overlay>
  );
}