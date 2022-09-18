#*
    Pages
*#

fn restore_workspace(filepath: String) -> Workspace {
    if let Ok(file) = read_to_string(filepath) {
        // attempt to parse, if works, then return Workspace
        let err = parse_workspace(file)!
    }
   
    let workspace = Workspace()

    // else create a fresh workspace
    write_string(filepath, workspace)

    workspace
}

export fn Index(workspace: Workspace) -> Component {
    // restore context from settings when you open app

    // get context from workspace, if no context available, render an empty page
    let saved_page_context = workspace.context.first()? : Context()
    let [curr_context, set_curr_context] = use_state(saved_page_context)
    
    @arcen Flex {
        TopBar[curr_context]
    }
}
