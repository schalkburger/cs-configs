# Darkharden's autoexec

<!--
My Profile: https://steamcommunity.com/id/darkharden
Original Gist: https://gist.github.com/schalkburger/a19cd40175ee026f69d0c033b37d58b1
-->

## Installation

**Copy** `autoexec.cfg` to the following path:
`C:\Steam\steamapps\common\Counter-Strike Global Offensive\csgo\cfg`

## Launch options

`-novid +exec autoexec`

## Other Settings

### Video Settings

Video resolution forced to `1280x960` with [HotKey Resolution Changer](https://m.majorgeeks.com/files/details/hrc_%C3%82%E2%80%93_hotkey_resolution_changer.html).

`CTRL + ALT + NUMPAD 2` for `1280x960` and `CTRL + ALT + NUMPAD 9` for `1920x1080`

| Setting                          | Value           |
| -------------------------------- | --------------- |
| Aspect Ratio                     | Widescreen 16:9 |
| Resolution                       | 1920x1080       |
| Display Mode                     | Fullscreen      |
| Global Shadow Quality            | High            |
| Model / Texture Detail           | High            |
| Texture Streaming                | Disabled        |
| Effect Detail                    | High            |
| Shader Detail                    | Very High       |
| Boost Player Contrast            | Enabled         |
| Multicore Rendering              | Enabled         |
| Multisampling Anti-Aliasing Mode | 4x MSAA         |
| FXAA Anti-Aliasing               | Disabled        |
| Texture Filtering Mode           | Trilinear       |

To use the **Video Settings**, copy `video.txt` to the following directory and set it to `Read-only`.

`C:\Steam\userdata\949198321\730\local\cfg`

### Mouse Settings

| Setting | Value |
| ------- | ----- |
| Win Sen | 6/11  |
| DPI     | 450   |
| Sens    | 1.75  |

## Crosshair

```bash
crosshair "1"
cl_crosshairstyle "4"
cl_crosshairsize "3"
cl_crosshairthickness "0"
cl_crosshairdot "0"
cl_crosshair_t "0"
cl_crosshair_drawoutline "0"
cl_crosshair_outlinethickness "2"
cl_crosshairgap_useweaponvalue "0"
cl_crosshairgap "-3"
cl_fixedcrosshairgap "-2"
cl_crosshairusealpha "1"
cl_crosshairalpha "255"
cl_crosshaircolor "2"
cl_crosshaircolor_R "255"
cl_crosshaircolor_G "255"
cl_crosshaircolor_B "0"
hud_showtargetid "1"
cl_crosshair_friendly_warning "1"
cl_crosshair_sniper_width "1"
cl_crosshair_sniper_show_normal_inaccuracy "0"
cl_crosshair_dynamic_maxdist_splitratio "0.35"
cl_crosshair_dynamic_splitalpha_innermod "1"
cl_crosshair_dynamic_splitalpha_outermod "0.5"
cl_crosshair_dynamic_splitdist "7"
```

## Binds

```bash
    +--------+ +--------+ +--------+ +--------+
    |        | |        | |        | |        |
    | NUM    | |        | |        | | DEFUSE |
    | LOCK   | |        | |        | |  KIT   |
    |        | |        | |        | |        |
    +--------+ +--------+ +--------+ +--------+
    +--------+ +--------+ +--------+ +--------+
    |        | |        | |        | |        |
    | XM1014 | | MAG 7  | | SCOUT  | |        |
    |        | |        | |        | |        |
    +--------+ +--------+ +--------+ |        |
    +--------+ +--------+ +--------+ |  AWP   |
    |        | |        | |        | |        |
    |  MAC10 | |   MP5  | |   P90  | |        |
    |  MP9   | |        | |        | |        |
    |        | |        | |        | |        |
    +--------+ +--------+ +--------+ +--------+
    +--------+ +--------+ +--------+ +--------+
    |        | |        | |        | |        |
    |  P250  | |  TEC9  | | DEAGLE | |        |
    |        | |        | |        | |   AK   |
    +--------+ +--------+ +--------+ |   M4   |
    +-------------------+ +--------+ |        |
    |                   | |        | |        |
    |       GALIL       | | SG553  | |        |
    |       FAMAS       | |  AUG   | |        |
    |                   | |        | |        |
    +-------------------+ +--------+ +--------+

          +--------+ +--------+ +--------+
          |        | |        | |        |
          |  VEST  | | FLASH  | | MOLLY  |
          |        | |        | |        |
          +------------------------------+
          +--------+ +--------+ +--------+
          |        | |        | |        |
          |  VEST+ | | SMOKE  | |   HE   |
          |  HELM  | |        | |  NADE  |
          |        | |        | |        |
          +--------+ +--------+ +--------+

                    +--------+
                    | BUY &  |
                    | DROP   |
                    | AWP    |
                    |        |
                    +--------+
          +--------+ +--------+ +--------+
          | BUY &  | | BUY &  | | BUY &  |
          | DROP   | | DROP   | | DROP   |
          | GALIL  | | AK/M4  | | SG/AUG |
          |        | |        | |        |
          +--------+ +--------+ +--------+
```
