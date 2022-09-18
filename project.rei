name = "reid"
author = "Jason Qin"
description = "Reid, the IDE"
license = "LGPL-3"

// HOW DOES PREI work you ask? good question
// prei new <name> always generates:
/*
    project.rei
    build.rei
    src/
        main.rei
        lib.rei
        common.rei
*/

// arcen new <name> creates:
/*
    project.rei
    build.rei
    src/
        main.rei
        lib.rei
        prelude.rei
        components/
            mod.rei
        pages/
            mod.rei
            about.rei
*/
