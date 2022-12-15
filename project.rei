name = "rein"
author = "Jasen Qin"
description = "Rein, the IDE"
license = "LGPL-3"

rei = "2022-0.1"

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
