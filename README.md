# TinyScheme

[Try it in-browser](https://rodiongork.github.io/tinyscheme/) - somewhat cut-down version yet

_Disclaimer: this repo is not related to original authors, and there is no intention
to take over their fame or their work. It's created to evaluate it
and, perhaps, fix some issues._

This is small `Scheme` language implementation written in `C` language to provide
script abilities to C programs or be used standalone. It saw use in some popular
application, among them a plugin for GIMP graphic editor.

The original is principally developed as [sourceforge project "TinyScheme"](https://sourceforge.net/projects/tinyscheme/).

As it doesn't always have great activity there, and as sourceforge (though great resource) doesn't
allow as easy cooperation as github, I took it from there at rev 125 in 
attempt to bring some refreshing and cleanup.

For now the following changes happened:

- fixes for few bugs (mostly those still open at original project page, see history)
- tests in simple shell scripts are added
- removed some compilation warnings
- symbols are case-sensitive by default (to match R6RS, R7RS and speed-up a bit)
- removed some old unused code (eg. objlist implementation)
- code cleanup / formatting (with `indent -br -brs -brf -nut -ci4 -nlp -npsl -npro -npcs -ce *.c`)

If the changes will go bit too far it will make sense to modify project name in some manner to prevent
confusion with original, but also to clarify it is related.