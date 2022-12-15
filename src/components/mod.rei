#*
    Components
*#

Context: enum {
    // same thing as Editor = String("Editor")
    Editor = "Editor"
    Store = "Store"
    Settings = "Settings"
}

export(prelude) TopBar: (curr_context: _) -> Component {
    Flex[dir=FlexDir::Row] {
        LeftSideBar
        
        // Actual TopBar
        Box {
            curr_context
        }
    }
}

// => works with replace too

LeftSideBar: (curr_encoding: Encoding) -> Component {
    let handle_hover_circle = () => (Popup[] {
        Circle {
            // option must implement arcen::Render(props)
            options.map(
                option => Box { option }
            )
        }
    })

    Flex[dir=Col spacing=SpaceAround] {
        Box {
            // NOTE: the root/ dir is always at the root of the workspace
            Image[src="/assets/circle.png" h=2 on_hover=handle_hover_circle]
            FileIcon[h=2]
            GitIcon[h=2]
            DebugIcon[h=2]
        }
        
        BriefcaseIcon[h=2]

        Box {
            // returns a T that impls arcen::Render(props), prob impl'd by Arcen
            std::time::now()

            curr_encoding
        }
    }
}

// call system's API through arcen::os::filebrowser_open
// should show a file icon and allow a file to be read into RAM and returned to caller
// anon tagged unions allowed, and various tricks exist to reduce memory footprint like compression and reducing copies
OpenFile: () -> String | Component {
    // OS should open its file browser and allow user to select a single file, returned to arcen
    let handle_click = () => set_selected_file(arcen::os::filebrowser_open())
    let selected_file, set_selected_file = use_state(File?())

    // instead of returing the file, return a component that displays it? Nope
    selected_file? : FileIcon[on_click=handle_click]
}

ScrollableTextArea: () -> Component => _
