/* See LICENSE file for copyright and license details. */

#include <X11/XF86keysym.h>

/* appearance -------------------------------------------------------------- */
static const unsigned int borderpx  = 0;  /* border pixel of windows */
static const unsigned int snap      = 32;  /* snap pixel */
/* gap */
static const Gap default_gap        = {.isgap = 1, .realgap = 8, .gappx = 8};
/* bar */
static const int showbar            = 1; /* 0 means no bar */
static const int topbar             = 1; /* 0 means bottom bar */
/* bar padding */
static const int vertpad            = 2; /* vertical padding of bar */
static const int sidepad            = 8; /* horizontal padding of bar */

/* font -------------------------------------------------------------- */
static const char *fonts[]          = {
  "UbuntuSansMono Nerd Font:style=Bold:size=12",
  "SymbolsNerdFontMono:size=13"
};
static const char dmenufont[] = "UbuntuSansMono Nerd Font:style=bold:size=12:antialias=true:autohint=true";

static const char col_gray1[]       = "#2d2d2d";
static const char col_gray2[]       = "#272727";
static const char col_gray3[]       = "#cccccc";
static const char col_cyan[]        = "#f39660";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_cyan, col_gray1,  col_cyan  },
};

/* autostart -------------------------------------------------------------- */
static const char *const autostart[] = {
	"sh", "-c", "~/.config/suckless/scripts/autostart.sh", NULL,
  // "slstatus", NULL,
  // "sh", "-c", "feh --bg-scale ~/.dotfiles/pictures/tron.jpeg", NULL,
  // "syncthing", "serve", "--no-browser", "--no-restart", "--logflags=0", NULL,
	NULL /* terminate */
};

/* tag -------------------------------------------------------------- */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7" };
static const unsigned int ulinepad	    = 4;	/* horizontal padding between the underline and tag */
static const unsigned int ulinestroke	  = 2;	/* thickness / height of the underline */
static const int ulineall               = 0;	/* 1 to show underline on all tags, 0 for the active ones */
static const unsigned int ulinevoffset	= 0;	/* how far above the bottom of the bar the line should appear */

/* tag rules */
static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class              instance    title       tags mask     isfloating   monitor */
  // { "Gimp",             NULL,       NULL,       0,            1,           -1 },
	{ "mpv",  				    NULL,       NULL,       0,       		  1,           -1 },
	{ "qimgv",    			  NULL,       NULL,       0,       		  1,           -1 },
	{ "Transmission-gtk", NULL,       NULL,       0,       		  1,           -1 },
	{ "Lxappearance",   	NULL,       NULL,       0,       		  1,           -1 },
	{ "Colorpicker",  		NULL,       NULL,       0,       		  1,           -1 },
};

/* layout(s) -------------------------------------------------------------- */
static const float mfact          = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster          = 1;    /* number of clients in master area */
static const int resizehints      = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen   = 1;    /* 1 will force focus on the fullscreen window */
static const int refreshrate      = 120;  /* refresh rate (per second) for client move/resize */

/* layouts */
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions -------------------------------------------------------------- */
#define MODKEY Mod4Mask
#define ALTKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,  view,         {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,  toggleview,   {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,  tag,          {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,  toggletag,    {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2]             = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[]       = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray3, NULL };
static const char *layoutmenu_cmd   = "~/.config/suckless/scripts/layoutmenu.sh";

static const char *terminalcmd[]    = { "alacritty", NULL };
static const char *webbrowsercmd[]  = { "firefox", NULL };
static const char *filemanagercmd[] = { "thunar", NULL };
static const char *editorcmd[]      = { "mousepad", NULL };
static const char *gimpcmd[]        = { "gimp", NULL };

