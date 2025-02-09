
evaluate-commands %sh{


base0='rgb:1b2229'
base1='rgb:1c1f24'
base2='rgb:202328'
base3='rgb:23272e'
base4='rgb:3f444a'
base5='rgb:5B6268'
base6='rgb:73797e'
base7='rgb:9ca0a4'
base8='rgb:b1b1b1'
base9='rgb:e6e6e6'

grey=$base4
red='rgb:ff6c6b'
orange='rgb:da8548'
green='rgb:98be65'
teal='rgb:4db5bd'
yellow='rgb:ECBE7B'
blue='rgb:51afef'
dark_blue='rgb:2257A0'
magenta='rgb:c678dd'
violet='rgb:a9a1e1'
cyan='rgb:46D9FF'
dark_cyan='rgb:5699AF'
white='rgb:efefef'

green_alt='rgb:799033'


bg='rgb:282c34'
bg_alt='rgb:21242b'
bg_highlight='rgb:2E323C'
bg_popup='rgb:3E4556'
bg_widget=$bg
bg_statusline=$bg_popup
bg_visual=$base5
bg_selection=$dark_blue
bg_highlighted='rgb:4A4A45'

fg='rgb:bbc2cf'
fg_alt='rgb:5B6268'
fg_popup='rgb:D1D6DF'
fg_widget=$fg
fg_conceal=$base4
fg_subtle=$base7
fg_highlight='rgb:bfc6d3'
fg_linenr='rgb:4d5359'
fg_separator=$base4


highlight=$blue
hightlight_fg=$base0

tag='rgb:4dc5f7'


# code
echo "
face global value ${orange},default
face global type ${yellow},default
face global identifier ${blue},default
face global string ${green},default
face global error default,${red}
face global keyword ${blue},default
face global operator ${blue},default
face global attribute ${blue},default
face global comment ${base6},default
face global meta ${base7},default

# text

face global title ${violet},default+b
face global header ${violet},default
face global bold ${fg},default+b
face global italic ${fg},default+i
face global mono ${fg},default
face global block ${fg},default
face global link ${fg},default
face global bullet ${fg},default
face global list ${fg},default

# kakoune UI

face global Default ${fg},${bg}
face global PrimarySelection default,${base4}
face global SecondarySelection default,${bg_alt}
face global PrimaryCursor ${bg},${fg}+b
face global SecondaryCursor ${bg},${fg_highlight}+b
face global MatchingChar ${bg},${yellow}
face global Search default,${yellow}
face global Whitespace default,${base4}
face global BufferPadding ${cyan},default
face global LineNumbers ${fg_linenr},default
face global LineNumberCursor ${fg},default
face global MenuForeground ${highlight_fg},${bg_popup}
face global MenuBackground ${fg_popup},${bg_popup}
face global MenuInfo ${fg_popup},${bg_popup}
face global Information ${bg},${yellow}
face global Error ${bg},${red}
face global StatusLine ${base8},${bg_statusline}

face global StatusLineMode rgb:121212,rgb:97be64

face global StatusLineInfo ${base6},${bg_statusline}
face global StatusLineValue ${base6},${bg_statusline}
face global StatusCursor default,${fg}



# Shades of blue/cyan for normal mode
set-face global PrimaryCursor black,${green}+F
set-face global SecondaryCursor black,${green_alt}+F
set-face global PrimaryCursorEol black,${green}
set-face global SecondaryCursorEol black,${green_alt}
set-face global StatusLineMode ${bg},${green}
set-face global Prompt ${bg},${green}

# Shades of green/yellow for insert mode.
hook global ModeChange (push|pop):.*:insert %{
    set-face window PrimaryCursor black,${blue}+F
    set-face window SecondaryCursor black,${cyan}+F
    set-face window PrimaryCursorEol black,${blue}
    set-face window SecondaryCursorEol black,${cyan}
    set-face window StatusLineMode ${bg},${blue}
	set-face global Prompt ${bg},${blue}
}

# Undo colour changes when we leave insert mode.
hook global ModeChange (push|pop):insert:.* %{
    unset-face window PrimaryCursor
    unset-face window SecondaryCursor
    unset-face window PrimaryCursorEol
    unset-face window SecondaryCursorEol
    unset-face window StatusLineMode
	unset-face window Prompt
}

hook global ModeChange (push|pop):.*:prompt %{
    set-face window PrimaryCursor black,${blue}+F
    set-face window SecondaryCursor black,${cyan}+F
    set-face window PrimaryCursorEol black,${blue}
    set-face window SecondaryCursorEol black,${cyan}
    set-face window StatusLineMode ${bg},${violet}
	set-face global Prompt ${bg},${violet}
}

# Undo colour changes when we leave insert mode.
hook global ModeChange (push|pop):prompt:.* %{
    unset-face window PrimaryCursor
    unset-face window SecondaryCursor
    unset-face window PrimaryCursorEol
    unset-face window SecondaryCursorEol
    unset-face window StatusLineMode
	unset-face window Prompt
}
"
}

