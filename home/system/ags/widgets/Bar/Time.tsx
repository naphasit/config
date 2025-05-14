import { GLib, Variable } from "astal";

export default function Time() {
  const time = Variable<string>("").poll(
    1000,
    () => GLib.DateTime.new_now_local().format("%b %d, %I:%M %p")!
  );

  return (
    <button cssClasses={["Time"]} onDestroy={() => time.drop()} label={time()} />
  );
}
