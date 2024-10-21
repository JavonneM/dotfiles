const hyprland = await Service.import("hyprland")
const notifications = await Service.import("notifications")
const mpris = await Service.import("mpris")
const audio = await Service.import("audio")
const battery = await Service.import("battery")
const systemtray = await Service.import("systemtray")

const date = Variable("", {
    poll: [1000, 'date "+%H:%M "'],
})

const workspaceConfiguration = {
    ActiveIcon: "",
    InactiveIcon: "",
}
// widgets can be only assigned as a child in one container
// so to make a reuseable widget, make it a function
// then you can simply instantiate one by calling it
function Workspaces({ monitor = 0 }, wsConfig) {
    const activeWorkspaceId = hyprland.active.workspace.bind("id")
    const workspacesForMonitor = hyprland.bind("workspaces")
        .as(ws => ws.
            // Remove Scratch ws
            filter((v) => v.name != "special:magic").
            filter((v) => v.monitorID == monitor).
            sort((a, b) => a.id - b.id)
        )
    const merged = Utils.merge([activeWorkspaceId, workspacesForMonitor], (activeId, ws) => {
        return ws.map(
            (ws) => Widget.Button({
                on_clicked: () => hyprland.messageAsync(`dispatch workspace ${ws.id}`),
                child: Widget.Label(`${ws.id} ${activeId == ws.id ? wsConfig.ActiveIcon : wsConfig.InactiveIcon}`),
                class_name: `${activeId === ws.id ? "focused" : ""}`,
            })
        )

    })
    return Widget.Box({
        class_name: "workspaces",
        children: merged,
    })
}


function ClientTitle() {
    return Widget.Label({
        class_name: "client-title",
        label: hyprland.active.client.bind("title").as(n => n.substring(0, 40)),
    })
}


function Clock() {
    return Widget.Label({
        class_name: "clock",
        label: date.bind(),
    })
}


// we don't need dunst or any other notification daemon
// because the Notifications module is a notification daemon itself
function Notification() {
    const popups = notifications.bind("popups")
    return Widget.Box({
        class_name: "notification",
        visible: popups.as(p => p.length > 0),
        children: [
            Widget.Icon({
                icon: "preferences-system-notifications-symbolic",
            }),
            Widget.Label({
                label: popups.as(p => p[0]?.summary || ""),
            }),
        ],
    })
}


function Media() {
    const label = Utils.watch("", mpris, "player-changed", () => {
        if (mpris.players[0]) {
            const { track_artists, track_title } = mpris.players[0]
            return `${track_artists.join(", ")} - ${track_title} `
        } else {
            console.log("nothing playing")
            return "Nothing is playing"
        }
    })

    return Widget.Button({
        class_name: "pill",
        on_primary_click: () => mpris.getPlayer("")?.playPause(),
        on_scroll_up: () => mpris.getPlayer("")?.next(),
        on_scroll_down: () => mpris.getPlayer("")?.previous(),
        child: Widget.Label({ label }),
    })
}


function VolumeSlider() {
    const icons = {
        101: "overamplified",
        67: "high",
        34: "medium",
        1: "low",
        0: "muted",
    }

    function getIcon() {
        const icon = audio.speaker.is_muted ? 0 : [101, 67, 34, 1, 0].find(
            threshold => threshold <= audio.speaker.volume * 100)

        return `audio - volume - ${icons[icon]} - symbolic`
    }

    const icon = Widget.Icon({
        icon: Utils.watch(getIcon(), audio.speaker, getIcon),
    })

    const slider = Widget.Slider({
        hexpand: true,
        draw_value: false,
        on_change: ({ value }) => audio.speaker.volume = value,
        setup: self => self.hook(audio.speaker, () => {
            self.value = audio.speaker.volume || 0
        }),
    })

    return Widget.Box({
        class_name: "volume",
        css: "min-width: 180px",
        children: [icon, slider],
    })
}

