import { App } from "astal/gtk4"
import style from "./styles/default.scss"
import Bar from "./widgets/Bar/Index"

const widgets = [
    Bar
]

App.start({
    css: style,
    main() {
        widgets.map((widget) => App.get_monitors().map(widget));
    },
})
