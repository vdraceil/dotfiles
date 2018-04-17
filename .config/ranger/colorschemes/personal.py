from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class base(ColorScheme):
    progress_bar_color = 1

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            attr = normal
            if context.empty or context.error:
                fg = 7
                bg = 232
            if context.border:
                fg = 243
            if context.image:
                fg = 6
            if context.video:
                fg = 129
            if context.audio:
                fg = 147
            if context.document:
                fg = 205
            if context.container:
                fg = 4
            if context.directory:
                fg = 244
            elif context.executable and not \
                    any((context.media, context.container,
                       context.fifo, context.socket)):
                attr |= bold
                fg = 165
            if context.socket or context.fifo or context.device:
                fg = 1
                bg = 232
            if context.link:
                fg = 14
            elif context.bad:
                fg = 9
            if context.bad:
                bg = 232
            if context.selected:
                fg = 11
            elif context.tag_marker:
                fg = 5
            elif context.cut or context.copied:
                fg = 202
            if context.main_column:
                if context.selected:
                    attr |= bold
                    fg = 46
                if context.marked:
                    fg = 13
            if context.badinfo:
                bg = 9

        elif context.in_titlebar:
            if context.hostname:
                fg = context.bad and 9 or 3
            elif context.directory:
                fg = 244
            elif context.tab:
                if context.good:
                    attr |= bold
                    fg = 4
            elif context.link:
                fg = 14

        elif context.in_statusbar:
            if context.permissions:
                fg = 3
            if context.marked:
                fg = 13
            if context.message:
                fg = 11
            if context.loaded:
                bg = self.progress_bar_color
            if context.bad:
                attr |= bold
                fg = 9

        if context.text:
            if context.highlight:
                fg = 252
                bg = 52

        if context.in_taskview:
            if context.title:
                fg = 252
            if context.selected:
                attr |= bold
            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color

        if (context.vcsfile or context.vcsremote) and not context.selected:
            attr &= ~bold
            if context.vcscommit:
                fg = 6
            elif context.vcsdiverged:
                fg = 8
                bg = 5
            elif context.vcsconflict:
                fg = 11
                bg = 9
            elif context.vcschanged:
                fg = 10
            elif context.vcsunknown:
                fg = 210
                bg = 232
            elif context.vcsstaged:
                fg = 2
            elif context.vcssync:
                fg = 46
            elif context.vcsbehind:
                fg = 13
            elif context.vcsahead:
                fg = 10
            elif context.vcsignored:
                fg = 216

        return fg, bg, attr