/* action keys -------------------------------------------------------------- */
#include "movestack.c"
static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,             XK_p,       spawn,    {.v = dmenucmd } },
	{ MODKEY,             XK_Return,  spawn,    {.v = terminalcmd } },
	{ MODKEY,             XK_t,       spawn,    {.v = terminalcmd  } },
	{ MODKEY,             XK_w,       spawn,    {.v = webbrowsercmd } },
	{ MODKEY,             XK_f,       spawn,    {.v = filemanagercmd } },
	{ MODKEY,             XK_e,       spawn,    {.v = editorcmd } },
	{ MODKEY,             XK_g,       spawn,    {.v = gimpcmd } },

	{ MODKEY,             XK_s,       spawn,    SHCMD( "flameshot full --path /home/sdobri/Screenshots/" ) },
	{ MODKEY|ShiftMask,   XK_s,       spawn,    SHCMD( "flameshot gui --path /home/sdobri/Screenshots/" ) },

	{ MODKEY,             XK_space,   spawn,    SHCMD( "~/.config/suckless/rofi/launchers/launcher.sh" ) },
	{ MODKEY,             XK_x,       spawn,    SHCMD( "~/.config/suckless/rofi/powermenu/powermenu.sh" ) },
  { MODKEY,             XK_h,       spawn,    SHCMD( "~/.config/suckless/rofi/shortcutshelp/shortcutshelp.sh" ) },

  { ALTKEY|ControlMask, XK_i,       spawn,    SHCMD( "~/.config/suckless/scripts/check-my-net" ) },
	// { MODKEY|ShiftMask,   XK_r,       spawn,    SHCMD( "~/.config/suckless/scripts/redshift-on" ) },
	// { MODKEY,             XK_r,       spawn,    SHCMD( "~/.config/suckless/scripts/redshift-off" ) },

  /* audio */
	{ 0,  XF86XK_AudioMute,           spawn,    SHCMD( "amixer sset Master toggle" ) },
	{ 0,  XF86XK_AudioRaiseVolume,    spawn,    SHCMD( "amixer sset Master 5%+" ) },
	{ 0,  XF86XK_AudioLowerVolume,    spawn,    SHCMD( "amixer sset Master 5%-" ) },
  /* brightness */
	{ 0,  XF86XK_MonBrightnessUp,     spawn,    SHCMD( "brightnessctl -c backlight set 5%+" ) },
	{ 0,  XF86XK_MonBrightnessDown,   spawn,    SHCMD( "brightnessctl -c backlight set 5%-" ) },

  /* togglebar */
  { MODKEY,                       XK_b,      togglebar,      {0} },

  /* stacks focus */
	{ MODKEY,                       XK_Right,  focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_Left,   focusstack,     {.i = -1 } },
  /* stacks move */
	{ MODKEY|ALTKEY,                XK_Right,  movestack,      {.i = +1 } },
	{ MODKEY|ALTKEY,                XK_Left,   movestack,      {.i = -1 } },
  /* stacks resize */
  { ALTKEY|ControlMask,           XK_Left,   setmfact,       {.f = -0.05} },
  { ALTKEY|ControlMask,           XK_Right,  setmfact,       {.f = +0.05} },

  /* layouts tiles */
  { MODKEY|ALTKEY,                  XK_t,      setlayout,      {.v = &layouts[0]} },
  /* layouts null */
  { MODKEY|ALTKEY,                  XK_n,      setlayout,      {.v = &layouts[1]} },
  /* layouts monocle */
  { MODKEY|ALTKEY,                  XK_m,      setlayout,      {.v = &layouts[2]} },
  /* layouts fullscreen */
  { MODKEY|ALTKEY,                  XK_f,      fullscreen,     {0} },

  /* window */
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
  { MODKEY,                       XK_z,      zoom,           {0} },

	{ MODKEY,                       XK_Tab,    view,           {0} },
  { MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },

  { MODKEY|ControlMask,           XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	
  /* monitor */
  { MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	
  /* gaps resize */
  { MODKEY,                       XK_minus,  setgaps,        {.i = -5 } },
	{ MODKEY,                       XK_equal,  setgaps,        {.i = +5 } },
  /* gaps reset */
	{ MODKEY|ShiftMask,             XK_minus,  setgaps,        {.i = GAP_RESET } },
  /* gaps toggle */
	{ MODKEY|ShiftMask,             XK_equal,  setgaps,        {.i = GAP_TOGGLE} },
  
  /* ???? */
  { MODKEY|ShiftMask,             XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY|ShiftMask,             XK_l,      setmfact,       {.f = +0.05} },
	
  /* tagkeys */
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
  
  /* close */
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button1,        layoutmenu,     {0} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = terminalcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

