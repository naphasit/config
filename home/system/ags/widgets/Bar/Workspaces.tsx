import { bind, Variable } from "astal";
import { Gtk } from "astal/gtk4";
import { ButtonProps } from "astal/gtk4/widget";
import Hyprland from "gi://AstalHyprland";

function WorkspaceButton({ ws, ...props }: ButtonProps & { ws: Hyprland.Workspace }) {
  const hyprland = Hyprland.get_default();
  const classNames = Variable.derive(
    [bind(hyprland, "focusedWorkspace"), bind(hyprland, "clients")],
    (fws, _) => {
      const classes = ["workspace-button"];

      const active = fws.id == ws.id;
      active && classes.push("active");

      const occupied = hyprland.get_workspace(ws.id)?.get_clients().length > 0;
      occupied && classes.push("occupied");
      return classes;
    },
  );

  return (
    <button
      cssClasses={classNames()}
      onDestroy={() => classNames.drop()}
      valign={Gtk.Align.CENTER}
      halign={Gtk.Align.CENTER}
      onClicked={() => ws.focus()}
      {...props}
    />
  );
}

export default function Workspaces() {
  const hypr = Hyprland.get_default();

  return (
    <box cssClasses={["Workspaces"]} spacing={4} >
      {bind(hypr, "workspaces").as((wss) =>
        wss
          .filter((ws) => !(ws.id >= -99 && ws.id <= -2))
          .sort((a, b) => a.id - b.id)
          .map((ws) => (
            <WorkspaceButton ws={ws} />
          ))
      )}
    </box>
  );
}
