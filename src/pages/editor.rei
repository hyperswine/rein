#*
    Editor Page (Context)
*#

enum Contents {
    Utf8 = String
}

export fn Editor(file: File?) -> Component {
    // maybe allow Option<File> too so you can say Empty

    // the !operator for T? is sugar for T.is_err()
    if !file {
        @arcen Flex[spacing=SpaceAround] {
            "Empty"

            "Load a File?"

            OpenFile
        }
    }
    else {
        // the |T?| operator is sugar for unwrap 
        let new_contents = read_to_string(|file|).unwrap_or(
            @arcen {
                "File does not exist, Open a new one?"
                OpenFile
            }
        )
        set_contents(new_contents)
    }

    let contents, set_contents = use_state(Contents())

    @arcen Flex {
        contents
    }
}

// REI EDITOR FEATURES

export fn Rei(rei_contents: Utf8, lang_server: LangServer) -> Component {
    @arcen {
        // syntax highlighting, code hover, etc based on results from lang server queries
        // like server.query(contents). Maybe just send updated contents
        contents
    }
}

// like Rei Base, rnb is still stored as a utf8 file but rendered a bit differently
export fn ReiNotebook(rb: Utf8) -> Component {
    // call lang server's rei nb run. Then prob set the state from the results
    let handle_play = () => lang_server.run(rb)

    @arcen Box[border=Dotted(0.1) w=100%] {
        // title bar
        Box[start=End] {
            PlayIcon[on_click=handle_play h=2]
        }

        rb
    }
}
