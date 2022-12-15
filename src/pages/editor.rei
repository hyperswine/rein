#*
    Editor Page (Context)
*#

Contents: enum {
    Utf8 = String
}

// always return Component?
// I mean...

Cursor: f32, f32

export Editor: (file: File?) -> Component {
    let contents, set_contents = use_state(Contents())
    let cursor, set_cursor = use_state(Cursor())

    set_contents(
        if !file => Flex[spacing=SpaceAround] {"Empty" "Load a File?"}
        // only works when File is the first type. Order matters in Rei?
        else => read_to_string(file).unwrap_or("File does not exist, Open a new one?") as File | Component
    )

    // maybe generate a macro for each Component?
    // then either arcen works or Flex {} works or Flex[]

    // NOTE: vars and GeneralDef components share the same namespace in an arcen body
    Flex {
        match contents {
            File => ScrollableTextArea { contents OpenFile }
            Component => contents
        }
    }
}

// REI EDITOR FEATURES

export Rei: (rei_contents: Utf8, lang_server: LangServer) -> Component {
    Box {
        // syntax highlighting, code hover, etc based on results from lang server queries
        // like server.query(contents). Maybe just send updated contents
        rei_contents
    }
}

// like Rei Base, rnb is still stored as a utf8 file but rendered a bit differently
export ReiNotebook: (rb: Utf8) -> Component {
    // call lang server's rei nb run. Then prob set the state from the results
    let handle_play = () => lang_server.run(rb)

    Box[border=Dotted(0.1) w=100%] {
        // title bar
        Box[start=End] {
            PlayIcon[on_click=handle_play h=2]
        }

        rb
    }
}
