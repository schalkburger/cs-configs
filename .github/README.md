# Darkharden's autoexec

<!--
My Profile: https://steamcommunity.com/id/darkharden
Original Gist: https://gist.github.com/schalkburger/a19cd40175ee026f69d0c033b37d58b1
-->

## Installation

**Copy** `autoexec.cfg` to the following path:
`C:\Steam\steamapps\common\Counter-Strike Global Offensive\csgo\cfg`

Alternatively, create a symbolink link to this repository's `autoexec.cfg` for auto updating.

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

### Reference

```
"VideoConfig"
{
	"setauto.cpu_level"	                    "2" 			// Effects /0 = LOW /1 = MEDIUM /2 = HIGH
	"setauto.gpu_level"					    "3" 			// Shader detail /0 = LOW /1 = MEDIUM /2 = HIGH /3 = VERY HIGH
	"setauto.mat_antialias"				    "2" 			// Anti-Aliasing smoothing edges 0, 1, 2, 4, 8, 16
	"setauto.mat_aaquality"				    "0"			    // Anti-Aliasing Quality 0, 1, 2, 4
	"setauto.mat_forceaniso"			    "1"			    // Anisotropic Filter 0,2,4,8,16
	"setting.mat_vsync"					    "0"			    // Vertical syncronisation /ON = 1 /OFF = 0
	"setting.mat_triplebuffered"		    "0"			    // Triple Buffering /ON = 1 /OFF = 0
	"setting.mat_grain_scale_override"	    "-1.000000"		// Removes the grain effect on the screen.
	"setauto.gpu_mem_level"				    "2"			    // Model-/Texture details /0 = LOW /1 = MEDIUM /2 = HIGH
	"setting.mem_level"					    "2"			    // Additional memory
	"setting.mat_queue_mode"			    "-1"			// Multicore Rendering -1, 0, 1, 2
	"setauto.csm_quality_level"			    "3"			    // Global Shadow Quality /0 = LOW /1 = MEDIUM /2 = HIGH /3 = VERY HIGH
	"setting.mat_software_aa_strength"	    "0"			    // Smoothing edges factor 0, 1, 2, 4, 8, 16
	"setting.mat_motion_blur_enabled"	    "0"			    // Motion sharpness 0, 1
	"setting.mat_texturestreaming"		    "0"			    // Texture streaming
	"setting.r_player_visibility_mode"	    "1"			    //
	"setauto.mat_enable_uber_shaders"	    "1"			    //
	"setting.defaultres"				    "1440"			// Resolution screen x-Axis
	"setting.defaultresheight"			    "1080"			// Resolution screen y-Axis
	"setting.aspectratiomode"			    "0"			    // Screen ratio /0 = 4:3 /1 = 16:9
	"setting.fullscreen"				    "1"			    // Full screen = 1 /Windowed = 0
	"setting.nowindowborder"			    "1"			    // No border limitation in windowed mode /ON = 1 /OFF = 0
}

```

### Mouse Settings

| Setting | Value |
| ------- | ----- |
| Win Sen | 6/11  |
| DPI     | 450   |
| Sens    | 1.75  |

## Crosshair

```bash
cl_crosshairalpha "200"
cl_crosshaircolor "2"
cl_crosshairdot "0"
cl_crosshairgap "-3"
cl_crosshairsize "1.5"
cl_crosshairstyle "4"
cl_crosshairusealpha "1"
cl_crosshairthickness "0.5"
cl_crosshair_sniper_width "1"
cl_crosshair_outlinethickness "1"
cl_crosshair_drawoutline "1"
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
