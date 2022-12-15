#*
    Pages
*#

restore_workspace: (filepath: String) -> Workspace {
    if let file ?= std::read(filepath) {
        // attempt to parse, if works, then return Workspace
        // wait parse_workspace()!
        match parse_workspace(file) {
            Ok(workspace) => return workspace
            // would panic on _
            Err(e) => _
        }
    }
   
    // else create a fresh workspace and write a file to store its boilerplate data
    let workspace = Workspace()
    std::write(filepath, workspace)

    workspace
}

export Index: (workspace: Workspace) -> Component {
    // restore context from settings when you open app
    // let restored_context = restore_workspace(workspace.filepath())

    // get context from workspace, if no context available, render an empty page
    let saved_page_context = workspace.context.first() ?: Context()
    let curr_context, set_curr_context = use_state(saved_page_context)
    
    Flex {
        TopBar[curr_context]
    }
}
