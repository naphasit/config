import { bind } from "astal";
import { Gtk } from "astal/gtk4";
import Tray from "gi://AstalTray";

export default function TrayPanelButton() {
  const tray = Tray.get_default();
  return (
    <box cssClasses={["Tray"]} spacing={2}>
      {bind(tray, "items").as((items) =>
        items.map((item) => (
          <menubutton
            setup={(self) => {
              self.insert_action_group("dbusmenu", item.actionGroup);
            }}
            tooltipText={bind(item, "tooltipMarkup")}
            alwaysShowArrow={false}
            always_show_arrow={false}
          >
            <image gicon={bind(item, "gicon")} />
            {Gtk.PopoverMenu.new_from_model(item.menuModel)}
          </menubutton>
        )),
      )}
    </box>
  );
}