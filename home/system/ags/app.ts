import app from "ags/gtk4/app"
import style from "./styles/default.scss"
import Bar from "./widgets/Bar/Index.tsx"

app.start({
  css: style,
  main() {
    app.get_monitors().map(Bar)
  },
})