function AudioItem({
    class_name,
    stream,
    get_icon,
    get_label,
    on_scroll_up,
    on_scroll_down,
    on_click,
}) {
    return Widget.Button({
        class_name: class_name,
        onScrollUp: on_scroll_up,
        onScrollDown: on_scroll_down,
        onClicked: on_click,
        child: Widget.Box({
            class_name: "",
            children: [
                //Widget.Icon({
                //    class_name: "icon",
                //    icon: Utils.watch(getIcon(), stream, getIcon),
                //}),
                Widget.Label({
                    class_name: "label",
                    label: Utils.watch(get_label(), stream, get_label)
                }),
                Widget.Label({
                    class_name: "icon",
                    label: Utils.watch(get_icon(), stream, get_icon)
                }),
            ],
        })
    })
}
function AudioTray() {
    const icons = {
        66: "",
        33: "",
        1: "",
        0: "",
    }

    function getSpeakerIcon() {
        const icon = audio.speaker.is_muted ? 0 : [66, 33, 1, 0].find(
            threshold => threshold <= audio.speaker.volume * 100)
        return ` ${icons[icon]}`
    }
    const micConfig = {
        class_name: "microphone",
        stream: audio.microphone,
        get_icon: () => ` `,
        get_label: () => `${Math.floor(audio.microphone.volume * 100)}%`,
        on_scroll_up: () => audio.microphone.volume = Math.min(audio.microphone.volume + 0.10, 1),
        on_scroll_down: () => audio.microphone.volume = Math.max(audio.microphone.volume - 0.10, 0),
        on_click: () => { },
    }
    const speakerConfig = {
        class_name: "speaker",
        stream: audio.speaker,
        get_icon: getSpeakerIcon,
        get_label: () => `${Math.floor(audio.speaker.volume * 100)}%`,
        on_scroll_up: () => audio.speaker.volume = Math.min(audio.speaker.volume + 0.10, 1),
        on_scroll_down: () => audio.speaker.volume = Math.max(audio.speaker.volume - 0.10, 0),
        on_click: () => { },
    }

    return Widget.Box({
        class_name: "audio",
        children: [
            AudioItem(micConfig),
            AudioItem(speakerConfig),
        ],
    })
}

function BatteryLabel() {
    const value = battery.bind("percent").as(p => p > 0 ? p / 100 : 0)
    const icon = battery.bind("percent").as(p =>
        `battery - level - ${Math.floor(p / 10) * 10} - symbolic`)

    return Widget.Box({
        class_name: "battery",
        visible: battery.bind("available"),
        children: [
            Widget.Icon({ icon }),
            Widget.LevelBar({
                widthRequest: 140,
                vpack: "center",
                value,
            }),
        ],
    })
}


function SysTray() {
    const items = systemtray.bind("items")
        .as(items => items.map(item => Widget.Button({
            child: Widget.Icon({ icon: item.bind("icon") }),
            on_primary_click: (_, event) => item.activate(event),
            on_secondary_click: (_, event) => item.openMenu(event),
            tooltip_markup: item.bind("tooltip_markup"),
        })))

    return Widget.Box({
        children: items,
    })
}


// layout of the bar
function Left(props) {
    return Widget.Box({
        spacing: 8,
        children: [
            Media(),
            //Widget.Label({ label: Utils.watch("", mpris, "play-back-status", () => mpris.players[0].play_back_status) }),

            // ClientTitle(),
        ],
    })
}

function Center(props) {
    return Widget.Box({
        class_name: "pill",
        spacing: 4,
        children: [
            Workspaces(props, workspaceConfiguration),
            Notification(),
        ],
    })
}

function Right(props) {
    return Widget.Box({
        class_name: "pill",
        hpack: "end",
        spacing: 4,
        children: [
            AudioTray(),
            //BatteryLabel(),
            SysTray(),
            Clock(),
        ],
    })
}

function Bar(monitor = 0) {
    return Widget.Window({
        name: `bar - ${monitor} `, // name has to be unique
        class_name: "bar",
        monitor,
        anchor: ["top", "left", "right"],
        exclusivity: "exclusive",
        child: Widget.CenterBox({
            start_widget: Left({
                monitor: monitor
            }),
            center_widget: Center({
                monitor: monitor
            }),
            end_widget: Right({
                monitor: monitor
            }),
        }),
    })
}
App.config({
    style: './style.css',
    windows: hyprland.monitors.map((v) => Bar(v.id)),
})

export { }
