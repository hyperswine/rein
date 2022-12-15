#*
    Rein IDE
*#

use arcen::common::[Component Router]
use pages::index::Index

main: (config: Config) -> Status => arcen.render(App)

App: () -> Component => Arcen[router=Router index=Index]
