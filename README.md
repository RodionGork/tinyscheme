# TinyScheme R7

Latest version is [20.10](https://github.com/RodionGork/tinyscheme/tags)
| **[Emulator](https://tinyscheme-r7.sourceforge.io/emu.html)**
| [Project WebSite](https://tinyscheme-r7.sourceforge.io/)
| [**Downloads** with binaries](https://sourceforge.net/projects/tinyscheme-r7/files)

_Disclaimer: this repo respects original authors and there is no intention
to take over their fame. It's branched to implement some features from the modern
[R7RS](https://small.r7rs.org/) standard, to fix some old bugs
and tailor it for use in educational purposes._

### About

This is small `Scheme` language implementation written in `C` language. Obvious usages are:

- as a tiny engine for running plugins and other extensions in your `C/C++` program (suppose you want to change some part
  of logic of your program without recompiling it every time).
- as a sandbox to learn the language (as it supports most features except those which will make implementation not "tiny")
- as utility script-running tool, even to create `CGI-scripts` for web-server

The original is principally developed as [tinyscheme.sourceforge.net](http://tinyscheme.sourceforge.net/home.html).

This offspring was cloned from rev125 there. Currently my wish is to bring it bit closer to `R7RS-small` standard
(original is close to `R5RS` of 1998).

### Recent Changes and Improvements:

- basic **bytevector** functions implemented
- **UTF-8 is now supported in strings and characters** with minor limitation of case-conversion not extended above ASCII range
- symbols are case-sensitive by default (to match R6RS, R7RS and speed-up a bit)
- fixes for various bugs (many of them found in "open" state in original repo)
- tests in simple shell scripts are added
- removed some old unused code (eg. objlist implementation)
- code cleanup / formatting (with `indent -br -brs -brf -nut -ci4 -nlp -npsl -npro -npcs -ce *.c`)
