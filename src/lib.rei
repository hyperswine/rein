#*
    Rein API
*#

// these things might not have to be traits
export create_file: trait (filename: _) -> _
export rename_file: trait (filename: _, new_filename: _) -> _
export delete_file: trait (filename: _) -> _

export analyse: trait (input: String) -> _
export compile: trait (input: String) -> _

// would involve finding or compiling the string, then finding ways to transform it into an alternative form
export refactor: trait (input: String) -> _

// run a given context and provide inputs if necessary. Includes unit tests
export run: trait (input: String) -> _

// are all the inputs Strings?
export goto_definition: trait (input: String) -> _

// so rein impls these fns then? and if using prei (builtin extension)
// kinda just works?
// no need to be traits?
