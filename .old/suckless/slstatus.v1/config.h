/* See LICENSE file for copyright and license details. */

/* interval between updates (in ms) */
const unsigned int interval = 1000;

/* text to show if no value can be retrieved */
static const char unknown_str[] = " ";

/* maximum command output length */
#define CMDLEN 200

/* battery levels to notify - add any levels you want to receive notification
 * for (in percent) */
const int notifiable_levels[] = { 25, 20, 15, 10, 5 };
const size_t notifiable_levels_count = sizeof(notifiable_levels) / sizeof(notifiable_levels[0]);

/*
 * function            description                     argument (example)
 *
 * battery_perc        battery percentage              battery name (BAT0)
 *                                                     NULL on OpenBSD/FreeBSD
 * battery_notify      linux battery notifications     battery name (BAT0)
 *                                                     OpenBSD/FreeBSD not
 * supported battery_remaining   battery remaining HH:MM         battery name
 * (BAT0) NULL on OpenBSD/FreeBSD battery_state       battery charging state
 * battery name (BAT0) NULL on OpenBSD/FreeBSD cat                 read
 * arbitrary file             path cpu_freq            cpu frequency in MHz NULL
 * cpu_perc            cpu usage in percent            NULL
 * datetime            date and time                   format string (%F %T)
 * disk_free           free disk space in GB           mountpoint path (/)
 * disk_perc           disk usage in percent           mountpoint path (/)
 * disk_total          total disk space in GB          mountpoint path (/)
 * disk_used           used disk space in GB           mountpoint path (/)
 * entropy             available entropy               NULL
 * gid                 GID of current user             NULL
 * hostname            hostname                        NULL
 * ipv4                IPv4 address                    interface name (eth0)
 * ipv6                IPv6 address                    interface name (eth0)
 * kernel_release      `uname -r`                      NULL
 * keyboard_indicators caps/num lock indicators        format string (c?n?)
 *                                                     see keyboard_indicators.c
 * keymap              layout (variant) of current     NULL
 *                     keymap
 * load_avg            load average                    NULL
 * netspeed_rx         receive network speed           interface name (wlan0)
 * netspeed_tx         transfer network speed          interface name (wlan0)
 * num_files           number of files in a directory  path
 *                                                     (/home/foo/Inbox/cur)
 * ram_free            free memory in GB               NULL
 * ram_perc            memory usage in percent         NULL
 * ram_total           total memory size in GB         NULL
 * ram_used            used memory in GB               NULL
 * run_command         custom shell command            command (echo foo)
 * swap_free           free swap in GB                 NULL
 * swap_perc           swap usage in percent           NULL
 * swap_total          total swap size in GB           NULL
 * swap_used           used swap in GB                 NULL
 * temp                temperature in degree celsius   sensor file
 *                                                     (/sys/class/thermal/...)
 *                                                     NULL on OpenBSD
 *                                                     thermal zone on FreeBSD
 *                                                     (tz0, tz1, etc.)
 * uid                 UID of current user             NULL
 * up                  interface is running            interface name (eth0)
 * uptime              system uptime                   NULL
 * username            username of current user        NULL
 * vol_perc            OSS/ALSA volume in percent      mixer file (/dev/mixer)
 *                                                     NULL on OpenBSD/FreeBSD
 * wifi_essid          WiFi ESSID                      interface name (wlan0)
 * wifi_perc           WiFi signal in percent          interface name (wlan0)
 */

static const struct arg args[] = {
  /* function format                                argument      turn  signal */
  { battery_perc, "  ^c#9ed072^ ^c#cccccc^%s%%", "BAT0", 15, 2 },
  { ram_perc, "  ^c#e7c664^ ^c#cccccc^%s%%", NULL, 10, 5 },
  { datetime, "  ^c#fc5d7c^󰥔 ^c#cccccc^%s ", "%-d %b %R", 60, 3 },
  { battery_notify, "", "BAT0", 30, 4 },
};

/* maximum output string length */
#define MAXLEN CMDLEN *LEN(args)

// { battery_state, "  ^c#006cac^%s", "BAT0", 5, 1 },
// { wifi_perc,      "  ^c#4fc3f7^󰖩 ^c#cccccc^%s%%", "wlp2s0b1" },
// { wifi_essid,     "  ^c#aa00ff^󰖩 ^c#cccccc^%s",   "wlp2s0b1" },
// { datetime,       "^c#ffc107^󰸗 ^c#cccccc^%s",    "%d/%m" },

// #ffc107
// #6CF982
// #006cac
// #4fc3f7
// #aa00ff
// #FF5555
// #ff6b01

// Python strftime cheatsheet
// 🐍🐍🐍
// Code 	Example 	Description
// %a 	Sun 	Weekday as locale’s abbreviated name.
// %A 	Sunday 	Weekday as locale’s full name.
// %w 	0 	Weekday as a decimal number, where 0 is Sunday and 6 is
// Saturday. %d 	08 	Day of the month as a zero-padded decimal
// number.
// %-d 	8 	Day of the month as a decimal number. (Platform specific)
// %b 	Sep 	Month as locale’s abbreviated name.
// %B 	September 	Month as locale’s full name.
// %m 	09 	Month as a zero-padded decimal number.
// %-m 	9 	Month as a decimal number. (Platform specific)
// %y 	13 	Year without century as a zero-padded decimal number.
// %Y 	2013 	Year with century as a decimal number.
// %H 	07 	Hour (24-hour clock) as a zero-padded decimal number.
// %-H 	7 	Hour (24-hour clock) as a decimal number. (Platform specific)
// %I 	07 	Hour (12-hour clock) as a zero-padded decimal number.
// %-I 	7 	Hour (12-hour clock) as a decimal number. (Platform specific)
// %p 	AM 	Locale’s equivalent of either AM or PM.
// %M 	06 	Minute as a zero-padded decimal number.
// %-M 	6 	Minute as a decimal number. (Platform specific)
// %S 	05 	Second as a zero-padded decimal number.
// %-S 	5 	Second as a decimal number. (Platform specific)
// %f 	000000 	Microsecond as a decimal number, zero-padded to 6 digits.
// %z 	+0000 	UTC offset in the form ±HHMM[SS[.ffffff]] (empty string if the
// object is naive). %Z 	UTC 	Time zone name (empty string if the
// object is naive). %j 	251 	Day of the year as a zero-padded decimal
// number.
// %-j 	251 	Day of the year as a decimal number. (Platform specific)
// %U 	36 	Week number of the year (Sunday as the first day of the week) as
// a zero-padded decimal number. All days in a new year preceding the first
// Sunday are considered to be in week 0.
// %-U 	36 	Week number of the year (Sunday as the first day of the week) as
// a decimal number. All days in a new year preceding the first Sunday are
// considered to be in week 0. (Platform specific) %W 	35 	Week number of
// the year (Monday as the first day of the week) as a zero-padded decimal
// number. All days in a new year preceding the first Monday are considered to
// be in week 0.
// %-W 	35 	Week number of the year (Monday as the first day of the week) as
// a decimal number. All days in a new year preceding the first Monday are
// considered to be in week 0. (Platform specific) %c 	Sun Sep 8 07:06:05 2013
// Locale’s appropriate date and time representation. %x 	09/08/13
// Locale’s appropriate date representation. %X 	07:06:05 	Locale’s
// appropriate time representation.
// %% 	% 	A literal '%' character.
