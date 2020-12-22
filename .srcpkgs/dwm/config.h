/* See LICENSE file for copyright and license details. */
#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int gappx     = 7;       /* gap pixel between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 0;        /* 0 means bottom bar */
static const char *fonts[]          = { "Inconsolata:size=10", "Font Awesome 5 Free Regular:size=10", "Font Awesome 5 Brands Regular:size=10", "Font Awesome 5 Free Solid:size=10" };
static const char dmenufont[]       = "Inconsolata:size=10";
static const char col_gray1[]       = "#282828";/*"#ebdbb2";*/
static const char col_gray2[]       = "#d5c4a1";
static const char col_gray3[]       = "#bdae93";
static const char col_gray4[]       = "#a89984";
static const char col_cyan[]        = "#b8bb26";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray1, col_cyan,  col_cyan  },
};

/* tagging */
static const char *tags[] = { "", "", "", "", "", "", "", "", "" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class         		 instance    title       tags mask     isfloating   monitor */
	{ "Gimp",        		 NULL,       NULL,       1 << 6,       0,           -1 },
	{ "Pavucontrol", 		 NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",     		 NULL,       NULL,       1 << 1,       0,           -1 },
	{ "Zathura",     		 NULL,       NULL,       1 << 5,       0,           -1 },
	{ "PyMOL",	     		 NULL,       NULL,       1 << 7,       0,           -1 },
	{ "Mpv",	     		 NULL,       NULL,       1 << 4,       0,           -1 },
	{ "Code",	     		 NULL,       NULL,       1 << 2,       0,           -1 },
	{ "VirtualBox Manager",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[]   = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray1, NULL };
static const char *termcmd[]    = { "st", NULL };
static const char *roficmd[]    = { "rofi", "-show", "drun", NULL };
static const char *wroficmd[]   = { "/home/egemen/.local/bin/rofi_web.sh", NULL };
static const char *codecmd[]    = { "code", NULL };
static const char *vimcmd[]     = { "st", "-e", "vim", NULL };
static const char *rangercmd[]  = { "st", "-e", "ranger", NULL };
static const char *browsecmd[]  = { "primusrun", "firefox", NULL };
static const char *audiocmd[]   = { "pavucontrol", NULL };
static const char *gimpcmd[]    = { "primusrun", "gimp", NULL };
static const char *locker[]     = { "/home/egemen/.local/bin/locker.sh", NULL };
static const char *screenshot[] = { "/home/egemen/.local/bin/screenshot.sh", NULL };
static const char *incvol[]     = { "amixer", "set", "Master", "5%+", "&&", "/home/egemen/.local/bin/dwm-bar", NULL  };
static const char *decvol[]     = { "amixer", "set", "Master", "5%-", "&&", "/home/egemen/.local/bin/dwm-bar", NULL  };
static const char *mutevol[]    = { "amixer", "-q", "set", "Master", "toggle", "&&", "/home/egemen/.local/bin/dwm-bar", NULL  };
static const char *incbri[]     = { "brightnessctl", "set", "10%+", "&&", "/home/egemen/.local/bin/dwm-bar", NULL };
static const char *decbri[]     = { "brightnessctl", "--min-value=750", "set", "10%-", "/home/egemen/.local/bin/dwm-bar", NULL };
static const char *vboxcmd[]    = { "virtualbox", NULL };

static Key keys[] = {
	/* modifier         key                      function        argument */
	{ MODKEY,           XK_d,                    spawn,          {.v = roficmd } },
	{ MODKEY|ShiftMask, XK_d,                    spawn,          {.v = wroficmd } },
	{ MODKEY,           XK_a,                    spawn,          {.v = audiocmd } },
	{ MODKEY,           XK_g,                    spawn,          {.v = gimpcmd } },
	{ MODKEY,           XK_b,                    spawn,          {.v = browsecmd } },
	{ MODKEY,           XK_v,                    spawn,          {.v = vimcmd } },
	{ MODKEY,           XK_r,                    spawn,          {.v = rangercmd } },
	{ MODKEY,           XK_c,                    spawn,          {.v = codecmd } },
	{ MODKEY,           XK_x,                    spawn,          {.v = locker } },
	{ MODKEY,           XK_o,                    spawn,          {.v = vboxcmd } },
	{ 0,                XF86XK_AudioLowerVolume, spawn,          {.v = decvol } },
	{ 0,                XF86XK_AudioMute,        spawn,          {.v = mutevol } },
	{ 0,                XF86XK_AudioRaiseVolume, spawn,          {.v = incvol } },
	{ 0,                XF86XK_MonBrightnessDown,spawn,          {.v = decbri } },
	{ 0,                XF86XK_MonBrightnessUp,  spawn,          {.v = incbri } },
	{ MODKEY,           XK_F12,                  spawn,          {.v = screenshot } },
	{ MODKEY,          	XK_Return,               spawn,          {.v = termcmd } },
	{ MODKEY|ShiftMask, XK_b,                    togglebar,      {0} },
	{ MODKEY,           XK_j,                    focusstack,     {.i = +1 } },
	{ MODKEY,           XK_k,                    focusstack,     {.i = -1 } },
	{ MODKEY,           XK_Up,                   focusstack,     {.i = +1 } },
	{ MODKEY,           XK_Down,                 focusstack,     {.i = -1 } },
	{ MODKEY,           XK_Right,                focusstack,     {.i = +1 } },
	{ MODKEY,           XK_Left,                 focusstack,     {.i = -1 } },
	{ MODKEY,           XK_i,                    incnmaster,     {.i = +1 } },
	{ MODKEY,           XK_p,                    incnmaster,     {.i = -1 } },
	{ MODKEY,           XK_h,                    setmfact,       {.f = -0.05} },
	{ MODKEY,           XK_l,                    setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask, XK_Return,               zoom,           {0} },
	{ MODKEY,           XK_Tab,                  view,           {0} },
	{ MODKEY|ShiftMask, XK_q,                    killclient,     {0} },
	{ MODKEY,           XK_t,                    setlayout,      {.v = &layouts[0]} },
	{ MODKEY,           XK_f,                    setlayout,      {.v = &layouts[1]} },
	{ MODKEY,           XK_m,                    setlayout,      {.v = &layouts[2]} },
	{ MODKEY,           XK_space,                setlayout,      {0} },
	{ MODKEY|ShiftMask, XK_space,                togglefloating, {0} },
	{ MODKEY,           XK_0,                    view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask, XK_0,                    tag,            {.ui = ~0 } },
	{ MODKEY,           XK_minus,                setgaps,        {.i = -1 } },
	{ MODKEY,           XK_plus,                 setgaps,        {.i = +1 } },
	{ MODKEY|ShiftMask, XK_plus,                 setgaps,        {.i = 0  } },
	{ MODKEY,           XK_comma,                focusmon,       {.i = -1 } },
	{ MODKEY,           XK_period,               focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask, XK_comma,                tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask, XK_period,               tagmon,         {.i = +1 } },
	TAGKEYS(            XK_1,                                    0)
	TAGKEYS(            XK_2,                                    1)
	TAGKEYS(            XK_3,                                    2)
	TAGKEYS(            XK_4,                                    3)
	TAGKEYS(            XK_5,                                    4)
	TAGKEYS(            XK_6,                                    5)
	TAGKEYS(            XK_7,                                    6)
	TAGKEYS(            XK_8,                                    7)
	TAGKEYS(            XK_9,                                    8)
	{ MODKEY|ShiftMask, XK_e,                    quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

